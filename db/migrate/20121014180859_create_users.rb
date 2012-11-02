class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :address
      t.string :phone
      t.string :dob
      t.string :gender
      t.string :location
      t.string :website

      t.timestamps
    end
  end
end
