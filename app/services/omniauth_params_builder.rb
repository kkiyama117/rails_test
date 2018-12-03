# frozen_string_literal: true

# omniauth params
class OmniauthParamsBuilder
  include Service

  def initialize(model_name: nil, auth:)
    @model = model_name
    @auth = auth
  end

  def run
    get_data_with_auth(@auth).slice(column_needed_by_model(@model))
  end

  def column_needed_by_model(model_name)
    if model_name == 'User'
      %i[name email]
      # %i[name email password]
    elsif model_name == 'Authentication'
      %i[provider uid token]
    end
  end

  private

  def get_data_with_auth(auth)
    data = {}
    if auth.fetch('provider') == 'facebook'
      name = auth['extra']['raw_info.name']
      email = auth['info']['email']
      provider = auth['provider']
      uid = auth['uid']
      token = auth['credentials']['token']
      data.update(name: name, email: email, provider: provider, uid: uid, token: token)
    end
    # data.update(password: Devise.friendly_token.first(10))
    data
  end
end
