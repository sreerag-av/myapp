require "rails_helper"

RSpec.describe LoginController, type: :routing do
  describe "routing" do

    it "routes to login#verify_login" do
      expect(:post => "/login/verfiy_login").to route_to("login#verify_login")
    end

    it "routes to users#index" do
      expect(:get => "/users/index").to route_to("users#index")
    end

    it "routes to login#login" do
      expect(:get => "/login/login").to route_to("login#login")
    end 
  end
end
