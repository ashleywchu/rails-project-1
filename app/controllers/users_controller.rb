class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		# new_city = params[:user][:city]
		# check_new_city_present(new_city)
	end

  private 
    def set_user
      @user = User.find(params[:id])
    end
end
