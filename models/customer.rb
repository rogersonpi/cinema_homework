require_relative("../db/sql_runner")
require_relative('films')

class Customer
  attr_accessor :id, :name, :funds

def initialize(options)

  @id = options['id'].to_i if options ['id']
  @name = options['name']
  @funds = options['funds'].to_i

end

def save()

  sql = "INSERT INTO customers (name, funds)
  VALUES
  ($1, $2)
  RETURNING id"
  values = [@name, @funds]
  result = SqlRunner.run(sql, values)
  @id = result [0]['id'].to_i

end

def update()

  sql = "UPDATE customers SET (
    name,
    funds
  ) =
  (
    $1, $2
  )
  WHERE id = $3"
  values = [@title, @price, @id]
  tickets_update = SqlRunner.run(sql, values)

end

def find_films()

sql =  'SELECT films.* FROM customers
     INNER JOIN tickets ON customers.id = tickets.customer_id
     INNER JOIN films ON tickets.film_id = films.id
     WHERE customers.id = $1'
  values = [@id]
  results = SqlRunner.run(sql, values)
  result = results.map{|hash| Film.new(hash)}
  return result
end

def tickets_bought()
sql =  'SELECT tickets.* FROM customers
     INNER JOIN tickets ON customers.id = tickets.customer_id
     WHERE customers.id = $1'
  values = [@id]
  results = SqlRunner.run(sql, values)
  return results.count
  # result = results.map{|hash| Tickets.new(hash)}
  # return result.count
end

def self.all()
  sql = "SELECT * FROM customers"
  customers_hashes = SqlRunner.run(sql)
  return self.map_items(customers_hashes)
end

def self.map_items(customer_hashes)
    result = customer_hashes.map {|customer_hash|
    self.new(customer_hash)}
    return result
end

def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

end
