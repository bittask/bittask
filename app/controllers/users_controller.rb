class UsersController < ApplicationController

  # get a task to show users
  def show
    render json: User.find(params[:id])
  end

  def index
    render json: current_user
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { success: false, error: e.message }, status: 400
  end
end
