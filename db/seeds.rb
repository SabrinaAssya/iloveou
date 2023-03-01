# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning database..."

Review.delete_all
Activity.delete_all
Favorite.delete_all
Itinerary.delete_all
Station.delete_all
User.delete_all

puts "Creating stations from API..."

url = "https://opendata.hauts-de-seine.fr/api/records/1.0/search/?dataset=gares-et-stations-du-reseau-ferre-dile-de-france-par-ligne&q=&rows=10000"
user_serialized = URI.open(url).read
metros = JSON.parse(user_serialized)
i = 0
stations = []
metros["records"].each do |metro|
  station = Station.create!(name: metro['fields']['nom'].strip )
  i += 1
end

puts "#{i} stations created"


puts "Creating 4 users..."

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

puts "4 users created"

puts "creating itineraries..."

itinerary_1 = Itinerary.create!(title: "A Taste of authentic parisian culture",
   description: "Immerse yourself in the best of Parisian culture with this itinerary that combines three unique experiences.
   This itinerary offers a perfect blend of culture, cuisine, and relaxation that is sure to make for a memorable day in Paris",
   price: "$$",
   sunny: true,
   cloudy: true,
   culture: true,
   restaurant: true,
   outdoor: true,
   duration: "2h-4h",
   station_id: Station.where(name: "Châtelet- Les Halles").ids.first,
   user_id: user_1.id,
   rating: 4.5)

sleep(1)

itinerary_2 = Itinerary.create!(title: "A Fancy night out in Paris",
  description: "Spend a memorable evening exploring some of Paris's most iconic attractions with this itinerary.
  It is perfect for a date night or a fun evening out with friends, and offers a perfect blend of culture, cocktails, and scenery.",
  price: "$$$",
  cloudy: true,
  sunny: true,
  drinks: true,
  culture: true,
  outdoor: true,
  duration: "2h-4h",
  station_id: Station.where(name: "Poissonnière").ids.first,
  user_id: user_2.id,
  rating: 4.2)

sleep(1)

itinerary_3 = Itinerary.create!(title: "",
  description: "Discover the sophisticated side of Paris with this itinerary that takes you to some of the city's most refined locations.
  It is perfect for those who appreciate the finer things in life and want to experience the best of Paris's gastronomy and culture.",
  price: "$$$",
  sunny: true,
  cloudy: true,
  outdoor: true,
  restaurant: true,
  drinks: true,
  duration: "2h-4h",
  station_id: Station.where(name: "Bir-Hakeim").ids.first,
  user_id: user_3.id,
  rating: 4.8)

sleep(1)

itinerary_4 = Itinerary.create!(title: "Off-the-Beaten-Path",
  description: "Explore the lesser-known parts of Paris with a visit to the Butte-aux-Cailles neighborhood and its street art, trendy boutiques, and cozy bars.
  Enjoy a French picnic at the Parc des Buttes Chaumont, then discover the local music scene at a nearby jazz club.",
  price: "$",
  sunny: true,
  cloudy: true,
  original: true,
  restaurant: true,
  drinks: true,
  outdoor: true,
  duration: "2h-4h",
  station_id: Station.where(name: "Corvisart").ids.first,
  user_id: user_4.id,
  rating: 4.1)

sleep(1)

itinerary_5 = Itinerary.create!(title: "Family Fun Day",
  description: "Start your day with a delicious brunch at a family-friendly restaurant, then visit the Cité des Enfants at the Science Museum for interactive and educational exhibits.
  Have a picnic at the Jardin du Luxembourg, then take a ride on the Paris Ferris Wheel.",
  price: "$$",
  sunny: true,
  rainy: true,
  culture: true,
  restaurant: true,
  outdoor: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Jussieu").ids.first,
  user_id: user_1.id,
  rating: 4.3)

sleep(1)

itinerary_6 = Itinerary.create!(title: "Historic Paris",
  description: "Discover Paris' rich history with a visit to the Palace of Versailles and its stunning gardens.
  Have a quick lunch at a nearby café, then explore the Musée de l'Armée and its exhibits on French military history.
  End your day with a visit to the Arc de Triomphe and the Champs-Elysées.",
  price: "$$",
  sunny: true,
  culture: true,
  restaurant: true,
  outdoor: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Versailles Château").ids.first,
  user_id: user_2.id,
  rating: 4.6)

