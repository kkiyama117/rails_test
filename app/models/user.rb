# frozen_string_literal: true

# User class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
  validates :name, presence: true, length: { maximum: 15 }, uniqueness: { case_sensitive: false }

  has_many :authentications, dependent: :destroy
  scope :with_auth, -> { joins(:authentications) }
  scope :find_by_auth, lambda { |auth|
    with_auth.merge(Authentication.where(
                      provider: auth.provider, uid: auth.uid
                    )).first
  }

  def self.new_with_session(params, session)
    devise_data = session['devise.user_attributes']
    if devise_data
      user_data = OmniauthParamsBuilder.new(model_name: 'User', auth: devise_data)
      new(user_data) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end
