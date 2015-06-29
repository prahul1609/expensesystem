class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.string :user_id
      t.string :description
      t.string :item_type
      t.timestamp :purchase_date
      t.monetize :amount

      t.timestamps
    end
  end
end
