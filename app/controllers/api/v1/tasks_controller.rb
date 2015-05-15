class Api::V1::TasksController < ApplicationController

  # get a task to show users
  def show
    render json: Task.find(params[:id])
  end

  def index
    render json: Task.all
  end

  def latest
    # Need to filter out tasks user has already seen
    render json: Task.where(active: true).order(cost: :desc).first
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { success: false, error: e.message }, status: 400
  end
end
