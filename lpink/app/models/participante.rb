class Participante < ActiveRecord::Base
	attr_accessor :password  
	before_save :encrypt_password  
	validates_confirmation_of :password  
	validates_presence_of :password, :on => :create  
	validates_presence_of :participante_email  
	validates_uniqueness_of :participante_email

	def encrypt_password  
	    if password.present?  
	      self.password_salt = BCrypt::Engine.generate_salt  
	      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)  
	    end  
  	end

  	def self.authenticate(email, password)  
	    user = find_by_participante_email(email)  
	    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)  
	      user  
	    else  
	      nil  
	    end  
  	end  
end
