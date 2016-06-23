class UsersController < ApplicationController
  def create
    @user = User.new user_params
    if @user.save
      flash[:notice] = "created user"
      redirect_to '/'
    else
      @new_user = User.new
      render text: "failed #{@user.errors}"
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :location,
      :state,
      :password,
      :password_confirmation
    )
  end

end
