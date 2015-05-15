class Api::V1::TasksController < ApplicationController
  respond_to :json

  def show
    respond_with Task.find(params[:id])
  end

  def index
    respond_with Task.all
  end
end
