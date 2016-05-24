json.array!(@pomodoros) do |pomodoro|
  json.extract! pomodoro, :id, :duration, :task_id
  json.url pomodoro_url(pomodoro, format: :json)
end
