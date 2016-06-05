20.times do
  User.create!(first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    password: "Password123")
end

35.times do
	Address.create!(address_1: Faker::Address.street_address,
    address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    address_type: "Home",
    user: User.all.sample)
end

50.times do
   Establishment.create!(name: Faker::Name.first_name,
    address_1: Faker::Address.street_address,
    address_2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip,
    phone_number: Faker::PhoneNumber.phone_number,
    website: Faker::Internet.url)
end

100.times do
	fav = Favorite.create(user: User.all.sample,
		establishment: Establishment.all.sample)
end
