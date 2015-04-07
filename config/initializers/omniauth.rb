Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, ENV["linkedin_api_key"], ENV["linkedin_consumer_secret"],  :scope => 'r_fullprofile r_emailaddress r_network', :fields => ["id", "email-address", "first-name", "last-name", "headline", "industry", "picture-url", "public-profile-url", "location", "connections"]
end
