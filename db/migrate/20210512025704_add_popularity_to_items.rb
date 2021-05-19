class AddPopularityToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :popularity, :string
  end
end
