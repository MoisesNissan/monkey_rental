require "faker"
require "open-uri"

photos = [
  "https://i.pinimg.com/originals/85/30/99/853099bcccb8d86af7f84f3e8266d44f.jpg",
  "https://i.pinimg.com/originals/5e/22/6b/5e226b2e25372e945ee7b0f1a01f88aa.jpg",
  "https://i2.wp.com/petskona.com/wp-content/uploads/2021/03/142161651_711337549755709_6725928493895270582_n.jpg?fit=1080%2C1080&ssl=1",
  "https://static.wixstatic.com/media/ba8560_6fe32414afc242aa8d3668f55dc2eaee~mv2.jpg/v1/fill/w_926,h_926,q_90/ba8560_6fe32414afc242aa8d3668f55dc2eaee~mv2.jpg",
  "https://lh4.googleusercontent.com/PRAqghnzsjTSa8lK6Q5Wpai0ycZuwwzsgB88dQ_ks_0xaI_KCOem4LspPViYjAhM3YNo0L449CB_qHkqwx5cLMQjDA91igLOypgaZVGgFb00exT2L7O05quVP-g_t0HsdQ=s412",
  "http://www.thetropicalrainforestpreserve.com/monkeys/wp-content/gallery/monkeys/monkey-for-sale-0006.jpg",
  "http://pasopacifico.org/wp-content/uploads/2020/12/2424561636_e5fa3a7b95_o-copy-1024x682.jpg",
  "https://i.pinimg.com/736x/40/d9/44/40d94482e0e1e8707cfb63c10ebb02d0.jpg",
  "https://static.wixstatic.com/media/ba8560_7b2f4414a6494a62ac6f908b6eb0d904~mv2.jpg/v1/fill/w_926,h_926,q_90/ba8560_7b2f4414a6494a62ac6f908b6eb0d904~mv2.jpg",
  "https://s.hdnux.com/photos/31/57/14/6746929/3/rawImage.jpg",
  "https://www.toronto-classifieds.ca/uploads/vic/1612968501925_A0118CDEE1FC5B821A7EC5EDBE6BCD33/12043088_10201006591565148_3733143712806871428_n.jpg",
  "https://www.karenmonkeysforsale.com/Bob.jpg",
  "https://cdn.businessyab.com/assets/uploads/b8d43b3d21006e210a9a957c1e62fcc7_-united-states-texas-kaufman-county-forney-northridge-drive-2100-capuchin-monkey-for-sale-254-244-2821.jpg",
  "https://themonkeyhome.com/wp-content/uploads/2019/11/java-boy.jpg",
  "https://static.wixstatic.com/media/ba8560_e30724a75f6947718d62935fa4a646a3~mv2.jpg/v1/fill/w_926,h_926,q_90/ba8560_e30724a75f6947718d62935fa4a646a3~mv2.jpg"
]

puts 'Deleting previously created users and monkeys'
User.destroy_all
Monkey.destroy_all
# TODO: Write a seed to insert 100 posts in the database
puts 'Creating a user...'
user = User.new(
  email: "nacho@gmail.com",
  password: "12345678"
)
user.save!

puts 'Creating 15 fake monkeys...'
pic_index = 0
15.times do
  monkey = Monkey.new(
    user: user,
    name: Faker::FunnyName.name,
    species: "Simian",
    age: rand(1..20),
    weight: rand(5..30),
    price: rand(150..300),
    address: Faker::Address.street_address
  )
  file = URI.open(photos[pic_index])
  sleep(5)
  monkey.photo.attach(io: file, filename: 'monkey.png')
  monkey.save!
  pic_index += 1
end
puts 'Finished!'
