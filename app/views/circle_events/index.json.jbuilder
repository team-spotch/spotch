json.array!(@circle_events) do |circle_event|
  json.extract! circle_event, :id, :title, :desc, :event_date, :place, :one_phrase
  json.url circle_event_url(circle_event, format: :json)
end
