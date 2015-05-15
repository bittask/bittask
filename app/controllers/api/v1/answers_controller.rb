class Api::V1::AnswersController < ApplicationController

  # get a task to show users
  def create
    task = Task.find(params[:task_id])
    if task.task_type == Task::TYPE_MULTIPLE_CHOICE
      choice = task.choices.index(params[:choice])
    else
      text = params[:text]
    end
    answer = Answer.create(user: current_user, task: task, choice: choice)

    if answer.errors.empty?
      render json: { success: true }, status: 200
    else
      puts answer.errors.first[1]
      render json: { success: false, error: answer.errors.first[1] }, status: 400
    end
  end

  # rescue_from ActiveRecord::RecordNotFound do |e|
  #   render json: { success: false, error: e.message }, status: 400
  # end
end
