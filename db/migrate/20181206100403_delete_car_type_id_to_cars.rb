class DeleteCarTypeIdToCars < ActiveRecord::Migration[5.2]
  def change
  	remove_column :cars, :carType_id 
  end
end
