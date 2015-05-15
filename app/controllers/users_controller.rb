class UsersController < ApplicationController

  # get a task to show users
  def show
    @user = User.find(params[:id])
    @tasks = Task.for_user(@user)
  end

  def index
    @user = current_user
    @tasks = Task.for_user(@user)
    redirect_to user_path(current_user.id)
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { success: false, error: e.message }, status: 400
  end
end
