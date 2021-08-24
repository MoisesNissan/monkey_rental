require "faker"
# TODO: Write a seed to insert 100 posts in the database
puts 'Creating a user...'
user = User.new(
  email: "nacho@gmail.com",
  password: "12345678"
)
user.save!

puts 'Creating 15 fake monkeys...'
15.times do
  monkey = Monkey.new(
    user: user,
    name: Faker::FunnyName.name,
    species: "Simian",
    age: rand(1..20),
    weight: rand(5..30),
    price: rand(150..300),
    address: Faker::Address.street_address,
    lat: rand(5..10),
    lng: rand(5..10)
  )
  monkey.save!
end
puts 'Finished!'
