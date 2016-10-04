class LoginController < ApplicationController
  
  def verify_login
    @user = User.find_by(name: "#{params[:name]}").try(:authenticate,"#{params[:password]}")
    if @user 
      session[:name] = params[:name]
      current_user
      
      if @current_user.admin == true
        
        redirect_to '/admin/index'
      else
        redirect_to '/users/edit'
      end    
    else
      render 'login'
    end  
  end
  
  def create
   @user= User.new(user_params)
    if @user.save
      redirect_to '/users/index'
    else
      flash.now[:notice] = "User creation failed"
      render 'signup'  
    end
  end
  
  def logout
    session.destroy
    redirect_to '/login/login'
  end
  
  def user_params
    params.permit(:name,:password,:password_confirmation,:admin)
  end
end
