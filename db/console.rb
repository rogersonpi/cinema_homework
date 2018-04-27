require("pry")
require_relative("../models/customer")
require_relative("../models/films")
require_relative("../models/ticket")

Film.all()
Customer.all()
Ticket.all()

Film.delete_all()
Customer.delete_all()
Ticket.delete_all()

customer1 = Customer.new({

  'name' => 'Iain',
  'funds' => '300'

  })

customer1.save()

film1 = Film.new({
    'title' => 'The last Jedi',
    'price' => '300'

    })
film1.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id

  })

ticket1.save()

binding.pry
nil
