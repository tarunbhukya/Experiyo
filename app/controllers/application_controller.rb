class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, if: :is_not_format_json?

  before_action :authenticate_request!, if: :is_format_json?

  attr_reader :current_user

  protected



  def authenticate_request!
    unless user_id_in_token?
      render json: { errors: ['Not Authenticated'] }, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end

  def is_format_json?
    request!=nil and request.format.json?
  end

  def is_not_format_json?
    !(request!=nil and request.format.json?)
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
