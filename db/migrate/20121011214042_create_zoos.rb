class CreateZoos < ActiveRecord::Migration
  def change
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
