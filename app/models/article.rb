class Article < ActiveRecord::Base
	validates :title, presence: true, length: {minimum: 3, maximum: 50}
	validates :description, presence: true
	belongs_to :user
end