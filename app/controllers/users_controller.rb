class UsersController < ApplicationController
  before_filter :current_user
  before_action :set_user, only: [:edit,:update]
  
  def index
      @user = User.all
  end

  def new
  end

  def edit
    if session[:name] == @user.name
      render 'edit'
    else  
       flash[:now] = "Thats not your property"
       session.destroy
       redirect_to '/login/login'
    end
  end
  
  def update  
     if session[:name] == @user.name
     if @user.try(:authenticate,"#{params[:password_old]}")  && @user.admin != true 
       @user.update(name: params[:name],password: params[:password_new],password_confirmation: params[:password_confirmation])
       @user.save
       redirect_to '/users/index'
     else
       flash[:now] = "Wrong password"
       render 'edit'
     end    
     else
       flash[:now] = "Thats not your property"
       session.destroy
       redirect_to '/login/login'
     end  
  end
 
private

  def user_params
     params.permit(:name,:password_old,:password_new,:password_confirmation)
  end 
  
end
