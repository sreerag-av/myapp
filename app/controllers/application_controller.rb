class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
    @current_user ||= User.find_by_name(session[:name])
    session[:id] = @current_user.id
    redirect_to '/login/login' unless @current_user 
  end
  
  def set_user
    @user = User.find(params[:id] || session[:id])
  end
     
end
