class Zoo < ActiveRecord::Base
  has_many :animals
  attr_accessible :address, :email, :name, :phone, :ed, :belongs, :remarks, :zoo_id, :animal_id
end
