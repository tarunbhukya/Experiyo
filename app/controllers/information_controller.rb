class InformationController < ApplicationController
  before_action :authenticate_request!


  def index
    render json: {'user': current_user.to_json, 'signed_in': user_signed_in?}
  end
end
