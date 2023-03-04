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

itinerary_1 = Itinerary.create!(title: "Authentic parisian culture",
   description: "Immerse yourself in the best of Parisian culture with this itinerary that combines three unique experiences.
   It offers a perfect blend of culture, cuisine, and relaxation that is sure to make for a memorable day in Paris",
   price: "$$",
   sunny: true,
   cloudy: true,
   culture: true,
   restaurant: true,
   outdoor: true,
   duration: "2h-4h",
   station_id: Station.where(name: "Châtelet-Les Halles").ids.first,
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

itinerary_3 = Itinerary.create!(title: "Parisian Elegance",
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

itinerary_4 = Itinerary.create!(title: "A Regal Day in Versailles",
  description: "Discover a city full of history a few kilometers from Paris.
  With its mix of history, nature, and culture, this itinerary is sure to provide a memorable day in Versailles.",
  price: "$$$",
  sunny: true,
  cloudy: true,
  original: true,
  restaurant: true,
  outdoor: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Versailles Château").ids.first,
  user_id: user_4.id,
  rating: 4.1)

sleep(1)

itinerary_5 = Itinerary.create!(title: "A sustainable artistic tour",
  description: "Join us on a unique tour of Paris that combines sustainability, gastronomy, and art.
  This tour will not only leave you satisfied with delicious food and beautiful sights, but also with a sense of connection to sustainable living and artistic history.
  ",
  price: "$$$",
  sunny: true,
  cloudy: true,
  rainy: true,
  original: true,
  restaurant: true,
  culture: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Abbesses").ids.first,
  user_id: user_1.id,
  rating: 4.3)

sleep(1)

itinerary_6 = Itinerary.create!(title: "A night at the Opera",
  description: "Take advantage of this itinerary to visit three of the most luxurious and typical places in Paris.
  This itinerary promises you a moment suspended in time and an unforgettable evening.",
  price: "$$$",
  sunny: true,
  cloudy: true,
  rainy: true,
  restaurant: true,
  culture: true,
  drinks: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Opéra").ids.first,
  user_id: user_2.id,
  rating: 4.6)

sleep(1)

itinerary_7 = Itinerary.create!(title: "Sporty Paris",
   description: "Experience a perfect day in Paris with this itinerary that combines nature, food, and sports. Start your day by immersing yourself in the beauty of nature at Le Bois de Boulogne. After working up an appetite, head to Sushi Suki for a delicious sushi lunch.
   Finally, end your day at Le Parc des Princes, the iconic football stadium that's home to Paris Saint-Germain to catch a game.",
   price: "$$",
   sunny: true,
   cloudy: true,
   restaurant: true,
   original: true,
   outdoor: true,
   duration: "More than 4h",
   station_id: Station.where(name: "Boulogne - Jean Jaurès").ids.first,
   user_id: user_3.id,
   rating: 4.7)

sleep(1)

itinerary_8 = Itinerary.create!(title: "The typical student Paris",
  description: "Experience the rich history and culture of Paris with this itinerary that takes you on a journey through the Latin Quarter.
  This itinerary is the perfect blend of history, culture, and fun, and is sure to make for a memorable day",
  price: "$$",
  sunny: true,
  cloudy:true,
  culture: true,
  drinks: true,
  outdoor: true,
  duration: "2h-4h",
  station_id: Station.where(name: "Cardinal Lemoine").ids.first,
  user_id: user_4.id,
  rating: 4.4)

  itinerary_9 = Itinerary.create!(title: "Montmarte mon amour",
  description: "Discover the picturesque streets and bohemian charm of Montmartre with this itinerary featuring three unique experiences. Enjoy a full day of culture, history,
  and charm in one of Paris's most beloved neighborhoods with this itinerary.",
  price: "$$$",
  sunny: true,
  cloudy: true,
  culture: true,
  restaurant: true,
  outdoor: true,
  duration: "More than 4h",
  station_id: Station.where(name: "Abbesses").ids.first,
  user_id: user_4.id,
  rating: 4.5)


puts "9 itineraries created"

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
activity_4 = Activity.create!(itinerary_id: itinerary_2.id, title: "A walk along the canal", address: "Canal Saint-Martin, 75010, Paris", description: "A picturesque waterway with lively cafes, bars, and boutiques along its banks. ")
activity_4.photo.attach(
  io: URI.open('https://www.unjourdeplusaparis.com/wp-content/uploads/2013/05/canal-saint-martin-paris.jpg'),
  filename: 'canal-saint-martin',
  content_type: 'image/jpg'
)
activity_5 = Activity.create!(itinerary_id: itinerary_2.id, title: "Cinematographic getaway", address: "Le Grand Rex, 1 Bd Poissonnière, 75002, Paris", description: "A historic cinema with an Art Deco interior, offering movies, concerts, and shows ... It is up to you to decie !")
activity_5.photo.attach(
  io: URI.open('https://img.grouponcdn.com/deal/37g41rDqLHpH7rtp2SPWbJs3Pxa4/37-2048x1229/v1/t600x362.jpg'),
  filename: 'grand-rex',
  content_type: 'image/jpg'
)
activity_6 = Activity.create!(itinerary_id: itinerary_2.id, title: "Inventive cocktails", address: "Le Syndicat Cocktail Club, 51 Rue du Faubourg Saint-Denis, 75010, Paris", description: "A speakeasy-style bar, in a subdued atmosphere, with unique and inventive cocktails. Ideal for a date.")
activity_6.photo.attach(
  io: URI.open('https://media-cdn.tripadvisor.com/media/photo-s/11/71/b8/b2/interieur.jpg'),
  filename: 'speakeasy',
  content_type: 'image/jpg'
)
activity_7 = Activity.create!(itinerary_id: itinerary_3.id, title: "Restaurant with a typical parisian view", address: "Au Bon Accueil, 14 Rue de Monttessuy, 75007 Paris", description: "A refined restaurant with a view of the Eiffel Tower, offering traditional French cuisine. A typical French Restaurant.")
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
activity_10 = Activity.create!(itinerary_id: itinerary_4.id, title: "A queen lunch", address: "La Véranda, 1 Bd de la Reine, 78000 Versailles", description: "Start your day off with a delicious breakfast at La Veranda. This elegant restaurant is housed in the Trianon Palace hotel, which is just a short walk from Versailles Château.")
activity_10.photo.attach(
  io: URI.open('https://i.pinimg.com/736x/aa/55/fa/aa55fa5e3d1f0ee09a04e03cf44dfdc6--restaurant-bar.jpg'),
  filename: 'veranda',
  content_type: 'image/jpg'
)
activity_11 = Activity.create!(itinerary_id: itinerary_4.id, title: "The royal visit", address: "Château de Versailles, Place d'Armes, 78000 Versailles", description: "No visit to Versailles is complete without a tour of the Château itself. Marvel at the opulent décor and learn about the history of the French monarchy as you explore the palace and its sprawling gardens.")
activity_11.photo.attach(
  io: URI.open('https://www.systemair.com/fileadmin/_processed_/c/7/csm_ref_Versailles_France_54ddd70ccd.jpg'),
  filename: 'versailles',
  content_type: 'image/jpg'
)

activity_12 = Activity.create!(itinerary_id: itinerary_4.id, title: "The little Venice", address: "La Petite Venise, Jardins du château de Versailles Place d'Armes, All. d'Apollon, 78000 Versailles", description: "End your magical day with this charming café takes its inspiration from the canals of Venice.")
activity_12.photo.attach(
  io: URI.open('https://musiam-paris.com/wp-content/uploads/2020/06/musiam-petite-venise-exterieur2-768x512.jpg'),
  filename: 'venise',
  content_type: 'image/jpg'
)
activity_13 = Activity.create!(itinerary_id: itinerary_5.id, title: "Artistic getaway", address: "La Recyclerie, 83 Bd Ornano, 75018 Paris ", description: "Begin your day in this ecological and solidarity living space, with a café, restaurant, vegetable garden, urban farm, and varied cultural programming.")
activity_13.photo.attach(
  io: URI.open('https://media.timeout.com/images/105479071/image.jpg'),
  filename: 'recyclerie',
  content_type: 'image/jpg'
)
activity_14 = Activity.create!(itinerary_id: itinerary_5.id, title: "Typical french lunch", address: "Le Coq Rico, 98 Rue Lepic, 75018 Paris", description: "Enjoy a typical French meal in this restaurant specializing in poultry, with a pleasant terrace and a beautiful view of Montmartre.")
activity_14.photo.attach(
  io: URI.open('https://www.hotel-relais-montmartre.com/website/var/tmp/fr/auto_850904660de984af948beee3aee98a4f/546_le-coq-rico-restaurant-paris.jpeg'),
  filename: 'coq-rico',
  content_type: 'image/jpeg'
)
activity_15 = Activity.create!(itinerary_id: itinerary_5.id, title: "French Cancan night", address: "22 Rue des Saules, 75018 Paris", description: "End your day in this leLegendary cabaret where great artists like Picasso and Modigliani performed, with French song shows and poetic evenings.")
activity_15.photo.attach(
  io: URI.open('https://www.montmartre-addict.com/wp-content/uploads/2022/01/au-lapin-agile-cabaret-montmartre-2022.jpg'),
  filename: 'cabaret',
  content_type: 'image/jpg'
)
activity_16 = Activity.create!(itinerary_id: itinerary_6.id, title: "A moment of peace", address: "Café de la Paix, 5 Pl. de l'Opéra, 75009 Paris", description: "Start your evening by enjoying a dinner at the most famous landmarks, this stunning opera house boasts ornate architecture and hosts a variety of performances throughout the year..")
activity_16.photo.attach(
  io: URI.open('https://media-cdn.tripadvisor.com/media/photo-s/1d/48/e1/f5/jardin-opera.jpg'),
  filename: 'paix',
  content_type: 'image/jpg'
)
activity_17 = Activity.create!(itinerary_id: itinerary_6.id, title: "A suspended moment", address: "Opéra Garnier, Pl. de l'Opéra, 75009 Paris", description: "One of Paris's most famous landmarks, this stunning opera house boasts ornate architecture and hosts a variety of performances throughout the year.")
activity_17.photo.attach(
  io: URI.open('https://vivreparis.fr/wp-content/uploads/2022/04/palais-garnier.jpg'),
  filename: 'garnier',
  content_type: 'image/jpg'
)
activity_18 = Activity.create!(itinerary_id: itinerary_6.id, title: "A vintage bar", address: "Harry's New York Bar, 5 rue Daunou, 75002 Paris", description: "Harry's Bar is the oldest cocktail bar in Europe. Continue your evening in this mythical bar that has always kept its authentic decoration and atmosphere ")
activity_18.photo.attach(
  io: URI.open('https://axwwgrkdco.cloudimg.io/v7/lefooding.com/medias/2021/07/14_32_26_594_bar_harrys_new_york_bar_paris.jpg'),
  filename: 'vintage-bar',
  content_type: 'image/jpg'
)
activity_19 = Activity.create!(itinerary_id: itinerary_7.id, title: "A Bike tour", address: "Bois de Boulogne, 75016 Paris", description: "Start your day with a bike ride in the mythical Bois de Boulogne.")
activity_19.photo.attach(
  io: URI.open('https://www.apur.org/sites/default/files/images/publication/a-la-une/bois_boulogne_vincennes_935_550.jpg'),
  filename: 'bois-boulogne',
  content_type: 'image/jpg'
)
activity_20 = Activity.create!(itinerary_id: itinerary_7.id, title: "A well-deserved lunch", address: "Sushi Suki, 6 Rue Escudier, 92100 Boulogne-Billancourt", description: "If you're a fan of sushi, you'll love this restaurant. They offer a wide variety of rolls, sashimi, and nigiri, all made with fresh and high-quality ingredients. The atmosphere is simple but elegant, making it a great spot for a romantic lunch.")
activity_20.photo.attach(
  io: URI.open('https://d1ralsognjng37.cloudfront.net/360dc712-8d03-4cb5-931e-2efd345ae5c2.jpeg'),
  filename: 'sushis',
  content_type: 'image/jpeg'
)
activity_21 = Activity.create!(itinerary_id: itinerary_7.id, title: "Sporting meeting", address: "Parc des Princes, 24 Rue du Commandant Guilbaud, 75016 Paris", description: "Enjoy a match in this famous stadium is home to Paris Saint-Germain football club. You can also take a tour of the facilities, visit the museum.")
activity_21.photo.attach(
  io: URI.open('https://imgresizer.eurosport.com/unsafe/2560x0/filters:format(jpeg)/origin-imgresizer.eurosport.com/2020/06/06/2829065-58346328-2560-1440.jpg'),
  filename: 'parc-des-princes',
  content_type: 'image/jpg'
)
activity_22 = Activity.create!(itinerary_id: itinerary_8.id, title: "A student classic", address: "Panthéon, Place du Panthéon, 75005 Paris", description: "Take a look at this imposing neoclassical building houses which remains some of France's most distinguished citizens, including Voltaire, Rousseau, and Victor Hugo.")
activity_22.photo.attach(
  io: URI.open('https://paris1900.lartnouveau.com/paris05/pantheon/acceuil/1panth55.jpg'),
  filename: 'Panthéon',
  content_type: 'image/jpg'
)
activity_23 = Activity.create!(itinerary_id: itinerary_8.id, title: "A little walk to the market", address: "Rue Mouffetard Market, Rue Mouffetard, 75005 Paris", description: " This lively market street offers a wide variety of fresh produce, meats, cheeses, and other food items, as well as clothing and other goods..")
activity_23.photo.attach(
  io: URI.open('https://upload.wikimedia.org/wikipedia/commons/8/8f/Street_market_rue_Mouffetard_St_Medard_dsc00727.jpg'),
  filename: 'little-market',
  content_type: 'image/jpg'
)
activity_24 = Activity.create!(itinerary_id: itinerary_8.id, title: "The last bar before the end of the world", address: "Le Dernier Bar avant la Fin du Monde - 19 Avenue Victoria, 75001 Paris" , description: "This quirky bar pays homage to science fiction, fantasy, and other geeky genres, with themed cocktails, decor, and events.")
activity_24.photo.attach(
  io: URI.open('https://media-cdn.tripadvisor.com/media/photo-s/0f/ee/2d/38/lounge.jpg'),
  filename: 'fin-du-monde',
  content_type: 'image/jpg'
)

activity_25 = Activity.create!(itinerary_id: itinerary_9.id, title: "Breakfast at le Moulin", address: "Café des Deux Moulins, 15 Rue Lepic, 75018 Paris", description: "Start your day in this café, famous for being featured in the movie Amélie, and offers a variety of breakfast options, along with a classic Parisian atmosphere.")
activity_25.photo.attach(
  io: URI.open('https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Cafe_des_2_Moulins%2C_Paris_24_August_2019.jpg/1200px-Cafe_des_2_Moulins%2C_Paris_24_August_2019.jpg'),
  filename: 'moulin',
  content_type: 'image/jpg'
)
activity_26 = Activity.create!(itinerary_id: itinerary_9.id, title: "Sacré-Coeur", address: "Sacré-Cœur Basilica, 35 Rue du Chevalier de la Barre, 75018 Paris", description: " This iconic basilica is located at the top of Montmartre and offers breathtaking views of the city, along with stunning architecture and religious history.")
activity_26.photo.attach(
  io: URI.open('https://media.lesechos.com/api/v1/images/view/634a65f94964ff337a6d4f05/1280x720/0702547684232-web-tete.jpg'),
  filename: 'sacré-coeur',
  content_type: 'image/jpg'
)
activity_27 = Activity.create!(itinerary_id: itinerary_9.id, title: "A pink world", address: "La Maison Rose, 2 Rue de l'Abreuvoir, 75018 Paris" , description: " This pink-colored café has been a favorite spot of artists and writers for over a century, and offers a cozy and authentic atmosphere.")
activity_27.photo.attach(
  io: URI.open('https://offloadmedia.feverup.com/parissecret.com/wp-content/uploads/2021/05/29055633/shutterstock_750180577-1-1024x609-2.jpg'),
  filename: 'maison-rose',
  content_type: 'image/jpg'
)

puts "27 activities created"

puts "Creating reviews..."

review_1 = Review.create!(itinerary_id: itinerary_1.id, user_id: user_1.id, rating: 5, content: "We had a great day exploring the history of Paris with these three activities. The Gladines restaurant was a true gem with delicious food and a cozy atmosphere. The visit to La Conciergerie was a memorable experience, walking through the halls of this former prison and learning about the rich history of France. Overall, this itinerary provided a great mix of food, culture, and nature. Highly recommended!")
review_2 = Review.create!(itinerary_id: itinerary_1.id, user_id: user_4.id, rating: 4.5, content: "I surprised my girlfriend with this itinerary! We particularly appreciated the walk in the garden of plants that we had never seen while it is magnificent! To do again without any doubt ! On the other hand we were a little disappointed with the conciergerie which is very expensive and finally quite empty.")
review_3 = Review.create!(itinerary_id: itinerary_2.id, user_id: user_3.id, rating: 4.5, content: "I wanted to find a romantic and original itinerary and I was not disappointed.The walk around the canal Saint-Martin is perfectly romantic and it is a superb place often ignored in Paris! We loved the visit of the Grand Rex, which is very interesting and especially magical ! Unfortunately we had a bad experience with the cocktails with which we got sick!")
review_4 = Review.create!(itinerary_id: itinerary_2.id, user_id: user_4.id, rating: 4, content: "This itinerary is really good but there is some information to know before. Don't forget to book your visit to the Grand Rex because we arrived and there were no more seats available. Fortunately the walk to the Canal Saint-Martin and the cocktails made us forget that !")
review_5 = Review.create!(itinerary_id: itinerary_3.id, user_id: user_1.id, rating: 4, content: "My date was a foreigner, she particularly enjoyed this tour. She was able to discover the Effel Tower from all angles. But for a Parisian, this itinerary is a bit classic, and above all, it is expensive.")
review_6 = Review.create!(itinerary_id: itinerary_3.id, user_id: user_4.id, rating: 3.5, content: "This itinerary is much too centered around the Effel Tower is much too touristy ! Frankly not original !")
review_7 = Review.create!(itinerary_id: itinerary_4.id, user_id: user_3.id, rating: 4.5, content: "We were amazed by the Palace of Versailles ! What a wonder ! It's probably the most beautiful thing to see when you are in Paris ! Little Venice was a very good way to end the day. We loved the lunch but found it a bit expensive for the quality of the meal.")
review_8 = Review.create!(itinerary_id: itinerary_4.id, user_id: user_1.id, rating: 4, content: "Great visit, great food at le queen luch, but the Little Venice has no interest at all.")
review_9 = Review.create!(itinerary_id: itinerary_5.id, user_id: user_3.id, rating: 5, content: "I think I hit the nail on the head with my date with this itinerary. He was born artist and loved the originality of the activities ! We had a great time, especially in the cabaret which was just wonderful ")
review_10 = Review.create!(itinerary_id: itinerary_5.id, user_id: user_1.id, rating: 4.5, content: "This itinerary was a bit on the pricey side, but it was great and very original ! The food experience, typically French was really a blast ! Would recommend !")
review_11 = Review.create!(itinerary_id: itinerary_6.id, user_id: user_4.id, rating: 4, content: "This itinerary was good but I found that the activities did not all fit together ! I loved the Opéra Garnier but I would have preferred to finish the evening with a more chic restaurant!")
review_12 = Review.create!(itinerary_id: itinerary_6.id, user_id: user_1.id, rating: 5, content: "Wow this itinerary is absolutely great ! It's a mix of romance, surprise, luxury and fun! The Opera Garnier is beautiful and the show is genius ! Just perfect for a memorable evening !")
review_13 = Review.create!(itinerary_id: itinerary_7.id, user_id: user_3.id, rating: 4.5, content: "As both of us are big sportsmen, this date was perfect for my girlfriend and me. The walk in the Bois de Boulogne was great because we had great weather ! The suhis were good, but I've seen better.And the game at the Parc des Princes was great ! Great atmosphere !")
review_14 = Review.create!(itinerary_id: itinerary_7.id, user_id: user_4.id, rating: 4, content: "We loved the walk in the Bois de Boulogne and the sushis. But my date was disappointed by the Parc des Princes because the atmosphere was not very good and there were altercations between the supporters.")
review_15 = Review.create!(itinerary_id: itinerary_8.id, user_id: user_1.id, rating: 5, content: "This itinerary is a sure value with sublime monuments to rediscover. We particularly appreciated the food market. Would recommend this itinerary without a doubt !")
review_16 = Review.create!(itinerary_id: itinerary_8.id, user_id: user_3.id, rating: 3.5, content: "A very cliché route, nothing impressive")
review_17 = Review.create!(itinerary_id: itinerary_9.id, user_id: user_1.id, rating: 4.5, content: "This itinerary was really great ! We had a great time! Montmartre is really beautiful and my date dreamed of seeing the pink house !")
review_18 = Review.create!(itinerary_id: itinerary_9.id, user_id: user_3.id, rating: 4.5, content: "A little bit touristic but great time !")


puts "18 reviews created"

puts "Creating favorites..."
favorite_1 = Favorite.create!(itinerary_id: itinerary_1.id, user_id: user_1.id)
favorite_2 = Favorite.create!(itinerary_id: itinerary_2.id, user_id: user_1.id)
favorite_3 = Favorite.create!(itinerary_id: itinerary_3.id, user_id: user_1.id)
favorite_4 = Favorite.create!(itinerary_id: itinerary_4.id, user_id: user_1.id)

puts "4 favorites created"

puts "Database created"
