class AddAttachmentImageToZoos < ActiveRecord::Migration
  def self.up
    change_table :zoos do |t|
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :zoos, :image
  end
end
