class Company < ActiveRecord::Base
	has_many :positions
	has_many :employees, through: :positions
	belongs_to :city

end
