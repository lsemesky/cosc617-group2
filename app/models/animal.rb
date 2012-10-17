class Animal < ActiveRecord::Base
  belongs_to :zoo
  belongs_to :animal_type
  has_ancestry
  validates :breeding_status, :gender, :dob, :animal_type_id, :presence => true
  attr_accessible :ancestry, :breeding_status, :comments, :dob, :gender, :name, :animal_type_id, :zoo_id
  
end
