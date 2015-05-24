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

<<<<<<< HEAD
    redirect_to root_path(saved: true)
=======
    redirect_to '/'
>>>>>>> dd6c71f64ccc56f72e64a893f85771a5c678df07
  end

end
