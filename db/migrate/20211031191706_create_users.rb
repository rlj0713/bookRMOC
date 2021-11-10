class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.integer :uid
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :picture

      t.timestamps
    end
  end
end
