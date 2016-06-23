class SessionsController < ApplicationController
  def index
    @user = User.new
    @new_user = User.new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      flash[:notice] = "Logged in #{user.full_name}"
      session[:user_id] = user.id
      session[:user_name] = "#{user.first_name} #{user.last_name}"
      flash[:notice] =  "login #{user.full_name}"
      redirect_to '/events'
    else
      @user = User.new
      @new_user = User.new
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
