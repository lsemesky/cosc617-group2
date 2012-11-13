class ChangeZooAnimalIdColumn < ActiveRecord::Migration
  def change
    rename_column(:zoos, :animal_id, :user_id)
  end


end
