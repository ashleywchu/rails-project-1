class Position < ActiveRecord::Base
	belongs_to :company
	belongs_to :employee, :class_name => "User"

	validates_uniqueness_of :company_id, :scope => [:employee_id]
end
