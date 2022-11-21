# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Rocket.destroy_all
first_user = User.create!(email: "toto@gmail.com", password: "azerty")
Rocket.create!(name: "Arianne", description: "Une fusée incroyable", user_id: "#{first_user.id}")
