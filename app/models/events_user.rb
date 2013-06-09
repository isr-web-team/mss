class EventsUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  primary_keys = :user_id, :event_id
end
