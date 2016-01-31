class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.uuid = SecureRandom.uuid

    if user.save
      session[:user_uuid] = user.uuid
      redirect_to '/'
    else
      redirect_to '/users/new'
    end
  end

  def destroy
  end

private

  def user_params
    params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
  end
end
