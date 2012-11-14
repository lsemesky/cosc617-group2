class Animal < ActiveRecord::Base
  
 # before_save :is_valid_parent
  
  belongs_to :zoo
 # belongs_to :animal_type
 # has_ancestry
  validates :breeding_status, :gender, :dob, :animal_type, :presence => true
  attr_accessible :ancestry, :breeding_status, :comments, :dob, :gender, :name, :animal_type, :zoo_id, :mother_id, :father_id
  
 

  has_many :fathered_children, :class_name => "Animal", :foreign_key => :father_id
  has_many :mothered_children, :class_name => "Animal", :foreign_key => :mother_id
  belongs_to :father, :class_name => "Animal" 
  belongs_to :mother, :class_name => "Animal" 
  
  def has_valid_parents
    mother = Animal.find(mother_id)
    father = Animal.find(father_id)
    if animal_type != mother.animal_type || animal_type != father.animal_type
      errors = "parent type does not match animal type"
      return false
    end
    if mother.gender != 'female' || father.gender != 'male'
      errors = "parent gender mismatch"
      return false
    end
    return true
  end

end
