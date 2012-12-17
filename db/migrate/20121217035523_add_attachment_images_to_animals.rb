class AddAttachmentImagesToAnimals < ActiveRecord::Migration
  def self.up
    change_table :animals do |t|
      t.attachment :images
    end
  end

  def self.down
    drop_attached_file :animals, :images
  end
end
