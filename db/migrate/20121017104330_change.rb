class Change < ActiveRecord::Migration
  def change
    rename_column :animal_types, :animal_type, :species
  end


end
