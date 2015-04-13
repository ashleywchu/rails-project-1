class User < ActiveRecord::Base
	has_many :positions, :foreign_key => :employee_id
	has_many :companies, through: :positions
	belongs_to :cohort
	belongs_to :city
	delegate :graduation_date, to: :cohort

  has_many :posts
  has_many :comments

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

    user.verified = true if user.name == "Lewaa Bahmad" #|| user.name == "Ashley Chu"

    user.save
    user
  end

   def self.update_with_omniauth(user, auth)
    user.name = auth["info"]["name"]
    user.email = auth["info"]["email"]
    user.location = auth["info"]["location"]
    user.description = auth["info"]["description"]
    user.image_url = auth["info"]["image"]
    user.linkedin_url = auth["info"]["urls"]["public_profile"]
    update_positions(user, auth)
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.save
    user
  end

  def self.update_positions(user, auth)
    company_hashes = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"]
    if company_hashes
      company_hashes.each do |hash|
        company = Company.find_or_create_by(:name => hash["company"]["name"])
        position = Position.find_by(:employee_id => user.id, :company_id => company.id)
        position ||= Position.new(:company_id => company.id, :employee_id => user.id)
        if hash["title"] 
          position.title = hash["title"]
        end
        if hash["startDate"]
          position.start_month = hash["startDate"]["month"] if hash["startDate"]["month"]
          position.start_year = hash["startDate"]["year"] if hash["startDate"]["year"]
        end
        position.save
      end
    end
  end

  def self.make_positions(user, auth)
    company_hashes = auth["extra"]["raw_info"]["threeCurrentPositions"]["values"]
    if company_hashes
      company_hashes.each do |hash|
        company = Company.find_or_create_by(:name => hash["company"]["name"])
        position = Position.new(:company_id => company.id)
        position.title = hash["title"] if hash["title"] 
        if hash["startDate"]
          position.start_month = hash["startDate"]["month"] if hash["startDate"]["month"]
          position.start_year = hash["startDate"]["year"] if hash["startDate"]["year"]
        end
        position.save
        # binding.pry
        
        user.positions << position
      end
    end
  end

end
