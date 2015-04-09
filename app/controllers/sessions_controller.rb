class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    city = City.find_by_name(user.location) || City.create(user.location)
    city.users << user
    session[:user_id] = user.id
    redirect_to "/dashboard", :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

  def new
  end

end