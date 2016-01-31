require 'json_web_token'

class HornburgController < ApplicationController

  def approach
  end

  def knock
    user = User.find_by(email: params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      session[:jwt_token] = JsonWebToken.encode(JsonWebToken.payload_for(user))
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to hornburg_approach_path
    end
  end

  def leave
    session[:jwt_token] = nil
    redirect_to hornburg_approach_path
  end

end
