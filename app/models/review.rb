class Review < ApplicationRecord
	belongs_to :user
	belongs_to :car
	validates :comment, presence: true
	validates :rating, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 0 }, presence: true
end
