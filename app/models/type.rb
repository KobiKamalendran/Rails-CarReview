class Type < ApplicationRecord
	# Category to define cars
	# Many cars fall into a single category
	has_many :cars
end
