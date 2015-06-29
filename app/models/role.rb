class Role < ActiveRecord::Base
  
  ##########Constants##########
  ROLES=['Admin','User']
  
  ##########Associations#######
  has_and_belongs_to_many :users
end