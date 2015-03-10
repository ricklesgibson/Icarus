require 'bcrypt'
class Owner < ActiveRecord::Base
  has_many :events
  has_secure_password
end
