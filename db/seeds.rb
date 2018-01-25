# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
charles = User.create(
	pseudo: "Mirack",
	first_name: "Charles",
	last_name: "Duporge",
	password: "toto",
	money: 500,
	mail: "cd@toto.fr",
	nb_round: 1,
	is_round_closed: false,
	is_mercato_closed: false
	)

louis = User.create(
	pseudo: "Fouiny",
	first_name: "Louis",
	last_name: "Charbonnier",
	password: "loulou",
	money: 500,
	mail: "lc@toto.fr",
	nb_round: 1,
	is_round_closed: false,
	is_mercato_closed: false
	)

olivier = User.create(
	pseudo: "LaviFR",
	first_name: "Olivier",
	last_name: "Maurie",
	password: "olive",
	money: 500,
	mail: "om@toto.fr",
	nb_round: 1,
	is_round_closed: false,
	is_mercato_closed: false
	)

# Players assigned to user in order to test /free route

# charles.players.create(name: "Kamano", position: "A", min_price: 5)
# charles.players.create(name: "Costil", position: "G", min_price: 10)
# charles.players.create(name: "Raggi", position: "D", min_price: 7)

# louis.players.create(name: "Cafu", position: "A", min_price: 2)
# louis.players.create(name: "Mandanda", position: "G", min_price: 10)
# louis.players.create(name: "Sabaly", position: "D", min_price: 7)

# olivier.players.create(name: "Njie", position: "A", min_price: 5)
# olivier.players.create(name: "Vercoutre", position: "G", min_price: 10)
# olivier.players.create(name: "Perrin", position: "D", min_price: 7)

neymar 			 = Player.create(name: "Neymar", position: "A", min_price: 50, user_id: nil)
cavani 			 = Player.create(name: "Edinson Cavani", position: "A", min_price: 46, user_id: nil)
falcao 			 = Player.create(name: "Falcao", position: "A", min_price: 41, user_id: nil)
mbappe 			 = Player.create(name: "Kylian Mbappe", position: "A", min_price: 38, user_id: nil)
thauvin 		 = Player.create(name: "Florian Thauvin", position: "A", min_price: 37, user_id: nil)
mariano 		 = Player.create(name: "Mariano", position: "A", min_price: 33, user_id: nil)
fabinho 		 = Player.create(name: "Fabinho", position: "M", min_price: 32, user_id: nil)
fekir        = Player.create(name: "Nabil Fekir", position: "A", min_price: 30, user_id: nil)
luiz_gustavo = Player.create(name: "Luiz Gustavo", position: "M", min_price: 29, user_id: nil)
glik 				 = Player.create(name: "Kamil Glik", position: "D", min_price: 29, user_id: nil)
balotelli 	 = Player.create(name: "Mario Balotelli", position: "A", min_price: 29, user_id: nil)
malcolm 		 = Player.create(name: "Malcolm", position: "A", min_price: 25, user_id: nil)
lopes 			 = Player.create(name: "Anthony Lopes", position: "G", min_price: 25, user_id: nil)
jemerson 		 = Player.create(name: "Jemerson", position: "D", min_price: 24, user_id: nil)
lienard 		 = Player.create(name: "Dimitri Lienard", position: "M", min_price: 24,  user_id: nil)
veratti 		 = Player.create(name: "Marco Veratti", position: "M", min_price: 23, user_id: nil)
toko_ekambi  = Player.create(name: "Karl Toko Ekambi", position: "A", min_price: 22, user_id: nil)
lemar 			 = Player.create(name: "Thomas Lemar", position: "M", min_price: 22, user_id: nil)
rabiot 			 = Player.create(name: "Adrien Rabiot", position: "M", min_price: 22, user_id: nil)

# # Neymar bid
# charles.bids.create(price: 75, player: neymar)
# louis.bids.create(price: 85, player: neymar)

# # Cavani bid
# charles.bids.create(price: 65, player: cavani)
# louis.bids.create(price: 68, player: cavani)
# olivier.bids.create(price: 80, player: cavani)

# # Fekir bid
# louis.bids.create(price: 40, player: fekir)

# # Lopes bid
# charles.bids.create(price: 32, player: lopes, nb_round: 2)
# louis.bids.create(price: 35, player: lopes, nb_round: 2)
# olivier.bids.create(price: 20, player: lopes, nb_round: 2)

# # Jemerson bid
# louis.bids.create(price: 10, player: jemerson, nb_round: 2)
# olivier.bids.create(price: 15, player: jemerson, nb_round: 2)

# # Lemar bid
# charles.bids.create(price: 50, player: lemar, nb_round: 2)
