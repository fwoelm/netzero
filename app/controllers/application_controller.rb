class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  helper_method :current_user

  def is_signed_in
    return current_user
  end
  
  helper_method :is_signed_in
  
  def authorize
    redirect_to '/login' unless current_user
  end
  
end
