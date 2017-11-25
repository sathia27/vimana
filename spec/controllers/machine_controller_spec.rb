require 'rails_helper'

RSpec.describe MachineController, type: :controller do
  describe "GET utility" do
    before do
      json_file = File.read(Rails.root.to_s+"/config/machine_updates.json")
      @data = JSON.parse(json_file)
    end
   
    it "should return 200 response code" do
      get :utilize
      expect(response.status).to eq(200)
    end

    it "should return response as json" do
      get :utilize
      expect(response.content_type).to eq("application/json")
    end

    it "should gives all state's percentage" do
      count = @data.collect { |k| k["state"] }.uniq.count
      get :utilize
      expect(JSON.parse(response.body).keys.count).to eq(count)
    end


  end
end
