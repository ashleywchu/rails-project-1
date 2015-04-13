class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments

	validates_uniqueness_of :user_id, :scope => [:name]
	
	before_validation :ensure_fields_filled
	validates :name, presence: true
	validates :content, presence: true

	private
	def ensure_fields_filled
		if name.empty? && content.empty?

		end
	end
end
