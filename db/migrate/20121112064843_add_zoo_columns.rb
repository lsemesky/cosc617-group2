class AddZooColumns < ActiveRecord::Migration
  def change
    drop_table :zoos
    create_table :zoos do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone
      t.integer :animal_id
      t.string :belongs
      t.date :ed
      t.text :remarks

      t.timestamps
 
    end
  end
end
