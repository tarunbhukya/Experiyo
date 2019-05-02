class JsonWebToken
  def self.encode(payload)
    #TODO: what is Rails.application.secrets.secret_key_base
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.decode(token)
    #TODO: what is HashWithIndifferentAccess
    return HashWithIndifferentAccess.new(JWT.decode(
        token,
        Rails.application.secrets.secret_key_base)[0])    
  rescue
    nil
  end
end
