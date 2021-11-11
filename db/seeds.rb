# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'

puts 'Creating movies'

url = 'http://tmdb.lewagon.com/movie/top_rated'
results = JSON.parse(URI.open(url).read)
movies = results['results']

movies.each do |movie|
  poster_path = movie['poster_path']
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{poster_path}",
    rating: movie['vote_average']
  )
end

puts 'Finished!'
