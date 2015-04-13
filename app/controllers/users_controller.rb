class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		if params[:user][:verified] == "true"
			user.verified = true
			user.save
			redirect_to "/unverified"
		else
			user.cohort_id = params[:user][:cohort_id]
			user.save
			render user_path
		end
	end

	def verify
		binding.pry
		user = User.find(params[:id])
	end

  private 
    def set_user
      @user = User.find(params[:id])
    end
end
