json.array!(@events_users) do |events_user|
  json.extract! events_user, :event_id, :user_id, :attend_flg, :comment
  json.url events_user_url(events_user, format: :json)
end