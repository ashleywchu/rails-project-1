class User < ActiveRecord::Base
	has_many :positions, :foreign_key => :employee_id
	has_many :companies, through: :positions
	belongs_to :cohort
	belongs_to :city
	delegate :graduation_date, to: :cohort


 def self.create_with_omniauth(auth)
    user = User.new
    user.name = auth["info"]["name"]
    user.email = auth["info"]["email"]
    user.location = auth["info"]["location"]
    user.description = auth["info"]["description"]
    user.image_url = auth["info"]["image"]
    user.linkedin_url = auth["info"]["urls"]["public_profile"]
    make_positions(user, auth)
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.save
    user
  end

  def self.make_positions(user, auth)
    company_hashes = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"]
    if company_hashes
      company_hashes.each do |hash|
        company = Company.find_or_create_by(:name => hash["company"]["name"])
        positon = Position.new(:company_id => company.id)
        positon.title = hash["title"] if hash["title"] 
        if hash["startDate"]
          positon.start_month = hash["startDate"]["month"] if hash["startDate"]["month"]
          positon.start_year = hash["startDate"]["year"] if hash["startDate"]["year"]
        end
        positon.save
        user.positions << positon
      end
    end
  end

end
