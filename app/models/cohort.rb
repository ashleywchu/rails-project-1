class Cohort < ActiveRecord::Base
	has_many :users

	validates :cohort, presence: true, uniqueness: true
	validates_presence_of :start_date, :end_date
end
