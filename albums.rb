require('pg')
require_relative('db/sql_runner.rb')
require_relative('artists.rb')

class Album
  attr_accessor :title, :artist_id, :genre
  attr_reader :id

  def initialize(options)
    @title = options["title"]
    @artist_id = options["artist_id"].to_i()
    @genre = options["genre"]
    @id = options["id"].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i()
  end

  def Album.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Album.new(album)}
  end

  def Album.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artist()
    sql = "SELECT * FROM artists WHERE id = #{@artist_id}"
    results = SqlRunner.run(sql)
    artists_data = results[0]
    artist = Artist.new(artists_data)
    return artist
  end

  def update()
    sql = "UPDATE albums SET (name, title, genre) = ('#{@title}', '#{@genre}') WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM albums WHERE id = #{@id}"
    SqlRunner.run(sql)
  end

  def Album.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    result = SqlRunner.run(sql)
    album_hash = result.first
    album = Album.new(album_hash)
    return album
  end

end