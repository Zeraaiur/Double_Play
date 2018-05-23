class FixColunAddress < ActiveRecord::Migration[5.2]
  def change
    rename_column User, :city, :address
  end
end