sleep(1)

itinerary_7 = Itinerary.create!(title: "Gourmet Paris",
   description: "Indulge in a gourmet food tour of the city with stops at a traditional French market, a cheese shop, and a chocolate boutique.
   Have a delicious lunch at a Michelin-starred restaurant, then take a wine tasting class at a nearby cellar.
   End your day with a cooking class and learn to make your own French desserts.",
   price: "$$$",
   sunny: true,
   cloudy: true,
   restaurant: true,
   original: true,
   drinks: true,
   duration: "More than 4h",
   station_id: Station.where(name: "Rambuteau").ids.first,
   user_id: user_3.id,
   rating: 4.7)

sleep(1)

itinerary_8 = Itinerary.create!(title: "Sporty Paris",
  description: "Start your day with a morning run along the Seine river. Rent a bike and explore the city's parks and gardens,
  including the Bois de Boulogne and the Jardin des Tuileries. Have a healthy lunch at a vegetarian restaurant, then take a yoga class at a nearby studio.",
  price: "$$",
  sunny: true,
  outdoor: true,
  restaurant: true,
  original: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Javel - André Citroën").ids.first,
  user_id: user_4.id,
  rating: 4.4)

puts "8 itineraries created"

puts "Creating activities..."

activity_1 = Activity.create!(itinerary_id: itinerary_1.id, title: "Basque Getaway", address: " Chez Gladines, 11 bis rue des Halles, 75001, Paris", description: "Time to go to Gladines to taste a tasty and authentic Basque cuisine.")

