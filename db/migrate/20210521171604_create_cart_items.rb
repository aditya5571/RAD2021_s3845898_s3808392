class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :product_id
      t.integer :size_id
      t.integer :colour_id
      t.integer :quantity
      t.integer :cart_id

      t.timestamps
    end
  end
end
