class Api::V1::CallbacksController < ApplicationController

  def create
    address = params[:address]
    amount = params[:amount]
    transaction = params[:transaction]

    puts address
    puts amount
    puts transaction

    render json: { success: true }, status: 200
  end
end
