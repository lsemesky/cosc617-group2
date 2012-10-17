class AnimalType < ActiveRecord::Base
  attr_accessible :animal_type
  has_many :animals
end
