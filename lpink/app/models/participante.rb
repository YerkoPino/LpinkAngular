class Participante < ActiveRecord::Base
	attr_accessor :password  
	before_save :encrypt_password 
  validates_confirmation_of :password  
  validates_presence_of :password, :on => :create  
  validates_presence_of :email  
  validates_uniqueness_of :email  

  def encrypt_password  
    if password.present?  
      self.password_salt = BCrypt::Engine.generate_salt  
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
    end  
  end 

  def self.authenticate(email, password)  
    participante = find_by_email(email)  
    if participante && participante.password_hash == BCrypt::Engine.hash_secret(password, participante.password_salt)  
      participante  
    else  
      nil  
    end  
  end 
end
