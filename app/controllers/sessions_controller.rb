class SessionsController < ApplicationController
  skip_before_filter :require_login
  
  def create
    auth = request.env["omniauth.auth"]
    # binding.pry
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    # user = User.find_by_provider_and_uid if user == true
    city = City.find_by_name(user.location) || City.create(user.location)
    # city = City.find_by_name(user.location) if city == true
    city.users << user
    # scrapped_profile = Company.scrape_profile(user.linkedin_url)
    # Company.find_or_create_scraped_companies(scrapped_profile.current_companies)
    # Company.find_or_create_scraped_companies(scrapped_profile.past_companies)
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