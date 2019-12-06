# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Cleaning database..."
Nanny.destroy_all
User.destroy_all
Reservation.destroy_all

puts "Creating data..."

10.times do
  nanny = Nanny.new(
    first_name: Faker::Name.female_first_name,
    last_name: Faker::Name.last_name,
    city: ['Marseille', 'Lyon', 'Toulouse', 'Bordeaux', 'Nantes', 'Lille', 'La Rochelle', 'Montauban', 'Montpellier', 'Dax', 'Aix-en-Provence'].sample,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    description: Faker::Lorem.paragraph,
    moving_area: ["France", "Europe", "Monde"].sample,
    birth_date: Faker::Date.birthday(min_age: 18, max_age: 55),
    price_per_day_cents: Faker::Number.within(range:5..20),
    experience: ['Starter', 'Confirmée', 'Experte'].sample
  )
  nanny.remote_photo_url = "https://images.unsplash.com/photo-1520512202623-51c5c53957df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1834&q=80"
  nanny.save!
end

10.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    city: ['Marseille', 'Lyon', 'Toulouse', 'Bordeaux', 'Nantes', 'Lille', 'La Rochelle', 'Montauban', 'Montpellier', 'Dax', 'Aix-en-Provence'].sample,
    email: Faker::Internet.email,
    password: Faker::Internet.password(min_length: 6),
    description: Faker::Lorem.paragraph
  )
  user.remote_photo_url = "https://unsplash.com/s/photos/woman"
  user.save!
end

puts "Database created !!"

