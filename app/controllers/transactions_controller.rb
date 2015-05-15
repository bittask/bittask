class TransactionsController < ApplicationController

  def index

  end

  def create
    if Bitcoin.valid_address?(params[:address])
      u = current_user
      u.address = params[:address]
      u.save!
      begin
        u.withdraw
        flash[:notice] = "Success!"
      rescue Coinbase::Client::Error => e
        flash[:alert] = "Error: #{e.message}"
      end
    else
      flash[:alert] = "Invalid bitcoin address"
    end
    redirect_to transactions_path
  end

end
