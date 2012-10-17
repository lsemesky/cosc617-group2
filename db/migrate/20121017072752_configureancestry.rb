class Configureancestry < ActiveRecord::Migration
  def up
    add_index :animals, :ancestry
  end

  def down
    remove_index :animals, :ancestry
  end
end
