require 'rest-client'
require 'JSON'
require 'pry'

def url_to_hash(url)
  data_as_json = RestClient.get(url)
  data_as_hash = JSON.parse(data_as_json)
end

def find_character(character)
  page = "http://www.swapi.co/api/people/"
  while page != nil do
    character_hash = url_to_hash(page)

    character_details = character_hash["results"].find {|queried_char| queried_char["name"].downcase == character}
    break if character_details != nil

    page = character_hash["next"]
  end

  character_details
end

def get_character_movies_from_api(character)
  film_list = find_character(character)["films"]

  film_list.map do |film_url| 
    url_to_hash(film_url)
  end
end

def parse_character_movies(films_array)
  film_list = films_array.each_with_object([]) do |film, film_list|
    film_list << "Episode #{film["episode_id"]}: #{film["title"]}"
  end

  puts "\nFilms:"
  puts film_list.sort
  # some iteration magic and puts out the movies in a nice list
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  parse_character_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
