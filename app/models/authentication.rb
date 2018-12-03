# frozen_string_literal: true

# Authorization for user
class Authentication < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :uid, :provider, :token
  validates_uniqueness_of :uid, scope: :provider
  validates :provider, inclusion: { in: %w[github facebook google] }

  def self.from_omniauth(auth, user)
    auth = find_or_initialize_by provider: auth.provider, uid: auth.uid
    auth.token = auth.credentials.token

    transaction do
      auth.user ||= user || User.create!(get_user_data_from(auth))
      auth.save! if auth.changed?
    end
    auth
  end

  # Data from auth info
  def self.get_user_data_from(auth)
    data = {}
    if auth.provider == 'facebook'
      name = auth.extra.raw_info.name
      email = auth.info.email
      data = { name: name, email: email }
    end
    data.store('password', Devise.friendly_token.first(10))
    data
  end
end
