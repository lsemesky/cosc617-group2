class Animal < ActiveRecord::Base
  belongs_to :user
  belongs_to :zoo
  validates :breeding_status, :gender, :dob, :animal_type, :presence => true
  attr_accessible :ancestry, :breeding_status, :comments, :dob, :gender, :name, :animal_type, :zoo_id, :mother_id, :father_id

  has_many :fathered_children, :class_name => "Animal", :foreign_key => :father_id
  has_many :mothered_children, :class_name => "Animal", :foreign_key => :mother_id
   belongs_to :father, :class_name => "Animal"
   belongs_to :mother, :class_name => "Animal"

 before_save :set_parents
 validate :correct_parent_gender, :parents_share_species
 
 def correct_parent_gender()
   unless mother_id.blank?
     if mother.gender == 'male'
       errors.add :base, 'trying to assign male animal to mother'
     end
   end
   
   unless father_id.blank?
     if father.gender == 'female'
       errors.add :base, 'trying to assign female animal to father'
     end
   end  
 end
 
 def parents_share_species()
   unless mother_id.blank?
      new_mother = Animal.find(mother_id)
      if new_mother.animal_type != self.animal_type
        errors.add :base, 'mother species does not match child species'
      end
   end
   
   unless father_id.blank?
     new_father = Animal.find(father_id)
     if new_father.animal_type != self.animal_type
        errors.add :base, 'father species does not match child species'
     end
   end   
 end
 
 def set_parents()
   unless mother_id.blank?
      new_mother = Animal.find(mother_id)
      self.mother = new_mother
   end
   
   unless father_id.blank?
     new_father = Animal.find(father_id)
     self.father = new_father
   end
 end
 

  def children
    if self.gender == 'male'
      fathered_children
    elsif self.gender == 'female'
      mothered_children
    else
      nil
    end   
  end

  def siblings
    ((self.father ? self.father.children : []) +
    (self.mother ? self.mother.children : [])
    ).uniq - [self]
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")    
    else
      scoped
    end 
  end

  def compatible_mates
    if !(self.gender && self.mother? && self.father?)
      if !self.gender?
        errors.add :base, 'Cannot determine compatible mates without animal gender'
        
      end
      if !(self.mother? && self.father?)  
        errors.add :base, 'Need both parent IDs before finding compatible mates'
      end
   
    elsif self.gender == 'male'
       Animal.where(:breeding_status => 'viable', :gender => 'female') - self.decendants - self.ancestors
    else #self.gender == 'female'
       Animal.where(:breeding_status => 'viable', :gender => 'male') - self.decendants - self.ancestors
      
    end
  end
  
  def decendants
    children.map(&:descendans).flatten - [self]
  end
  
  def ancestors
    ([mother, mother.try(:ancestors)].compact.flatten + [father, father.try(:ancestors)].compact.flatten).uniq - [self]
  end
end
