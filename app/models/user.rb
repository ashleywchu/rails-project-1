class User < ActiveRecord::Base
	has_many :companies
	belongs_to :cohort
	belongs_to :city
	delegate :graduation_date, to: :cohort
end
