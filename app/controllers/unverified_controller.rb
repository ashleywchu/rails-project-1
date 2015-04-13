class UnverifiedController < ApplicationController
	def index
		@unverified_list = User.where(:verified => false) 
	end
end
