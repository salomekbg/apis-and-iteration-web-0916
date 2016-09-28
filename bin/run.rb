#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)

# selection = get_selection_from_user
# case selection
# 	when 1
# 		show_character_movies(character)
# 	when 2
# 		#get movie information - new method
# end



