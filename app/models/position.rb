class Position < ActiveRecord::Base
	belongs_to :company
	belongs_to :employee, :class_name => "User"
end
