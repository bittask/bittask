class Api::V1::TasksController < ApplicationController

  # get a task to show users
  def show
    render json: Task.find(params[:id])
  end

  def index
    render json: Task.all
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { success: false, error: e.message }, status: 400
  end
end
