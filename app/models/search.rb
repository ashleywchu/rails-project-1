class Search
	def self.for(params)
		results = {:user_results => [], :company_results => [], :cohort_results => [], :city_results => []}
		
		user_results = []
		user_results << User.where("name LIKE ?", "%#{params[:users_keyword]}%") if params[:users_keyword] != nil && params[:users_keyword] != ""
		# # users = User.where("name LIKE ?", "%#{params[:users_keyword]}%") if params[:users_keyword]
		# users.each do |user|
		# 	user_results << user
		# end

		company_results = []
		company_results << Company.where("name LIKE ?", "%#{params[:companies_keyword]}%") if params[:companies_keyword] != nil && params[:companies_keyword] != ""
		company_results.each do |company_result|
			company_result.each do |company|
				position = Position.find_by_company_id(company.id)
				user_results << User.find(position.employee_id) if position
			end
		end

		cohort_results = []
		cohort_results << Cohort.where("name LIKE ?", "%#{params[:cohorts_keyword]}%") if params[:cohorts_keyword] != nil && params[:cohorts_keyword] != ""
		cohort_results.each do |cohort_result|
			cohort_result.each do |cohort|
				user_results << Cohort.find(cohort.id).users
			end
		end

		city_results = []
		city_results << City.where("name LIKE ?", "%#{params[:cities_keyword]}%") if params[:cities_keyword] != nil && params[:cities_keyword] != ""
		city_results.each do |city_result|
			city_result.each do |city|
				user_results << City.find(city.id).users
			end
		end

		results[:user_results] = user_results.flatten.uniq
		results[:company_results] = company_results
		results[:cohort_results] = cohort_results
		results[:city_results] = city_results

		results
	end
end