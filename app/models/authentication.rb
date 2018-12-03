# frozen_string_literal: true

# Authorization for user
class Authentication < ApplicationRecord
  belongs_to :user

  validates_presence_of :user_id, :uid, :provider, :token
  validates_uniqueness_of :uid, scope: :provider
  validates :provider, inclusion: { in: %w[github facebook google] }

  scope :_user_by, -> { joins(:user) }
  scope :find_user_by, lambda { |auth|
    provider = find_by(provider: auth.provider, uid: auth.uid)
    provider.user if provider.present?
  }

  # TODO(kkiyama117): Divide User#Create
  def self.create_with_auth_data(auth, user)
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
    data.update(password: Devise.friendly_token.first(10))
    data
  end
end
