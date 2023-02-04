# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database ..."


Station.destroy_all

puts "Creating 4 stations"

station_1 = Station.create!(name: "Station 1")
station_2 = Station.create!(name: "Station 2")
station_3 = Station.create!(name: "Station 3")
station_4 = Station.create!(name: "Station 4")

puts "4 stations created"

Category.destroy_all

puts "Creating 4 categories"

category_1 = Category.create!(name: "Outdoor Adventure")
category_2 = Category.create!(name: "Cultural Excursion")
category_3 = Category.create!(name: "Water Activities")
category_4 = Category.create!(name: "Historical Sites")

puts "4 categories created"

User.destroy_all

puts "Creating 4 users"

user_1 = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
user_2 = User.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@example.com", password: "password")
user_3 = User.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@example.com", password: "password")
user_4 = User.create!(first_name: "Alice", last_name: "Johnson", email: "alicejohnson@example.com", password: "password")



Itinerary.destroy_all

puts "creating 4 itineraries ..."

itinerary_1 = Itinerary.create!(title: "Romantic Itinerary", description: "This is a romantic itinerary.", weather: "sunny", price: "$$", duration: 4, station_id: station_2.id, user_id: user_2.id)
itinerary_2 = Itinerary.create!(title: "Unusual Itinerary", description: "This is an unusual itinerary.", weather: "covered", price: "$$$", duration: 6, station_id: station_3.id, user_id: user_2.id)
itinerary_3 = Itinerary.create!(title: "Friendly Itinerary", description: "This is a friendly itinerary.", weather: "rainy", price: "$", duration: 8, station_id: station_4.id, user_id: user_3.id)
itinerary_4 = Itinerary.create!(title: "Original Itinerary", description: "This is an itinerary.", weather: "sunny", price: "$$$$", duration: 2, station_id: station_2.id, user_id: user_4.id)

puts " 4 itineraries created"


Activity.destroy_all

puts "Creating 8 activities"

activity_1 = Activity.create!(itinerary_id: 1, title: "Walk in the Forest", address: "Fontainebleau Forest", description: "Enjoy a peaceful walk in the Fontainebleau Forest.", category_id: category_1.id)
activity_2 = Activity.create!(itinerary_id: 1, title: "Visit to Fontainebleau Castle", address: "Fontainebleau Castle", description: "Discover the history and architecture of the famous Fontainebleau Castle.", category_id: category_3.id)
activity_3 = Activity.create!(itinerary_id: 2, title: "Cruise on the Seine", address: "Quai de la Loire, Paris", description: "Embark on a cruise on the Seine and discover the famous monuments of Paris.", category_id: category_4.id)
activity_4 = Activity.create!(itinerary_id: 2, title: "Visit to the Musée d'Orsay", address: "Musée d'Orsay, Paris", description: "Discover modern art and French culture at the Musée d'Orsay.", category_id: category_1.id)
activity_5 = Activity.create!(itinerary_id: 3, title: "Hiking in the mountains", address: "Alps", description: "Go on an adventure in the snow-capped mountains of the Alps.", category_id: 5)
activity_6 = Activity.create!(itinerary_id: 3, title: "Visit to the Alpine shelter", address: "Alpine shelter in the Alps", description: "Discover the life of mountaineers in a typical Alpine shelter.", category_id: category_2.id)
activity_7 = Activity.create!(itinerary_id: 4, title: "Visit to the old port", address: "Old port, Marseille", description: "Explore the old port of Marseille and discover its maritime history.", category_id: category_1.id)
activity_8 = Activity.create!(itinerary_id: 4, title: "Visit to Notre-Dame de la Garde Basilica", address: "Notre-Dame de la Garde Basilica, Marseille", description: "Admire the panoramic view of Marseille from Notre-Dame de la Garde Basilica.", category_id: category_3.id)

puts "8 activities created ..."

Review.destroy_all

puts "Creating 4 reviews"

review_1 = Review.create!(itinerary_id: 1, user_id: 1, rating: 4, content: "A great itinerary! I highly recommend it.")
review_2 = Review.create!(itinerary_id: 2, user_id: 2, rating: 5, content: "Absolutely amazing! The itinerary was well planned and the activities were all fantastic.")
review_3 = Review.create!(itinerary_id: 3, user_id: 3, rating: 3, content: "It was good, but not as great as I was expecting.")
review_4 = Review.create!(itinerary_id: 4, user_id: 4, rating: 4, content: "I really enjoyed it! The itinerary was well thought out and the activities were all fun.")

puts "4 reviews created"


puts "Database created"
