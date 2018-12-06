class AddCarTypeIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :carType_id, :integer
  end
end
