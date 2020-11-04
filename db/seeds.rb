# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(admin: 1, name: "kota", email: "newworld@gmail.com", password: "u8JNGy9C", created_at: Time.zone.now, updated_at: Time.zone.now)
