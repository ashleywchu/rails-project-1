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
		cohort = Cohort.create(cohort_params)
		user = User.find(session[:user_id])
		cohort.users << user
		cohort.save
		redirect_to "/users/#{session[:user_id]}"
	end

 	def update 
    @cohort = Cohort.find(params[:id])
     if @cohort.update_attributes(cohort_params)
        redirect_to :action => 'index'#, :id => @cohort
     else
        @cohorts = Cohort.find(:all)
        render :action => 'edit'
     end
 	end

	def edit
		@cohort = Cohort.find(params[:id])
	end
	
	private
	def cohort_params
		params.require(:cohort).permit(:name, :start_date, :end_date)
	end
end
