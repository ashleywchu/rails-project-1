class City < ActiveRecord::Base
	has_many :users
	has_many :companies


   def self.create(location)
    create! do |city|
      city.name = location
    end
  end
end
