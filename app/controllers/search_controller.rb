class SearchController < ApplicationController
	def index
		search = 	User.find_by_name(params[:users_keyword]) || 
							Company.find_by_name(params[:companies_keyword]) || 
							Cohort.find_by_name(params[:cohorts_keyword]) || 
							City.find_by_name(params[:cities_keyword])
		if search 
			if search.class == Company || search.class == City
				redirect_to "/#{search.class.to_s.downcase.gsub("y", "ies")}/#{search.id}"
			else
				redirect_to "/#{search.class.to_s.downcase}s/#{search.id}"
			end
		else
			@fuzzy_search_results = Search.for(params)
			render "/search/error" if 	@fuzzy_search_results[:user_results].empty? &&
																	@fuzzy_search_results[:company_results].empty? &&
																	@fuzzy_search_results[:cohort_results].empty? &&
																	@fuzzy_search_results[:city_results].empty?
		end
	end
end