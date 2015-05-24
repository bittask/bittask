class StaticController < ApplicationController

  def index
    @show_header = true
    @task = Task.get_latest(current_user)
  end

  def stats
    @num_tasks = Task.where(active: true).count
    @num_answers = Answer.count
    @total_earned = Answer.connection.select_all("
      select sum(cost)
      from answers a
      left join tasks t on t.id = a.task_id
    ")[0]['sum'].to_i / 100
  end
end
