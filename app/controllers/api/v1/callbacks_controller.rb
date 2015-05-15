class Api::V1::CallbacksController < ActionController::Base
  protect_from_forgery with: :null_session

  def create
    address = params[:address]
    amount = params[:amount]
    transaction = params[:transaction]

    puts address
    puts amount
    puts transaction

    puts params

    render json: { success: true }, status: 200
  end
end
