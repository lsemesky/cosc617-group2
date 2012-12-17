class Zoo < ActiveRecord::Base
  has_many :animals
  belongs_to :user
  attr_accessible :address, :email, :name, :phone, :ed, :belongs, :remarks, :user_id, :image
  
    
  def self.search(search)
    if search
      where('name LIKE ? OR address LIKE ?', "%#{search}%", "%#{search}%")    
    else
      scoped
    end 
  end 
  
  has_attached_file :image, :styles => { :small => "70x50>", :medium =>"140x100>", :profile => "280x200>" }, :default_style => :medium, :default_url => "default_zoo.png"
end
