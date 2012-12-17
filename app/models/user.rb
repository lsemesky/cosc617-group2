class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation, :tos, :address, :phone, :dob, :gender, :location, :website, :photo, :admin
  
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_one :zoo
  has_many :animals, :through => :zoo

  before_save :encrypt_password
  before_create :set_admin
  after_save :clear_password
  
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  ADMIN_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.org$/i
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_acceptance_of :tos
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..20, :on => :create
  attr_accessor :password #this means it doesn't get saved in the database
  
  def self.search(search)
    if search
      where('name LIKE ? OR email LIKE ?', "%#{search}%", "%#{search}%")    
    else
      scoped
    end 
  end
  
  def set_admin
    if ADMIN_REGEX.match(email)
      self.admin = true;
     else
       self.admin = false;
    end
    return true
  end
  
 def self.authenticate(email="", login_password="")

    if  EMAIL_REGEX.match(email)    
      user = User.find_by_email(email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end   

  def match_password(login_password="")
    password_hash == BCrypt::Engine.hash_secret(login_password, password_salt)
  end

 def encrypt_password
    unless password.blank?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  def clear_password
    self.password = nil
  end
  
  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end
  
    has_attached_file :photo, :default_url => "default_avatar_:style.png", :styles => { :small => "50x50>", :medium => "100x100>", :profile => "300x300>"}, :default_style => :medium
  
  
end
