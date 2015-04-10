class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) 
    if user.nil? 
      user = User.create_with_omniauth(auth)
    else
      user = User.update_with_omniauth(user, auth)
    end
    city = City.find_by_name(user.location) 
    city ||= City.create(user.location)
    city.users << user # OR user.city_id = city.id

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