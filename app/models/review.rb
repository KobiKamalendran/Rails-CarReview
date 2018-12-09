class Review < ApplicationRecord
	# Review is created by user
	# Review is about a car
	belongs_to :user
	belongs_to :car
	# Must have a comment
	validates :comment, presence: true
	# Must have a rating 0-10
	validates :rating, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }, presence: true
end
