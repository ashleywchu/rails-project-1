class User < ActiveRecord::Base
	has_many :positions, :foreign_key => :employee_id
	has_many :companies, through: :positions
	belongs_to :cohort
	belongs_to :city
	delegate :graduation_date, to: :cohort


 def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
    end
  end

end
