class UpdateUserIdToNotNullColInInventory < ActiveRecord::Migration
  def change
		change_column_null :inventories, :user_id, false
  end
end
