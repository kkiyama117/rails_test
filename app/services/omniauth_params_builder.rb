# frozen_string_literal: true

# omniauth params
class OmniauthParamsBuilder
  include Service

  def initialize(model_name: nil, auth:)
    @model = model_name
    @auth = auth
  end

  def run
    needed = column_needed_by_model @model
    data = get_data_with_auth(@auth)
    if needed.blank?
      data
    else
      get_hash_with_keys needed, data
    end
  end

  def get_hash_with_keys(keys, data)
    result = {}
    keys.each do |key|
      result.update(data.slice(key))
    end
    result
  end

  def column_needed_by_model(model_name)
    if model_name == 'User'
      %i[name email]
      # %i[name email password]
    elsif model_name == 'Authentication'
      %i[provider uid token]
    elsif model_name.blank?
      nil
    else
      raise ValueError('error')
    end
  end

  private

  def get_data_with_auth(auth)
    data = {}
    if auth.fetch('provider') == 'facebook'
      name = auth['info']['name']
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
