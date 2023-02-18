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
Favorite.delete_all
Itinerary.delete_all
Station.delete_all
User.delete_all

puts "Creating stations"

url = "https://opendata.hauts-de-seine.fr/api/records/1.0/search/?dataset=gares-et-stations-du-reseau-ferre-dile-de-france-par-ligne&q=&rows=10000"
user_serialized = URI.open(url).read
metros = JSON.parse(user_serialized)
i = 0 
stations = []
metros["records"].each do |metro|
  station = Station.create!(name: metro['fields']['nom'].strip )
  i += 1
end

puts " #{i} stations created"


puts "Creating 4 users"

user_1 = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", password: "password")
user_1.photo.attach(
  io: URI.open('https://expertphotography.b-cdn.net/wp-content/uploads/2020/08/social-media-profile-photos-8.jpg'),
  filename: 'john-doe', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user_2 = User.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@example.com", password: "password")
user_2.photo.attach(
  io: URI.open('https://i.pinimg.com/736x/7d/5b/b8/7d5bb8420bd7c69711930dca90dcc5d0.jpg'),
  filename: 'jane-doe', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user_3 = User.create!(first_name: "Bob", last_name: "Smith", email: "bobsmith@example.com", password: "password")
user_3.photo.attach(
  io: URI.open('https://www.shutterstock.com/image-photo/close-photo-charming-guy-entrepreneur-260nw-1531460651.jpg'),
  filename: 'bob-smith', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)
user_4 = User.create!(first_name: "Alice", last_name: "Johnson", email: "alicejohnson@example.com", password: "password")
user_4.photo.attach(
  io: URI.open('https://img.freepik.com/free-photo/portrait-happy-young-woman-looking-camera_23-2147892777.jpg'),
  filename: 'alice-johnson', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)


puts "creating 4 itineraries ..."

itinerary_1 = Itinerary.create!(title: "Romantic Itinerary", description: "This is a romantic itinerary.", price: "$$", sunny: true, cloudy: true, culture: true, restaurant: true, drinks: true, duration: "1h-2h", station_id: Station.all.sample.id, user_id: user_2.id, rating: 4.5)
sleep(1)
itinerary_2 = Itinerary.create!(title: "Unusual Itinerary", description: "This is an unusual itinerary.", price: "$$$", cloudy: true, drinks: true, original: true, culture: true, duration: "2h-4h", station_id: Station.all.sample.id, user_id: user_2.id, rating: 3)
sleep(1)
itinerary_3 = Itinerary.create!(title: "Friendly Itinerary", description: "This is a friendly itinerary.", price: "$", sunny: true, rainy: true, cloudy: true, restaurant: true, original: true, culture: true, duration: "1h-2h", station_id: Station.all.sample.id, user_id: user_3.id, rating: 5)
sleep(1)
itinerary_4 = Itinerary.create!(title: "Original Itinerary", description: "This is an itinerary.", price: "$$$", sunny: true, restaurant: true, original: true, duration: "More than 4h", station_id: Station.all.sample.id, user_id: user_4.id, rating: 4)

puts " 4 itineraries created"

puts "Creating 8 activities"

activity_1 = Activity.create!(itinerary_id: itinerary_1.id, title: "Walk in the Forest", address: "Fontainebleau Forest", description: "Enjoy a peaceful walk in the Fontainebleau Forest.")
activity_1.photo.attach(
  io: URI.open('https://as1.ftcdn.net/v2/jpg/02/10/79/84/1000_F_210798479_ySMmN9y1Bqcc81PNk1g1dPcBzocw3TYr.jpg'),
  filename: 'forest-walk', # use the extension of the attached file here (found at the end of the url)
  content_type: 'image/jpg' # use the mime type of the attached file here
)
activity_2 = Activity.create!(itinerary_id: itinerary_2.id, title: "Visit to Fontainebleau Castle", address: "Fontainebleau Castle", description: "Discover the history and architecture of the famous Fontainebleau Castle.")
activity_2.photo.attach(
  io: URI.open('https://chateaudeharoue.fr/wp-content/uploads/2020/10/Le-chateau-de-Fontainebleau.jpg'),
  filename: 'fontainbleau-castle',
  content_type: 'image/png'
)
activity_3 = Activity.create!(itinerary_id: itinerary_4.id, title: "Cruise on the Seine", address: "Quai de la Loire, Paris", description: "Embark on a cruise on the Seine and discover the famous monuments of Paris.")
activity_3.photo.attach(
  io: URI.open('https://media.ceetiz.com/activity/VEDPAR001/CroisiAre_Seine_Paris_Vedettes_Ceetiz-1.jpg'),
  filename: 'cruise-seine',
  content_type: 'image/png'
)
activity_4 = Activity.create!(itinerary_id: itinerary_3.id, title: "Visit to the Musée d'Orsay", address: "Musée d'Orsay, Paris", description: "Discover modern art and French culture at the Musée d'Orsay.")
activity_4.photo.attach(
  io: URI.open('https://media.vogue.fr/photos/5c8ade98488cdc9b81df7a62/3:4/w_2598,h_3464,c_limit/GettyImages-541442952.jpg'),
  filename: 'museum-orsay',
  content_type: 'image/png'
)
activity_5 = Activity.create!(itinerary_id: itinerary_1.id, title: "Hiking in the mountains", address: "Alps", description: "Go on an adventure in the snow-capped mountains of the Alps.")
activity_5.photo.attach(
  io: URI.open('https://www.meetmindful.com/wp-content/uploads/2015/05/hiking-couple-nature-climbing.jpg'),
  filename: 'mountains-hiking',
  content_type: 'image/png'
)
activity_6 = Activity.create!(itinerary_id: itinerary_3.id, title: "Visit to the Alpine shelter", address: "Alpine shelter in the Alps", description: "Discover the life of mountaineers in a typical Alpine shelter.")
activity_6.photo.attach(
  io: URI.open('https://www.guardianglass.com/content/dam/guardianindustriesholdings/project/europe/SN7037_SLO_SkutaMontain_AlpineShelter_limittedRight%20%2022.jpg.transform/rendition-1280-keep/img.jpg'),
  filename: 'alpine-shelter',
  content_type: 'image/png'
)
activity_7 = Activity.create!(itinerary_id: itinerary_4.id, title: "Visit to the old port", address: "Old port, Marseille", description: "Explore the old port of Marseille and discover its maritime history.")
activity_7.photo.attach(
  io: URI.open('https://planetofhotels.com/guide/sites/default/files/styles/paragraph__hero_banner__hb_image__1880bp/public/hero_banner/Old_port_of_Marseille.jpg'),
  filename: 'old-port',
  content_type: 'image/png'
)
activity_8 = Activity.create!(itinerary_id: itinerary_1.id, title: "Visit to Notre-Dame de la Garde Basilica", address: "Notre-Dame de la Garde Basilica, Marseille", description: "Admire the panoramic view of Marseille from Notre-Dame de la Garde Basilica.")
activity_8.photo.attach(
  io: URI.open('https://i.ytimg.com/vi/1VgqhTdZcdI/maxresdefault.jpg'),
  filename: 'notre-dame',
  content_type: 'image/png'
)

puts "8 activities created ..."


puts "Creating 4 reviews"

review_1 = Review.create!(itinerary_id: itinerary_1.id, user_id: user_1.id, rating: 4, content: "A great itinerary! I highly recommend it.")
review_2 = Review.create!(itinerary_id: itinerary_2.id, user_id: user_3.id, rating: 5, content: "Absolutely amazing! The itinerary was well planned and the activities were all fantastic.")
review_3 = Review.create!(itinerary_id: itinerary_3.id, user_id: user_4.id, rating: 3, content: "It was good, but not as great as I was expecting.")
review_4 = Review.create!(itinerary_id: itinerary_4.id, user_id: user_2.id, rating: 4, content: "I really enjoyed it! The itinerary was well thought out and the activities were all fun.")

puts "4 reviews created"

puts "Creating 4 favorites"
favorite_1 = Favorite.create!(itinerary_id: itinerary_1.id, user_id: user_1.id)
favorite_2 = Favorite.create!(itinerary_id: itinerary_2.id, user_id: user_3.id)
favorite_3 = Favorite.create!(itinerary_id: itinerary_3.id, user_id: user_4.id)
favorite_4 = Favorite.create!(itinerary_id: itinerary_4.id, user_id: user_2.id)

puts "4 favorites created"

puts "Database created"
