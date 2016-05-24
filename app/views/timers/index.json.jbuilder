json.array!(@timers) do |timer|
  json.extract! timer, :id, :user_id, :token
  json.url timer_url(timer, format: :json)
end
