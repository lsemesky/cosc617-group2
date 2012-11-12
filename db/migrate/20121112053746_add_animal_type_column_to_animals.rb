class AddAnimalTypeColumnToAnimals < ActiveRecord::Migration
  def change
    add_column(:animals, :animal_type, :string)
    remove_column(:animals, :animal_type_id)
  end
end
