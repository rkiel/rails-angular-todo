class HornburgController < ApplicationController

  def approach
  end

  def knock
    user = User.find_by(email: params[:email])
    # If the user exists AND the password entered is correct.
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_uuid] = user.uuid
      redirect_to root_path
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to hornburg_approach_path
    end
  end

  def leave
    session[:user_uuid] = nil
    redirect_to hornburg_approach_path
  end

end
