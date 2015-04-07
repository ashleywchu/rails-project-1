class SearchController < ApplicationController
	def index
		search = 	User.find_by_name(params[:keyword]) || 
							Company.find_by_name(params[:keyword]) || 
							Cohort.find_by_name(params[:keyword]) || 
							City.find_by_name(params[:keyword])
		if search 
			if search.class == Company || search.class == City
				redirect_to "/#{search.class.to_s.downcase.gsub("y", "ies")}/#{search.id}"
			else
				redirect_to "/#{search.class.to_s.downcase}s/#{search.id}"
			end
		else
			@fuzzy_search_results = Search.for(params[:keyword])
			render "/search/error" if @fuzzy_search_results.empty?
		end
	end
end