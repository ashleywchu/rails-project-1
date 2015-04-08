class Company < ActiveRecord::Base
	has_many :positions
	has_many :employees, through: :positions
	belongs_to :city

  def self.scrape_profile(linkedin_url)
    profile = Linkedin::Profile.get_profile(linkedin_url)
  end

  def self.find_or_create_scraped_companies(companies)
    companies.each do |company|
      Company.find_by_name(company[:company]) || Company.create({:name => company[:company]})
    end
  end
end
