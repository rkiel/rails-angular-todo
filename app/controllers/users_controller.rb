require 'json_web_token'

class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.uuid = SecureRandom.uuid

    if User.find_by(email: user.email).nil? and user.save
      session[:jwt_token] = JsonWebToken.encode(JsonWebToken.payload_for(user))
      redirect_to root_path
    else
      redirect_to users_new_path
    end
  end

  def destroy
  end

private

  def user_params
    params.require(:user).permit(:first, :last, :email, :password, :password_confirmation)
  end

end
