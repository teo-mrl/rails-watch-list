require 'open-uri'
require 'json'

url = 'http://tmdb.lewagon.com/movie/top_rated'

response = URI.open(url).read

parsed_response = JSON.parse(response)

movies = parsed_response["results"]

movies.each do |movie|
  Movie.create(
    title: movie["title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["poster_path"]}",
    rating: movie["vote_average"]
  )
end

puts "#{Movie.count} movies created from the TMDB API."

List.create(name: "favs")
List.create(name: "horreur")
List.create(name: "action")
