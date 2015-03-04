require 'bcrypt'
class Owner < ActiveRecord::Base

  has_secure_password
end
