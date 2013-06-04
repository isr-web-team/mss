class User < ActiveRecord::Base
  has_many :events_users
end
