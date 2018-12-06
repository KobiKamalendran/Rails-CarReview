class AddTypeIdToCars < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :type_id, :integer
  end
end
