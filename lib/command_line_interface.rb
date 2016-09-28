def welcome
  puts "Welcome Nerf Herders!"
end

def get_character_from_user
  puts "please enter a character"
  answer = gets.chomp.downcase
end

def get_selection_from_user
  selection = nil
  while selection == nil
    puts "Please enter your selection:"
    puts "  1 - Character"
    puts "  2 - Film"

    initial_answer = gets.chomp

    selection = initial_answer if initial_answer == "1" || initial_answer == "2"
  end
end
