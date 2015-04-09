class CohortsController < ApplicationController
	def new
		@cohort = Cohort.new
	end

	def index
		@cohorts = Cohort.all
	end

	def show
		@cohort = Cohort.find(params[:id])
	end

	def create
		@cohort = Cohort.create(post_params)
		@user = User.find(session[:user_id])
		@cohort.users << @user
		redirect_to "/users/#{session[:user_id]}"
	end

	def edit

	end
	
	private
	def post_params
		params.require(:cohort).permit(:name, :start_date, :end_date)
	end

end
