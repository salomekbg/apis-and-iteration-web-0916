require 'rest-client'
require 'JSON'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  
  # iterate ove the character hash to find the collection of `films` for the given
  #   `character`
  character_details = character_hash["results"].find {|queried_char| queried_char["name"].downcase == character}
  film_list = character_details["films"]
 
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  film_list.map do |film| 
    film_JSON = RestClient.get(film)
    film_hash = JSON.parse(film_JSON)
  end
  # return value of this method should be collection of info about each film. 
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list 
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_array)
  films_array.each_with_index do |film, i|
    puts "#{i + 1}. #{film["title"]}"
  end

  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  parse_character_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
