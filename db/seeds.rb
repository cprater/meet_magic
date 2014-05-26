# User.create(name: "admin", email: "c@p.com", password: "bigbootyjudy", password_confirmation: "bigbootyjudy", location: 60618, level: 100, score: 100, mentor: true)

10.times do
	password = Faker::Internet.password(8)
	User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: password, password_confirmation: password, location: Faker::Address.city, level: rand(3) + 1, score: Faker::Number.number(2), mentor: [true, false].sample )
end