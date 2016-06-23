class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  def redirect_no_auth
    if !session[:user_id]
      flash[:alert] = "Please Log In"
      redirect_to '/'
    end
  end

  def get_user
    User.find_by id: session[:user_id]
  end
end
