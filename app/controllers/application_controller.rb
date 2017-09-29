class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :authorize

#need to make methods for current user, 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    #return current user, or if there isnt one, set it to current user, if there is a current user
    #will return either user who made a request, or nil
  end
  def logged_in?
    !!current_user
  end

  def authorize
    unless logged_in?
      flash[:danger] = "you must be logged in to view that"
      redirect_to new_session_path
    end
  end
  

end
