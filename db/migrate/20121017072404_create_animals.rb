class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.integer :zoo_id
      t.string :name
      t.string :gender
      t.string :breeding_status
      t.date :dob
      t.string :ancestry
      t.text :comments
      t.string :species

      t.timestamps
    end
  end
end
