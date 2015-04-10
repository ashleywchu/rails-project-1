class UsersController < ApplicationController
	def index
		@users = User.all
	end

	def show
		@user = User.find(params[:id])
	end

	def update
		user = User.find(params[:id])
		user.cohort_id = params[:user][:cohort_id]
		user.save
		render user_path
	end

  private 
    def set_user
      @user = User.find(params[:id])
    end
end
