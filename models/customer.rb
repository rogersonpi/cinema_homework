require_relative("../db/sql_runner")


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

end
