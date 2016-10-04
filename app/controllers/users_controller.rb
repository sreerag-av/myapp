class UsersController < ApplicationController
  before_filter :current_user
  before_action :set_user, only: [:edit,:update]
  
  def index
      @user = User.all
  end

  def new
  end

  def edit
  
  end
  
  def update   
     if @user.try(:authenticate,"#{params[:password]}")  
     @user.update(user_params)
     @user.save
  end
 
private

  def user_params
     params.permit(:name,:password,:password_confirmation)
  end 
  
end
