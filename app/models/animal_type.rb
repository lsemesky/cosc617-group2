class AnimalType < ActiveRecord::Base
  attr_accessible :species
  has_many :animals
end
