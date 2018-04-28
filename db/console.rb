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
customer2 = Customer.new({

  'name' => 'BOB',
  'funds' => '400'

  })

customer2.save()

customer3 = Customer.new({

  'name' => 'Jeff',
  'funds' => '350'

  })

customer3.save()
customer4 = Customer.new({

  'name' => 'Tim',
  'funds' => '500'

  })

customer4.save()
customer5 = Customer.new({

  'name' => 'Rachel',
  'funds' => '900'

  })

customer5.save()

film1 = Film.new({
    'title' => 'The last Jedi',
    'price' => '300'

    })
film1.save()
film2 = Film.new({
    'title' => 'Mollys Game',
    'price' => '300'

    })
film2.save()
film3 = Film.new({
    'title' => 'Avengers: Infinity War',
    'price' => '300'

    })
film3.save()
film4 = Film.new({
    'title' => 'The Death of Stalin',
    'price' => '300'

    })
film4.save()
film5 = Film.new({
    'title' => 'Roadhouse',
    'price' => '300'

    })
film5.save()

ticket1 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film4.id

  })
ticket1.save()
ticket2 = Ticket.new({
  'customer_id' => customer3.id,
  'film_id' => film5.id

  })
ticket2.save()
ticket3 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film2.id

  })
ticket3.save()
ticket4 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film3.id

  })
ticket4.save()
ticket5 = Ticket.new({
  'customer_id' => customer4.id,
  'film_id' => film2.id

  })
ticket5.save()

binding.pry
nil
