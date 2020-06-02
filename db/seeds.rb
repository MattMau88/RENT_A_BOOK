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
puts "Cleaning database..."
User.destroy_all
# # destroying users will also destroy all books
Book.destroy_all
Rental.destroy_all
puts "Deleted old data"

puts "now creating new users incl. their own books and rentals"

test_user = User.create(email: "tester@lewagon.com", full_name: "Test User", password: "123456")

5.times do
  u = User.create!(email: Faker::Internet.email,
                    password: "123456",
                    full_name: Faker::TvShows::Friends.character,
                    profile_photo: Faker::Avatar.image
                    )
  rand(2..5).times do
    b = Book.create!(title: Faker::Book.title,
                    author: Faker::Book.author,
                    description: Faker::Quote.famous_last_words,
                    category: ["Business", "Fantasy", "Crime", "Poetry", "Children"].sample,
                    rental_fee_per_day: 2,
                    owner_id: u.id)
                    # photo: Faker::Avatar.image)

    rand(1..2).times do
    r = Rental.create!(pickup_location: Faker::Address.full_address,
                        pickup_date: Faker::Date.between(from: 2.days.ago, to: Date.today),
                        return_date: Faker::Date.forward(days: 20),
                        book_id: b.id,
                        rentee_id: u.id
                      )
    end
  end
end
puts "finished creating users incl their own books and rentals"






puts "Finished !"

