class Company < ActiveRecord::Base
	has_many :positions
	has_many :employees, through: :positions
	belongs_to :city

	validates_presence_of :name
end
