class Car < ApplicationRecord
  belongs_to :user
  belongs_to :type
  has_many	:reviews
  has_attached_file :car_img, styles: { medium: "300x300>", thumb: "100x100>", :quality => 100 }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :car_img, content_type: /\Aimage\/.*\z/
end
