require("pry-byebug")
require_relative("../albums.rb")
require_relative("../artists.rb")

Albums.delete_all()
Artists.delete_all()



artist1 = Artists.new({"name" => "Nirvana"})
artist2 = Artists.new({"name" => "Meatloaf"})

artist1.save()
artist2.save()

album1 = Albums.new({"title" => "Nevermind", "artists_id"=> artist1.id})
album2 = Albums.new({"title" => "Bat out of hell", "artists_id"=> artist2.id})


album1.save()
album2.save()

binding.pry
nil

