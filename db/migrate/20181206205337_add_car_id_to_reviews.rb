class AddCarIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :car_id, :integer
  end
end
