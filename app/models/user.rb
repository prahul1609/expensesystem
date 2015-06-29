class User < ActiveRecord::Base
  
  ################Validations#################
  validates :first_name, :role, :mail_id, :password, :password_confirmation, presence: true
  validates_format_of :mail_id ,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i 
  validates :mail_id , uniqueness: true
  validates :first_name , :uniqueness => {:scope => [:last_name], :message => "& Last name combination not available."}
  validates :password, confirmation: true
  ################Associations################
  has_and_belongs_to_many :roles
	has_many :inventories, dependent: :destroy
  ROLE_IDS = [1,2]
  
end
