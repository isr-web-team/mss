class Event < ActiveRecord::Base
  has_many :events_users
end
