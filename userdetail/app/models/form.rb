class Form < ActiveRecord::Base
	 attr_accessor :password_e
     before_save :encrypt_password
 
 validates :firstname,presence: true 
 validates :lastname,presence:  true 
 validates :email,presence:  true 
 # validates :password,presence:  true,:format => {:with => /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$/, message: "must be at least 8 characters and include one number one letter and one uppercase"}
 # validates :firstname,:lastname,:email,:password, :length => {:minimum => 2}
 validates_format_of :password,on: :create, :with => /[A-Z]/,:message=>'must have atleast 1 uppercase letter'
 validates_format_of :password,on: :create,:with => /[a-z]/,:message=>'must have atleast 1 lowercase letter'
 validates_format_of :password,on: :create,:with => /[0-9]/,:message=>'must have atleast one digit'  
 validates_format_of :password,on: :create, :with => /[`~!@#$%^&*()_+=-]/,:message=>'must have atleast one special character'
 validates :email, :presence => true,on: :create,:uniqueness => {:case_sensitive => false},format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "Not a valid email Address" }


def encrypt_password
   if true
     self.password = BCrypt::Engine.generate_salt
     self.password= BCrypt::Engine.hash_secret(password_e, password)
   
 end
end
 # def encrypt_password
 #   if true
 #     self.password = BCrypt::Engine.generate_salt
 #     self.password = BCrypt::Engine.hash_secret(password_encrypt,password)
 #   end
end
