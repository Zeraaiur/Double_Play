class AddRentedToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :rented, :boolean
  end
end