activity_1.photo.attach(
  io: URI.open('https://uniiti.com/images/shops/slides/3bf51c72af8b71aa6244d648be00a95c21c13f9f.jpeg'),
  filename: 'gladines',
  content_type: 'image/jpeg'
)
activity_2 = Activity.create!(itinerary_id: itinerary_1.id, title: "Visit in the confines of history", address: "La Conciergerie, 2 Bd du Palais, 75001, Paris", description: "Explore this former prison transformed into a museum offering exhibitions on the history of Paris and France.")
activity_2.photo.attach(
  io: URI.open('https://media.timeout.com/images/100004325/image.jpg'),
  filename: 'conciergerie',
  content_type: 'image/jpg'
)
activity_3 = Activity.create!(itinerary_id: itinerary_1.id, title: "A royal walk", address: "Jardins du Palais Royal, 172 Boulevard Saint-Germain, 75006 Paris", description: "A beautiful public garden with fountains, sculptures, benches to relax to end your day in the most romantic way")
activity_3.photo.attach(
  io: URI.open('https://media.fashionnetwork.com/m/23d0/cbc5/778f/4787/731f/ca09/cdda/1db1/9b8c/1a77/1a77.jpg'),
  filename: 'jardin-palais-royal',
  content_type: 'image/jpg'
)
activity_4 = Activity.create!(itinerary_id: itinerary_2.id, title: "A walk along the canal", address: "Le Grand Rex, 1 Bd Poissonnière, 75002, Paris", description: "A historic cinema with an Art Deco interior, offering movies, concerts, and shows ... It is up to you to decie ! ")
activity_4.photo.attach(
  io: URI.open('https://img.grouponcdn.com/deal/37g41rDqLHpH7rtp2SPWbJs3Pxa4/37-2048x1229/v1/t600x362.jpg'),
  filename: 'grand-rex',
  content_type: 'image/jpg'
)
activity_5 = Activity.create!(itinerary_id: itinerary_2.id, title: "Cinematographic getaway", address: "Canal Saint-Martin, 75010, Paris", description: "A historic cinema with an Art Deco interior, offering movies, concerts, and shows ... It is up to you to decie !")
activity_5.photo.attach(
  io: URI.open('https://www.unjourdeplusaparis.com/wp-content/uploads/2013/05/canal-saint-martin-paris.jpg'),
  filename: 'canal-saint-martin',
  content_type: 'image/jpg'
)
activity_6 = Activity.create!(itinerary_id: itinerary_2.id, title: "Inventive cocktails", address: "Le Syndicat Cocktail Club, 51 Rue du Faubourg Saint-Denis, 75010, Paris", description: "A speakeasy-style bar, in a subdued atmosphere, with unique and inventive cocktails. Ideal for a date.")
activity_6.photo.attach(
  io: URI.open('https://media-cdn.tripadvisor.com/media/photo-s/11/71/b8/b2/interieur.jpg'),
  filename: 'speakeasy',
  content_type: 'image/jpg'
)
activity_7 = Activity.create!(itinerary_id: itinerary_3.id, title: "Restaurant with a typical parisian view", address: "Au Bon Accueil, 14 Rue de Monttessuy, 75007 Paris", description: "A refined restaurant with a view of the Eiffel Tower, offering traditional French cuisine. A typical French Restaurant")
activity_7.photo.attach(
  io: URI.open('https://foodetective-production.s3.amazonaws.com/uploads/picture/photo/41efd8c2-5234-4c0c-a08a-541bf3241940/d8063e58-bbc2-4ad7-be8c-3f3d78e5831f.jpeg'),
  filename: 'bonaccueil',
  content_type: 'image/jpeg'
)
activity_8 = Activity.create!(itinerary_id: itinerary_3.id, title: "Meet the Iron Lady", address: "Champ de Mars, 75007, Paris ", description: "A large public park, probably the most popular in Paris. Here you're gonna be able to admire the Eiffel Tower.")
activity_8.photo.attach(
  io: URI.open('https://www.parisinfo.com/var/otcp/sites/images/node_43/node_51/node_230/champ-de-mars-le-mur-pour-la-paix-%7C-630x405-%7C-%C2%A9-otcp-david-lefranc-i-158-10/26625-4-fre-FR/Champ-de-Mars-Le-Mur-pour-la-Paix-%7C-630x405-%7C-%C2%A9-OTCP-David-Lefranc-I-158-10.jpg'),
  filename: 'champdemars',
  content_type: 'image/jpg'
)
activity_9 = Activity.create!(itinerary_id: itinerary_3.id, title: "Amazing rooftop", address: "Café de l'Homme, 17 Pl. du Trocadéro et du 11 Novembre, 75016 Paris", description: "A stylish bar and restaurant with a terrace overlooking the Eiffel Tower and the Seine, offering a wide selection of cocktails and wines.")
activity_9.photo.attach(
  io: URI.open('https://media-cdn.tripadvisor.com/media/photo-s/1b/fb/96/e6/photo-de-la-terrasse.jpg'),
  filename: 'caféhomme',
  content_type: 'image/jpg'
)
activity_10 = Activity.create!(itinerary_id: itinerary_4.id, title: "Street Art in Butte-aux-Cailles", address: "Butte-aux-Cailles neighborhood, 75013 Paris", description: "Explore the street art and trendy boutiques of the Butte-aux-Cailles neighborhood.")
activity_10.photo.attach(
  io: URI.open('https://www.voyagesetc.fr/wp-content/uploads/2021/09/Street-art-Paris-13-Jace-683x1024.jpg'),
  filename: 'butte-aux-cailles',
  content_type: 'image/jpg'
)
activity_11 = Activity.create!(itinerary_id: itinerary_4.id, title: "Picnic at Parc des Buttes Chaumont", address: "Parc des Buttes Chaumont, 1 Rue Botzaris, 75019 Paris", description: "Have a French picnic in the picturesque Parc des Buttes Chaumont.")
activity_11.photo.attach(
  io: URI.open('https://cdn.sortiraparis.com/images/80/98059/749179-photos-le-parc-des-buttes-chaumont.jpg'),
  filename: 'parc',
  content_type: 'image/jpg'
)
activity_12 = Activity.create!(itinerary_id: itinerary_4.id, title: "Music at a Jazz Club", address: "Le Caveau de la Huchette, 5 Rue de la Huchette, 75005 Paris", description: "Discover the local music scene at Le Caveau de la Huchette, a jazz club that's been around since 1946.")
activity_12.photo.attach(
  io: URI.open('https://parissecret.com/wp-content/uploads/2021/11/afp.com-20180118-partners-010-GTT16A00_184-highres-scaled.jpg'),
  filename: 'jazz-club',
  content_type: 'image/jpg'
)
activity_13 = Activity.create!(itinerary_id: itinerary_5.id, title: "Boat Tour of the Seine River", address: "Vedettes du Pont Neuf, Square du Vert Galant, 75001 Paris", description: "Take a boat tour of the Seine River with Vedettes du Pont Neuf and discover the city's most iconic landmarks from the water.")
activity_13.photo.attach(
  io: URI.open('https://www.relaisdulouvre.com/images/actualites/ae8c42400b0ff3324ea01890ed021126ceca3098.jpeg'),
  filename: 'boat-tour',
  content_type: 'image/jpeg'
)
activity_14 = Activity.create!(itinerary_id: itinerary_5.id, title: "Zoo and Aquarium Visit", address: "Parc Zoologique de Paris, Route de la Ceinture du Lac Daumesnil, 75012 Paris", description: "Explore the Parc Zoologique de Paris and its aquarium for a fun day out with the family.")
activity_14.photo.attach(
  io: URI.open('https://static.apidae-tourisme.com/filestore/objets-touristiques/images/104/81/7360872.jpg'),
  filename: 'paris-zoo',
  content_type: 'image/jpg'
)
activity_15 = Activity.create!(itinerary_id: itinerary_5.id, title: "Ice Cream at Berthillon", address: "Berthillon, 31 Rue Saint-Louis en l'Île, 75004 Paris", description: "End your day with a delicious ice cream at Berthillon, a renowned Parisian ice cream shop.")
activity_15.photo.attach(
  io: URI.open('https://cdn-elle.ladmedia.fr/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/news-de-la-redaction/le-fondateur-des-glaces-berthillon-est-mort-2744986/48296535-1-fre-FR/Le-fondateur-des-glaces-Berthillon-est-mort.jpg'),
  filename: 'berthillon',
  content_type: 'image/jpg'
)
activity_16 = Activity.create!(itinerary_id: itinerary_6.id, title: "Gourmet Getaway", address: "Ô Chateau, 68 Rue Jean-Jacques Rousseau, 75001 Paris", description: "Enjoy a wine and cheese tasting at Ô Chateau, a renowned wine bar in the heart of Paris.")
activity_16.photo.attach(
  io: URI.open('https://media-cdn.tripadvisor.com/media/photo-s/1a/ce/a6/88/planche-fromage.jpg'),
  filename: 'gourmet',
  content_type: 'image/jpg'
)
activity_17 = Activity.create!(itinerary_id: itinerary_6.id, title: "Dinner at a Michelin-starred Restaurant", address: "Le Bristol Paris, 112 Rue du Faubourg Saint-Honoré, 75008 Paris", description: "Indulge in a gourmet dinner at Le Bristol Paris, a luxurious hotel with a Michelin-starred restaurant.")
activity_17.photo.attach(
  io: URI.open('https://upload.wikimedia.org/wikipedia/commons/e/e7/Le_Bristol_Paris.jpg'),
  filename: 'bistrol',
  content_type: 'image/jpg'
)
activity_18 = Activity.create!(itinerary_id: itinerary_6.id, title: "Pastry Workshop at Le Cordon Bleu", address: "Le Cordon Bleu Paris, 13-15 Quai André Citroën, 75015 Paris", description: "Learn the art of French pastry making with a workshop at Le Cordon Bleu Paris.")
activity_18.photo.attach(
  io: URI.open('https://www.thuriesmagazine.fr/sites/default/files/315/_dsc4847.jpg'),
  filename: 'cordon-bleu',
  content_type: 'image/jpg'
)
activity_19 = Activity.create!(itinerary_id: itinerary_7.id, title: "Hike in the Bois de Boulogne", address: "Bois de Boulogne, 75016 Paris", description: "Enjoy a nature hike in the Bois de Boulogne, a vast park on the western edge of Paris.")
activity_19.photo.attach(
  io: URI.open('https://www.apur.org/sites/default/files/images/publication/a-la-une/bois_boulogne_vincennes_935_550.jpg'),
  filename: 'bois-boulogne',
  content_type: 'image/jpg'
)
activity_20 = Activity.create!(itinerary_id: itinerary_7.id, title: "Botanical Garden Visit", address: "Jardin des Plantes, 57 Rue Cuvier, 75005 Paris", description: "Visit the Jardin des Plantes and explore its botanical gardens, greenhouses, and museums.")
activity_20.photo.attach(
  io: URI.open('https://cdn.sortiraparis.com/images/80/85531/604139-le-jardin-des-plantes.jpg'),
  filename: 'jardin-plantes',
  content_type: 'image/jpg'
)
activity_21 = Activity.create!(itinerary_id: itinerary_7.id, title: "Canal Saint-Martin Boat Tour", address: "Canal Saint-Martin", description: "Take a boat tour of the Canal Saint-Martin and discover the city's hidden gems.")
activity_21.photo.attach(
  io: URI.open('https://cdn.sortiraparis.com/images/80/83517/577962-visuel-paris-canal-saint-martin.jpg'),
  filename: 'canal-saint-martin',
  content_type: 'image/jpg'
)
activity_22 = Activity.create!(itinerary_id: itinerary_8.id, title: "Palace of Versailles Visit", address: "Palace of Versailles, Place d'Armes, 78000 Versailles", description: "Explore the Palace of Versailles, a grandiose royal residence and UNESCO World Heritage site.")
activity_22.photo.attach(
  io: URI.open('https://a.cdn-hotels.com/gdcs/production173/d887/4ed9f247-792c-416d-8ddf-0049ae3059a1.jpg'),
  filename: 'versailles',
  content_type: 'image/jpg'
)
activity_23 = Activity.create!(itinerary_id: itinerary_8.id, title: "Opera Garnier Guided Tour", address: "Opéra Garnier, Place de l'Opéra, 75009 Paris", description: "Visit the Opéra Garnier and its ornate architecture with a guided tour.")
activity_23.photo.attach(
  io: URI.open('https://www.theatreinparis.com/uploads/images/spectacle/visit-palais-garnier-opera-header.jpg'),
  filename: 'opera-garnier',
  content_type: 'image/jpg'
)
activity_24 = Activity.create!(itinerary_id: itinerary_8.id, title: "Latin Quarter Walking Tour", address: "Latin Quarter, 75005 Paris", description: "Take a walking tour of the Latin Quarter and discover its historic landmarks, universities, and charming streets.")
activity_24.photo.attach(
  io: URI.open('https://myprivateparis.com/wp-content/uploads/2020/07/3-2.jpg'),
  filename: 'quartier-latin',
  content_type: 'image/jpg'
)

