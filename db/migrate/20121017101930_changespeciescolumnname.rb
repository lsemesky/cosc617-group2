class Changespeciescolumnname < ActiveRecord::Migration
  def change
    rename_column :animals, :species, :animal_type_id
    change_column :animals, :animal_type_id, :integer
  end

end
