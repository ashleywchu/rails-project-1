# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def make_seeds
	make_cities
	make_cohorts
	make_companies
	make_users
	make_positions
end

def make_cities
	City.create(name: "New York City")
	City.create(name: "San Francisco")
	City.create(name: "Los Angeles")
  # ["New York City", "San Francisco", "Los Angeles"].each {|n| City.create(name: n) }
end

def make_cohorts
	Cohort.create(name: "BK000", start_date: '2013-01-15', end_date: '2013-06-15')
	Cohort.create(name: "BK001", start_date: '2014-01-15', end_date: '2014-06-15')
	Cohort.create(name: "BK002", start_date: '2015-01-15', end_date: '2015-06-15')
end

def make_companies
	Company.create(name: "Facebook", city_id: 1)
	Company.create(name: "Tumblr", city_id: 2)
	Company.create(name: "Etsy", city_id: 1)
	Company.create(name: "Linkedin", city_id: 3)
end

def make_users
  User.create(name: "Lewaa", city_id: 1, cohort_id: 1, current_student: false, claimed: true)
  User.create(name: "Geraldina", city_id: 2, cohort_id: 2, current_student: true, claimed: false)
  User.create(name: "Ashley", city_id: 1, cohort_id: 3, current_student: false, claimed: true)
  User.create(name: "Bobby", city_id: 1, cohort_id: 1, current_student: false, claimed: false)
  User.create(name: "Andrea", city_id: 3, cohort_id: 2, current_student: true, claimed: false)
end

def make_positions
	Position.create(employee_id: 1, company_id: 1)
	Position.create(employee_id: 1, company_id: 2)
	Position.create(employee_id: 2, company_id: 3)
	Position.create(employee_id: 3, company_id: 4)
end

make_seeds
