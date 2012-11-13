class Zoo < ActiveRecord::Base
  has_many :animals
  attr_accessible :address, :email, :name, :phone, :ed, :belongs, :remarks, :user_id
end
