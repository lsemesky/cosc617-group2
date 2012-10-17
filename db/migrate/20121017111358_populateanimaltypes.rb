class Populateanimaltypes < ActiveRecord::Migration
def up
    types = ['Lion','Panda','Koala']
    for type in types
        AnimalType.create(:species=>type)
    end
  end

  def down
    State.delete_all
  end
end
