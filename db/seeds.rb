# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'
require 'json'

# IF I WANT TO CLEAN MY DB, UN_COMMENT THE FOLLOWING LINES:
# puts "Cleaning database..."
# User.destroy_all
# destroying users will also destroy all books
# Rental.destroy_all
# puts "Deleted old data"

puts "now creating new users incl. books and rentals"

test_user = User.create(email: "tester@lewagon.com", full_name: "Test User", password: "123456")

5.times do
  u = User.create!(email: #proper email-faker,
                    password: "123456",
                    full_name: #name-faker,
                    profile_photo: #add avatar url
                    )
  rand(2..5).times do
    b = Book.create!(title: Faker::TvShows::GameOfThrones.character,
                    content: Faker::TvShows::GameOfThrones.quote,
                    owner_id: u.id)



  end
end
puts "Finished !"

