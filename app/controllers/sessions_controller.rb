class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user.authenticate params[:user][:password]
      flash[:notice] = "Logged in #{user.full_name}"
      session[:user_id] = user.id
      render text: "login #{user.full_name}"
    else
      @user = User.new
      flash[:alert] = 'Login Failed. pls check your account info.'
      render 'sessions/index'
    end
  end

  def destroy
    session.clear
    render text: "logged out #{session}"
  end

  private

end
