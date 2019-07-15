# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

20.times do
    User.create!(
        email: Faker::Movies::StarWars.unique.character.gsub(/\s+/, "") + "@pnimedia.com",
        password: "password",
        password_confirmation: "password",
        is_admin: Faker::Boolean.boolean
    )
end

20.times do |number|
    Raffle.create!(
        name: Faker::Movies::StarWars.planet,
        description: Faker::Movies::StarWars.quote,
        winner: rand(20),
        created_by: rand(20),
    )
end

20.times do |number|
    Rafflecontestant.create(
        user_id: rand(20),
        raffle_id: rand(20)
    )
end