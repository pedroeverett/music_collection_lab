require('pg')
require_relative('db/sql_runner.rb')
require_relative('artists.rb')

class Albums
  attr_accessor :title, :artists_id
  attr_reader :id

  def initialize(options)
    @title = options["title"]
    @artists_id = options["artists_id"].to_i()
    @id = options["id"].to_i()
  end

  def save()
    sql = "INSERT INTO albums (title) VALUES ('#{@title}') RETURNING id;"
    @id = SqlRunner.run(sql)[0]["id"].to_i()
  end

  def Albums.all()
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map{|album| Albums.new(album)}
  end

  def Albums.delete_all()
    sql = "DELETE FROM albums"
    SqlRunner.run(sql)
  end

  def artists()
    sql = "SELECT * FROM artists WHERE id = #{@artists_id}"
    results = SqlRunner.run(sql)
    artists_data = results[0]
    artist = Artists.new(artists_data)
    return artist
  
  end

end