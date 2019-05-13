class InformationController < ApplicationController

  def index
    render json: { 'logged_in' => true, 'user' => @current_user.to_json } if @current_user
    render json: { 'logged_in' => false }
  end
end
