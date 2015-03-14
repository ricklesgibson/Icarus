require 'bcrypt'
class Pilot < ActiveRecord::Base
  has_many :events

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  
  has_secure_password
end
