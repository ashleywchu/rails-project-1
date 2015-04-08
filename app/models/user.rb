class User < ActiveRecord::Base
	has_many :positions, :foreign_key => :employee_id
	has_many :companies, through: :positions
	belongs_to :cohort
	belongs_to :city
	delegate :graduation_date, to: :cohort


 def self.create_with_omniauth(auth)
    create! do |user|
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.location = auth["info"]["location"]
      user.description = auth["info"]["description"]
      user.image_url = auth["info"]["image"]
      user.linkedin_url = auth["info"]["urls"]["public_profile"]
    
      user.provider = auth["provider"]
      user.uid = auth["uid"]
    end
  end

end
