# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create test user
@user = User.create(
  username: "Ninja",
  email: "ninja@email.com",
  password: "foobar",
  password_confirmation: "foobar",
  confirmed_at: DateTime.now
)
# Create test user events
50.times do
  Event.create(
    host_id: @user.id,
    title: Faker::Pokemon.name,
    body: Faker::Lorem.sentence(50),
    location: Faker::Address.street_address,
    date: Faker::Date.forward(100),
    picture: Faker::LoremPixel.image
  )
end

# Create other test users
20.times do
  name = Faker::Name.first_name
  user = User.create(
    username: name,
    email: "#{name}@example.com",
    password: "foobar",
    password_confirmation: "foobar"
  )
  # One event per user
  Event.create(
    host_id: user.id,
    title: Faker::Pokemon.name,
    body: Faker::Lorem.sentence(50),
    location: Faker::Address.street_address,
    date: Faker::Date.forward(100),
    picture: Faker::LoremPixel.image
    )
end

1000.times do
  user = User.find(Random.rand(1..21))
  event = Event.find(Random.rand(1..70))
  event.add_guest(user)
  event.comments.create(
    user_id: user.id,
    body: Faker::Lorem.sentence(3)
    )

end
