class TasksController < ApplicationController

  def create
    @task = Task.new
    @task.user = current_user
    @task.title = params[:task][:title]
    @task.task_type = Task::TYPE_MULTIPLE_CHOICE # only one supported right now
    @task.choices = params[:task][:choices].split("\n")
    @task.cost = params[:task][:cost]
    @task.image = Cloudinary::Uploader.upload(params[:task][:image])['url'] rescue nil

    if @task.save
      redirect_to task_path(@task)
    else
      render 'tasks/new'
    end
  end

  def new
    @task = Task.new
  end

  # get a task to show users
  def show
    @task = Task.find(params[:id])
  rescue
    redirect_to '/', error: "Task not found"
  end
end
