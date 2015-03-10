class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :owner
  belongs_to :pilot
end
