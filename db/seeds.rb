# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require "json"
require "open-uri"
require 'faker'

Movie.destroy_all
List.destroy_all
puts "Destroying previous database"


url = "https://www.omdbapi.com/?s=potter&apikey=48727053"
serialized_movies = URI.open(url).read
movies = JSON.parse(serialized_movies)

movies["Search"].each do |movie|
  movie_to_add = Movie.new(title:movie["Title"], overview:Faker::Lorem.sentence, poster_url: movie["Poster"], rating: rand(0..10))
  movie_to_add.save
  puts "#{movie["Title"]} added"
end

  list_to_add = List.new(name: "Best Harry Potter Movies")
  list_to_add.save
  list_to_add = List.new(name: "Worse Harry Potter Movies")
  list_to_add.save
  puts "Lists added"

  # bookmark_to_add = Comment.new(comment: "Best movie", movie_id: Movie.find_by(title: "Harry Potter and the Deathly Hallows: Part 2").id, list_id: List.find_by(name: "Best Harry Potter Movies").id)
puts "seed loaded"
