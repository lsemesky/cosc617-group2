class AddAnimalColumn < ActiveRecord::Migration
  def change
    add_column(:animals, :father_id, :integer)
    add_column(:animals, :mother_id, :integer)
  end


end
