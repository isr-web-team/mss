class EventsUser < ActiveRecord::Base
  belongs_to :event
  belongs_to :user
  primary_keys = :user_id, :event_id

  validates :user_id, :presence => { :message => 'ユーザーは必ず入力してください。'}
end
