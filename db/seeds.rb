# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

User.destroy_all
Item.destroy_all
Booking.destroy_all

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    username: Faker::HarryPotter.character,
    address: Faker::Address.city,
    last_name: Faker::Name.last_name,
    first_name: Faker::Name.first_name
  )
  user.save!
end

10.times do
  users = User.all
  item = Item.new(
    name: "#{Faker::Team.sport} ball",
    description: Faker::Hipster.paragraph,
    price: Faker::Number.decimal(2),
    user: users.sample,
    photo: Faker::Fillmurray.image,
  )
  item.save!
end

10.times do
  users = User.all
  items = Item.all
  booking = Booking.new(
    item: items.sample,
    user: users.sample,
    pick_time: Faker::Time.between(DateTime.now - 6, DateTime.now),
    return_time: Faker::Time.between(DateTime.now - 1, DateTime.now)
  )
  booking.save!
end

