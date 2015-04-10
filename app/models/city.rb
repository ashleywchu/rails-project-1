class City < ActiveRecord::Base
	has_many :users
	has_many :companies

	validates :name, uniqueness: true, presence: true
	
  def self.create(location)
    city = City.new
    city.name = location
    city.save
    city
  end
end
