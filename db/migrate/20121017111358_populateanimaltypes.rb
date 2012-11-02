class Populateanimaltypes < ActiveRecord::Migration
def up

      AnimalType.create([{species: 'Lion'},{species: 'Panda'},{species: 'Koala'}])

  end

  def down
    AnimalType.delete_all
  end
end
