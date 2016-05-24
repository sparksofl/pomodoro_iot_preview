require 'net/http'
require 'json'

puts 'Emulation'
print 'Enter your timer token: '
token = gets.chomp.to_s
while true do
  print 'Enter timer duration: '
  duration = gets.chomp.to_i
  uri = URI('http://localhost:4000/pomodoros/')
  params = {'duration' => duration, 'task_id' => nil, 'token' => token}
  res = Net::HTTP.post_form(uri, params)
  sleep duration
  puts
end
