class StaticController < ApplicationController

  def index
    @task = Task.get_latest(current_user)
  end
end
