require_relative("../db/sql_runner")


class Film
  attr_accessor :id, :title, :price

def initialize(options)

  @id = options['id'].to_i if options ['id']
  @title = options['title']
  @price = options['price'].to_i

end

def save()

  sql = "INSERT INTO films (title, price)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@title, @price]
  result = SqlRunner.run(sql, values)
  @id = result [0]['id'].to_i

end

def self.all()
  sql = "SELECT * FROM films"
  film_hashes = SqlRunner.run(sql)
  return Film.map_items(film_hashes)
end

def self.map_items(film_hashes)
    result = film_hashes.map {|film_hash|
    self.new(film_hash)}
    return result
end


end