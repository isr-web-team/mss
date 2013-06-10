class Event < ActiveRecord::Base
  has_many :events_users
  has_many :users, :through => :events_users
end
