class AddNamesEmailPasswordToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
    add_column :users, :email, :string
    add_column :users, :password_digest, :string
  end
end
