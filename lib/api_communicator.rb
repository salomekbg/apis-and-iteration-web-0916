require 'rest-client'
require 'JSON'
require 'pry'

def url_to_hash(url)
  data_as_json = RestClient.get(url)
  data_as_hash = JSON.parse(data_as_json)
end


def find_character(character)
  #check each page until the last page, for the character
  page = "http://www.swapi.co/api/people/"
  while page != nil do
    character_hash = url_to_hash(page)

    character_details = character_hash["results"].find {|queried_char| queried_char["name"].downcase == character}
    #stop if the character can't be found on any page
    break if character_details != nil

    page = character_hash["next"]
  end
  character_details
  #returns hash of character information
end

def get_character_movies_from_api(character)
  film_list = find_character(character)["films"]

  film_list.map do |film_url| 
    url_to_hash(film_url)
  end
  #returns an array of film details hash
end

def parse_character_movies(films_array)
  film_list = films_array.each_with_object([]) do |film, film_list|
    film_list << "Episode #{film["episode_id"]}: #{film["title"]}"
  end

  puts "\nFilms:"
  puts film_list.sort
  #returns list of films containing character
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  parse_character_movies(films_array)
end