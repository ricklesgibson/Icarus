require 'bcrypt'
class Pilot < ActiveRecord::Base

  has_secure_password
end
