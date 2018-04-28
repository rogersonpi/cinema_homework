require_relative("../db/sql_runner")
require_relative('films')

class Customer
  attr_accessor :id, :name, :funds

def initialize(options)

  @id = options['id'].to_i if options ['id']
  @film_id= options['film_id'].to_i
  @screening= options['screening']

end

def save()

  sql = "INSERT screenings  ('film_id', 'screening')
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@film_id, @screening]
  result = SqlRunner.run(sql, values)
  @id = result [0]['id'].to_i

end









end
