# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

categories = ["music", "sports", "poetry", "fitness"]
names = ["swing dancing", "basketball game", "slam poetry", "zumba"]

12.times do
  event = Event.create(name: names.sample, address: Faker::Address.city, description: Faker::Lorem.sentence(word_count: 3), date: Faker::Date.between(from: '2021-02-23', to: '2021-12-31'), category: categories.sample, capacity: rand(10..30))
  puts "Created #{event.name}"
end
