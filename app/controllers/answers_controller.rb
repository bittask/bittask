class AnswersController < ApplicationController

  # get a task to show users
  def create
    task = Task.find(params[:task_id])
    if task.task_type == Task::TYPE_MULTIPLE_CHOICE
      choice = task.choices.index(params[:choice])
    else
      text = params[:text]
    end
    answer = Answer.create(user: current_user, task: task, choice: choice) rescue nil

    redirect_to '/'
  end

end
