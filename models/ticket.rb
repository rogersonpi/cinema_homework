require_relative("../db/sql_runner")


class Ticket
  attr_accessor :id, :customer_id, :film_id

def initialize(options)

  @id = options['id'].to_i if options ['id']
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i

end

#instance methods

  def save()

    sql = "INSERT INTO tickets (customer_id, film_id)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@customer_id, @film_id]
    result = SqlRunner.run(sql, values)
    @id = result [0]['id'].to_i

  end

  def update()

    sql = "
    UPDATE tickets SET (
      customer_id,
      film_id
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@customer_id, @film_id, @id]
    tickets_update = SqlRunner.run(sql, values)

  end

  # def update()
  #
  #   sql = "
  #   UPDATE tickets SET (
  #     customer_id,
  #     film_id,
  #   ) =
  #   (
  #     $1,$2,
  #   )
  #   WHERE id = $3"
  #   values = [@first_name, @last_name, @topping, @quantity, @id]
  #   customer_update = SqlRunner.run(sql, values)
#end

#  class methods

  def self.all()
    sql = "SELECT * FROM tickets"
    tickets_hashes = SqlRunner.run(sql)
    return self.map_items(tickets_hashes)
  end

  def self.map_items(tickets_hashes)
    result = tickets_hashes.map {|ticket_hash|
    self.new(ticket_hash)}
    return result
  end


def self.delete_all()
  sql = "DELETE FROM tickets"
  SqlRunner.run(sql)
end

end
