require('pg')
require_relative('../albums.rb')
require_relative('../artists.rb')

class SqlRunner

  def SqlRunner.run(sql)
    begin
    db = PG.connect({ dbname: 'music_collection', host: 'localhost' })
    result = db.exec(sql)
  ensure
    db.close()
  end
  return result
  end

end