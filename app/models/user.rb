class User < ApplicationRecord
  has_many :reviews
  validates :email, presence:true
  validates :password, presence:true, length: {minimum:8}
end
