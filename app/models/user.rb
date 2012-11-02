class User < ActiveRecord::Base

  attr_accessible :name, :email, :password, :password_confirmation, :tos, :address, :phone, :dob, :gender, :location, :website
  
  
  before_save :encrypt_password
  after_save :clear_password

  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates :password, :confirmation => true
  validates_acceptance_of :tos
  #Only on Create so other actions like update password attribute can be nil
  validates_length_of :password, :in => 6..20, :on => :create
  attr_accessor :password #this means it doesn't get saved in the database
  
  
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
end
