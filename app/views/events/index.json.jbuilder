json.array!(@events) do |event|
  json.extract! event, :name, :brief, :date
  json.url event_url(event, format: :json)
end