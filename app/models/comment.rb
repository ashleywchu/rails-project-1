class Comment < ActiveRecord::Base
	belongs_to :post
	belongs_to :user

	validates :name, presence: true
	validates :content, presence: true
end
