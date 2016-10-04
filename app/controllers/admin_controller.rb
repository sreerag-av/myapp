class AdminController < ApplicationController
  before_filter :current_user
  before_action :set_user,only: [:update,:edit,:destroy]

  
  def index
      @user = User.all
  end

  def new
  end
  
  def edit
  end

  def update     
     @user.update(user_params)
     @user.save
  end
  
  def create
   @user= User.new(user_params)
    if @user.save
      redirect_to '/users/index'
    else
      flash.now[:notice] = "User creation failed"
      render admin_edit_path  
    end
  end
  
  def destroy
     if @user.admin == true 
       flash[:now] = "Admins can't be deleted"
       redirect_to '/admin/index'
     else   
       @user.destroy
       redirect_to '/admin/index'
     end  
  end
  
private
  def set_user
    @user = User.find(params[:id])
  end
     
  def user_params
     params.permit(:name,:password,:password_confirmation,:admin)
  end 
  
end
