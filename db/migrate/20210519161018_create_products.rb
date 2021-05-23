class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    
    create_table :products do |t|
      t.string :company
      t.string :title
      t.string :size
      t.decimal :price
      t.string :imageString

      t.timestamps
    end
  end
end
