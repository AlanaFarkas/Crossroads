# 20.times do
#   User.create!(first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     phone_number: Faker::PhoneNumber.phone_number,
#     password: "Password123")
# end

# 35.times do
# 	Address.create!(address_1: Faker::Address.street_address,
#     address_2: Faker::Address.secondary_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zip: Faker::Address.zip,
#     address_type: "Home",
#     user: User.all.sample)
# end

# 50.times do
#    Establishment.create!(name: Faker::Company.name,
#     address_1: Faker::Address.street_address,
#     address_2: Faker::Address.secondary_address,
#     city: Faker::Address.city,
#     state: Faker::Address.state,
#     zip: Faker::Address.zip,
#     phone_number: Faker::PhoneNumber.phone_number,
#     website: Faker::Internet.domain_name)
# end

# 100.times do
# 	fav = Favorite.create(user: User.all.sample,
# 		establishment: Establishment.all.sample)
# end

bobby = User.create!(first_name: "Bobby", last_name: "Reith", email: "Bobby.Reith@gmail.com", phone_number: "123-456-7890", password: "Password123")

establishment = Establishment.create!(name: "Leo's Lemonade Stand", address_1: "123 Broadway", city: "New York", state: "NY", zip: "12345")

establishment1 = Establishment.create!(name: "Ayaz's Apple Orchard", address_1: "123 Main Street", city: "New York", state: "NY", zip: "12345")

establishment2 = Establishment.create!(name: "Alana's Elixir Palace", address_1: "123 5th Avenue", city: "New York", state: "NY", zip: "12345")

favorite = Favorite.create!(user_id: 1, establishment_id: 1)
favorite1 = Favorite.create!(user_id: 1, establishment_id: 2)
favorite2 = Favorite.create!(user_id: 1, establishment_id: 3)





bobby.favorites << favorite
bobby.favorites << favorite1
bobby.favorites << favorite2


