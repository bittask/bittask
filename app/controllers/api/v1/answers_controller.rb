class Api::V1::AnswersController < ApplicationController

  # get a task to show users
  def create
    puts params[:choice]
    puts params[:task_id]
    puts current_user.id
    task = Task.find(params[:task_id])
    choice = task.choices.index(params[:choice])
    answer = Answer.create!(user: current_user, task: task, choice: choice) rescue nil

    if answer
      render json: { success: true }, status: 200
    else
      render json: { success: false }, status: 400
    end
  end

  # rescue_from ActiveRecord::RecordNotFound do |e|
  #   render json: { success: false, error: e.message }, status: 400
  # end
end
