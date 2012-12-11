class Zoo < ActiveRecord::Base
  has_many :animals
  belongs_to :user
  attr_accessible :address, :email, :name, :phone, :ed, :belongs, :remarks, :user_id
  
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")    
    else
      scoped
    end 
  end
end
