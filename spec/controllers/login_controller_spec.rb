require 'rails_helper'

RSpec.describe LoginController, type: :controller do

let(:user_params) {
    skip(:name,:password,:password_confirmation)
  }

  let(:valid_session) { {} }
  
  describe "get #login" do
    it "renders login page" do
      get :login, params: {}, session: valid_session
      expect(response).to render_template('login')
    end
  end

  describe "POST #verify_login" do
    it "fails login" do
     post :verify_login, params: {name: "t1",password: "t"}, session: valid_session
     expect(response).to render_template('login')
    end
    
    it "logins in" do
     post :verify_login, params: {"name"=>"test", "password"=>"test"}, session: valid_session
     expect(:verify_login).to render_template('users/index')
    end
  end
end
