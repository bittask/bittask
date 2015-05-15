require 'spec_helper'

describe Api::V1::TasksController do

  describe "GET #show" do
    before(:each) do
      @task = FactoryGirl.create :task
      get :show, id: @task.id, format: :json
    end

    it "returns the information about a reporter on a hash" do
      r = JSON.parse(response.body, symbolize_names: true)
      expect(r[:title]).to eql @task.title
    end

    it { expect(response.status).to eq(200) }
  end
end