require("pry-byebug")
require_relative("../albums.rb")
require_relative("../artists.rb")

Album.delete_all()
Artist.delete_all()



artist1 = Artist.new({"name" => "Nirvana"})
artist2 = Artist.new({"name" => "Meatloaf"})

artist1.save()
artist2.save()

album1 = Album.new({"title" => "Nevermind", "genre" => "Pop", "artist_id"=> artist1.id})
album2 = Album.new({"title" => "Bat out of hell", "genre" => "Rock", "artist_id"=> artist2.id})


album1.save()
album2.save()

binding.pry
nil

