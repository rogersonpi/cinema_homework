require_relative("../db/sql_runner")
require_relative('films')

class Screenings
  attr_accessor :id, :film_id, :screening, #:title

def initialize(options)

  @id = options['id'].to_i if options ['id']
  @screening= options['screening']
  @film_id= options['film_id'].to_i
  #@title = options ['title']

end

def save()

  sql = "INSERT INTO screenings (screening, film_id)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@screening, @film_id# @title]
  result = SqlRunner.run(sql, values)
  @id = result [0]['id'].to_i

end


# def save()
#
#   sql = "INSERT INTO customers (name, funds)
#   VALUES
#   ($1, $2)
#   RETURNING id"
#   values = [@name, @funds]
#   result = SqlRunner.run(sql, values)
#   @id = result [0]['id'].to_i
#
# end
#





end
