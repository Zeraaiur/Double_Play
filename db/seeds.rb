# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Item.destroy_all
Booking.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: "doubleplay",
    username: Faker::HarryPotter.character,
    address: "#{Faker::Address.building_number} Gouin Boulevard, Montreal, QC",
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name
  )
  user.save!
end

users = User.all
item = Item.new(
  name: "Basketball",
  description: "Brand new basketball, men's NBA sized and looking to get dunked!",
  price: "15.45",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1485395037613-e83d5c1f5290?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=303133965924236f90bd9dc78701e444&auto=format&fit=crop&w=1050&q=80"
item.save!

item = Item.new(
  name: "Tent",
  description: "Big all season tent. Sleeps 4 people, has some minor wear but will get you through any cold night!",
  price: "77.00",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1507668339897-8a035aa9527d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=353236fe54c58ca0323ebd9ea2e5ef3f&auto=format&fit=crop&w=701&q=80"
item.save!

item = Item.new(
  name: "Cleets",
  description: "Size 12 soccer sandels",
  price: "34.55",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1511110011044-5ce8fb4e7b61?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=75984e9a5ee095f71f462163bfbe2541&auto=format&fit=crop&w=634&q=80"
item.save!

item = Item.new(
  name: "Rock Climbing Equipment",
  description: "Helmet, shoes, harness, ropes and caribeeners all for your first crack at climbing. Good luck!",
  price: "166.21",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1505626237572-1e64df53ceae?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=eb1770d9759a8a11cf608ff785546d79&auto=format&fit=crop&w=634&q=80"

item.save!

item = Item.new(
  name: "Scuba Equipment",
  description: "Everything you need to dive into the depths of the unknown and find hidden treasures.",
  price: "345.98",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1496161341410-90ce6ad8b390?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0d66e4ceeedc14bdc73443c98713e63b&auto=format&fit=crop&w=967&q=80"
item.save!

item = Item.new(
  name: "Motorcycle, Helmet and Jacket",
  description: "Vroom Vroom! 10,000 horsepower to race whatever you want and WIN!",
  price: "1255.32",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1489731110502-23f1239ea56c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=1b99caa0328ac722439422dc82eab68f&auto=format&fit=crop&w=634&q=80"
item.save!

item = Item.new(
  name: "Golf Clubs",
  description: "A set of Callaway golf clubs for your trip to the links. Lefty set.",
  price: "76.00",
  user: users.first,
  rented: false
)
item.remote_photo_url = "https://images.unsplash.com/photo-1496062339235-ae16724801fb?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=ef76080de8f41944e36e37f65b41b598&auto=format&fit=crop&w=1050&q=80"
item.save!

10.times do
  users = User.all
  items = Item.all
  booking = Booking.new(
    item: items.sample,
    user: users.first,
    pick_time: Faker::Time.between(DateTime.now - 6, DateTime.now),
    return_time: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
  booking.save!
end

