# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database ..."

Review.delete_all
Activity.delete_all
Itinerary.delete_all
Station.delete_all
User.delete_all

puts "Creating 4 stations"

url = "https://opendata.hauts-de-seine.fr/api/records/1.0/search/?dataset=gares-et-stations-du-reseau-ferre-dile-de-france-par-ligne&q=&rows=10000"
user_serialized = URI.open(url).read
metros = JSON.parse(user_serialized)

stations = []
metros["records"].each do |metro|
  station = Station.create!(name: metro['fields']['nom'])
end

puts "4 stations created"


puts "Creating 4 users"

user_1 = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
user_2 = User.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@example.com", password: "password")
user_3 = User.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@example.com", password: "password")
user_4 = User.create!(first_name: "Alice", last_name: "Johnson", email: "alicejohnson@example.com", password: "password")


puts "creating 4 itineraries ..."

itinerary_1 = Itinerary.create!(title: "Romantic Itinerary", description: "This is a romantic itinerary.", price: "$$", duration: "1h-2h", station_id: Station.all.sample.id, user_id: user_2.id, rating: 4.5)
sleep(1)
itinerary_2 = Itinerary.create!(title: "Unusual Itinerary", description: "This is an unusual itinerary.", price: "$$$", duration: "2h-4h", station_id: Station.all.sample.id, user_id: user_2.id, rating: 3)
sleep(1)
itinerary_3 = Itinerary.create!(title: "Friendly Itinerary", description: "This is a friendly itinerary.", price: "$", duration: "1h-2h", station_id: Station.all.sample.id, user_id: user_3.id, rating: 5)
sleep(1)
itinerary_4 = Itinerary.create!(title: "Original Itinerary", description: "This is an itinerary.", price: "$$$", duration: "More than 4h", station_id: Station.all.sample.id, user_id: user_4.id, rating: 4)

puts " 4 itineraries created"

puts "Creating 8 activities"

activity_1 = Activity.create!(itinerary_id: itinerary_1.id, title: "Walk in the Forest", address: "Fontainebleau Forest", description: "Enjoy a peaceful walk in the Fontainebleau Forest.")
activity_1.photo.attach(
  io: URI.open('https://www.bienmagazine.co.uk/system/articles/images/000/000/222/large/randki36.jpg'),
  filename: 'forest.jpg', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)
activity_2 = Activity.create!(itinerary_id: itinerary_2.id, title: "Visit to Fontainebleau Castle", address: "Fontainebleau Castle", description: "Discover the history and architecture of the famous Fontainebleau Castle.")
activity_3 = Activity.create!(itinerary_id: itinerary_4.id, title: "Cruise on the Seine", address: "Quai de la Loire, Paris", description: "Embark on a cruise on the Seine and discover the famous monuments of Paris.")
activity_4 = Activity.create!(itinerary_id: itinerary_3.id, title: "Visit to the Musée d'Orsay", address: "Musée d'Orsay, Paris", description: "Discover modern art and French culture at the Musée d'Orsay.")
activity_5 = Activity.create!(itinerary_id: itinerary_1.id, title: "Hiking in the mountains", address: "Alps", description: "Go on an adventure in the snow-capped mountains of the Alps.")
activity_6 = Activity.create!(itinerary_id: itinerary_3.id, title: "Visit to the Alpine shelter", address: "Alpine shelter in the Alps", description: "Discover the life of mountaineers in a typical Alpine shelter.")
activity_7 = Activity.create!(itinerary_id: itinerary_4.id, title: "Visit to the old port", address: "Old port, Marseille", description: "Explore the old port of Marseille and discover its maritime history.")
activity_8 = Activity.create!(itinerary_id: itinerary_1.id, title: "Visit to Notre-Dame de la Garde Basilica", address: "Notre-Dame de la Garde Basilica, Marseille", description: "Admire the panoramic view of Marseille from Notre-Dame de la Garde Basilica.")

puts "8 activities created ..."


puts "Creating 4 reviews"

review_1 = Review.create!(itinerary_id: itinerary_1.id, user_id: user_1.id, rating: 4, content: "A great itinerary! I highly recommend it.")
review_2 = Review.create!(itinerary_id: itinerary_2.id, user_id: user_3.id, rating: 5, content: "Absolutely amazing! The itinerary was well planned and the activities were all fantastic.")
review_3 = Review.create!(itinerary_id: itinerary_3.id, user_id: user_4.id, rating: 3, content: "It was good, but not as great as I was expecting.")
review_4 = Review.create!(itinerary_id: itinerary_4.id, user_id: user_2.id, rating: 4, content: "I really enjoyed it! The itinerary was well thought out and the activities were all fun.")

puts "4 reviews created"


puts "Database created"
