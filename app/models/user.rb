class User < ActiveRecord::Base
  has_many :events_users
  has_many :events, :through => :users
end
