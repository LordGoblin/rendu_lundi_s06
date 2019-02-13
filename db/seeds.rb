# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do
  user = User.new(password: "lolilol",first_name: Faker::Pokemon.name, last_name: Faker::Color.color_name, email: Faker::Internet.email, description: Faker::Pokemon.move)
  user.save
  puts "lol"
end
puts "ok user"
10.times do
  event = Event.new(start_date: Faker::Date.forward(23), duration: "60", user_id: rand(1..User.count), price: rand(6..666), location: Faker::Address.city, title: Faker::Address.community)
  event.description = Faker::ChuckNorris.fact
  event.save
  puts "mdr"
end
puts "ok event"

20.times do
  attendance = Attendance.new(user_id: rand(1..User.count), event_id: rand(1..User.count))
  attendance.save
  puts "ok"
end
puts "ok atten"