puts "24 activities created"

puts "Creating reviews..."

review_1 = Review.create!(itinerary_id: itinerary_1.id, user_id: user_1.id, rating: 5, content: "My partner and I loved this itinerary! The Eiffel Tower was a highlight, especially at sunset. The dinner at Le Jules Verne was exceptional and the Seine River cruise was a great way to see the city from a different perspectiv")
review_2 = Review.create!(itinerary_id: itinerary_1.id, user_id: user_2.id, rating: 4.5, content: "I surprised my girlfriend with this itinerary and it was a huge hit! The views from the top of the Eiffel Tower were breathtaking, and the dinner at Le Jules Verne was the most romantic meal we've ever had. Highly recommend!")
review_3 = Review.create!(itinerary_id: itinerary_2.id, user_id: user_3.id, rating: 4.5, content: "As an art and fashion lover, this itinerary was a dream come true. The Louvre and Musée d'Orsay were amazing, and the fashion exhibit at the Palais Galliera was fascinating. The shopping in the Marais was a great way to end the day!")
review_4 = Review.create!(itinerary_id: itinerary_2.id, user_id: user_4.id, rating: 4, content: "I had a wonderful time on this itinerary. The tour guide was very knowledgeable and the art and fashion exhibits were top-notch. The Marais district had some great boutique shops and the street art was a nice surprise. Would recommend to anyone who loves art and fashion!")
review_5 = Review.create!(itinerary_id: itinerary_3.id, user_id: user_1.id, rating: 4, content: "This itinerary showed me parts of Paris that I never would have discovered on my own. The Belleville neighborhood had some amazing street art and the flea market was a great find. The picnic in the park was a lovely way to end the day.")
review_6 = Review.create!(itinerary_id: itinerary_3.id, user_id: user_2.id, rating: 3.5, content: "If you're looking for a unique Paris experience, this itinerary is perfect. The guide was great and the stops were all off the beaten path. The Belleville street art was a highlight and the flea market had some great vintage finds. The only downside was the weather - it was raining all day!")
review_7 = Review.create!(itinerary_id: itinerary_4.id, user_id: user_3.id, rating: 4.5, content: "My family had a great time on this itinerary. The boat tour was a unique way to see the city and the zoo and aquarium were both very impressive. Berthillon ice cream was the perfect end to the day!")
review_8 = Review.create!(itinerary_id: itinerary_4.id, user_id: user_3.id, rating: 4, content: "As a family with young children, this itinerary was perfect for us. The boat tour was a hit with the kids and the zoo and aquarium were a lot of fun. Berthillon ice cream was a highlight for everyone. Would recommend to any families visiting Paris!")
review_9 = Review.create!(itinerary_id: itinerary_5.id, user_id: user_4.id, rating: 5, content: "As a foodie, this itinerary was a dream come true. The wine and cheese tasting at Ô Chateau was a highlight and the dinner at Le Bristol Paris was exceptional. The pastry workshop at Le Cordon Bleu was a great way to end the day. Highly recommend!")
review_10 = Review.create!(itinerary_id: itinerary_5.id, user_id: user_4.id, rating: 4.5, content: "This itinerary was a bit on the pricey side, but it was worth every penny. The food and wine experiences were all top-notch and the pastry workshop was a lot of fun. Would recommend to anyone looking for a gourmet getaway in Paris!")
review_11 = Review.create!(itinerary_id: itinerary_6.id, user_id: user_1.id, rating: 4, content: "This itinerary was a great way to escape the hustle and bustle of Paris. The hike in the Bois de Boulogne was refreshing and the botanical garden was beautiful. The boat tour of the Canal Saint-Martin was a nice surprise!")
review_12 = Review.create!(itinerary_id: itinerary_6.id, user_id: user_1.id, rating: 5, content: "If you're looking for a break from the city, this itinerary is a great")
review_13 = Review.create!(itinerary_id: itinerary_7.id, user_id: user_2.id, rating: 4.5, content: "As a wine lover, this itinerary was a highlight of my trip to Paris. The wine tasting at Les Caves du Louvre was exceptional and the visit to Montmartre was a great way to see a different side of the city. The dinner at Le Comptoir du Relais was delicious!")
review_14 = Review.create!(itinerary_id: itinerary_7.id, user_id: user_2.id, rating: 4, content: "I had a great time on this wine tasting tour. The guide was very knowledgeable and the wines we tasted were all top-quality. The visit to Montmartre was a nice surprise and the dinner was fantastic. Would recommend to anyone who loves wine!")
review_15 = Review.create!(itinerary_id: itinerary_8.id, user_id: user_3.id, rating: 5, content: "This itinerary was a great way to learn about the history of Paris. The tour of Notre-Dame Cathedral was fascinating and the visit to the Palace of Versailles was a highlight. The dinner at Le Procope, one of the oldest restaurants in Paris, was a great way to end the day.")
review_16 = Review.create!(itinerary_id: itinerary_8.id, user_id: user_3.id, rating: 3.5, content: "As a history buff, I really enjoyed this itinerary. The guide was very knowledgeable and the sites we visited were all very interesting. The dinner at Le Procope was a nice touch - the atmosphere was very historic and the food was delicious. Would recommend to anyone interested in the history of Paris.")

puts "16 reviews created"

puts "Creating favorites..."
favorite_1 = Favorite.create!(itinerary_id: itinerary_1.id, user_id: user_1.id)
favorite_2 = Favorite.create!(itinerary_id: itinerary_2.id, user_id: user_1.id)
favorite_3 = Favorite.create!(itinerary_id: itinerary_3.id, user_id: user_1.id)
favorite_4 = Favorite.create!(itinerary_id: itinerary_4.id, user_id: user_1.id)

puts "4 favorites created"

puts "Database created"
