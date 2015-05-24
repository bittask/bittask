class CallbacksController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    task = Task.where(address: params[:address]).first
    if task
      amount = (params[:amount] * 100_000_000).to_i
      task.increase_balance(amount)
    end

    render json: { success: true }, status: 200
  end
end
