require('pg')
require_relative('db/sql_runner.rb')
require_relative('albums.rb')

class Artists

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i()
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i()
  end

  def Artists.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|artist| Artists.new(artist)}
  end

  def Artists.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def artist_albums
    sql = "SELECT * FROM albums WHERE artists_id = #{@id}"
    result = SqlRunner.run(sql)
    albums = result.map{ |album| Albums.new(album)}
    return albums
  end

end