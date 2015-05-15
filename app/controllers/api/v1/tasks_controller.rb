class Api::V1::TasksController < ApplicationController

  # get a task to show users
  def show
    render json: Task.find(params[:id])
  end

  def index
    render json: Task.all
  end

  def latest
    # Tasks that user has answered
    tasks = Answer.select("task_id").user(current_user.id)
    # Tasks that user has not answered ordered by descending cost
    task = Task.where.not(id: tasks).order(cost: :desc).first

    render json: task
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { success: false, error: e.message }, status: 400
  end
end
