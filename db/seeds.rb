User.create(email: "test@test.com", password: "password", password_confirmation: "password", first_name: "John", last_name: "Doe")
10.times do 
  t = Trip.create(
    name: Faker::Address.state,
    start_date: Faker::Time.forward(days:23, period: :morning),
    end_date: Faker::Time.backward(days:23, period: :evening),
    user_id: 1
  )

  10.times do
    l = Location.create(
    name: Faker::Address.community,
    days: Faker::Number.number(digits: 2),
    trip_id: t.id
    )
    10.times do
      Address.create(
        street: Faker::Address.street_address,
        city: Faker::Address.city,
        state: Faker::Address.state,
        zip: Faker::Address.zip_code,
        location_id: l.id
      )
    end
  end

  10.times do
    Review.create(
    author: Faker::DcComics.name,
    body: Faker::Lorem.words(number: 25),
    title: Faker::Lorem.words(number: 3),
    trip_id: t.id
    )
  end


end



puts "Data Seeded"
