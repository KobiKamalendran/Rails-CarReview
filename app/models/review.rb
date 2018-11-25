class Review < ApplicationRecord
  belongs_to :user
  validates :rating, presence:true, numericality: { only_integer: true, greater_than: 0, less_than: 11}
  validates :message, presence:true
end
