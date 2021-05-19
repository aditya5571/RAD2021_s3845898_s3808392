class AddPopularityToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :popularity, :string
  end
end
