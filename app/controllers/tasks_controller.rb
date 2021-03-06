class TasksController < ApplicationController

  def create
    @task = Task.new
    @task.user = current_user
    @task.title = params[:task][:title]
    @task.task_type = Task::TYPE_MULTIPLE_CHOICE # only one supported right now
    @task.choices = params[:task][:choices].split("\n")
    @task.cost = (params[:task][:cost].to_i * 100) rescue nil
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
    @answers = @task.answers
    @num = @answers.count
    @total = @answers.count + @task.balance / @task.cost
    if @task.is_multiple_choice?
      @data = Array.new(@task.choices.count, 0)
      @answers.each do |a|
        @data[a.choice] += 1
      end
    end
  end


end
