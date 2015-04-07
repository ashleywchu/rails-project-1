class Search
	def self.for(search_term)
		results = []
		results << User.where("name LIKE ?", "%#{search_term.downcase}%")								
		results << Company.where("name LIKE ?", "%#{search_term.downcase}%")
		results << Cohort.where("name LIKE ?", "%#{search_term.downcase}%")
		results << City.where("name LIKE ?", "%#{search_term.downcase}%")
		results.flatten
	end
end

# Company.where("name LIKE ?", "%#{search_term.downcase}%") &&
# Cohort.where("name LIKE ?", "%#{search_term.downcase}%")
# City.where("name LIKE ?", "%#{search_term.do