class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates_uniqueness_of :user_id, :scope => [:name]
	
	validates :name, presence: true
	validates :content, presence: true
end
