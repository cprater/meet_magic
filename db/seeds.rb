User.create(name: "admin", email: "c@p.com", password: "bigbootyjudy", password_confirmation: "bigbootyjudy", location: "Fort Worth, TX, United States", level: 100, score: 100, mentor: true)

cities = ["Fort Worth, TX", "Denver, CO", "Chicago, IL"]

10.times do
	password = Faker::Internet.password(8)
	User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: password, password_confirmation: password, location: cities.sample, level: rand(3) + 1, score: Faker::Number.number(2), mentor: [true, false].sample )
end