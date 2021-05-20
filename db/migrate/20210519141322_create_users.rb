class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    
    create_table :users do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.string :password_digest
      t.string :uid
      t.string :provider

      t.timestamps
    end
  end
end
