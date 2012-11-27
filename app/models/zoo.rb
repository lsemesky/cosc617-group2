class Zoo < ActiveRecord::Base
  has_many :animals
  attr_accessible :address, :email, :name, :phone, :ed, :belongs, :remarks, :user_id
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")    
    else
      scoped
    end 
  end
end
