def welcome
  puts "Welcome Nerf Herders!"
end

def get_character_from_user
  puts "please enter a character"
  answer = gets.chomp.downcase
end


# def get_selection_from_user
# 	choices = ["Character", "Film", "Exit"]
# 	selection = nil
# 	while selection == nil
# 		puts "Please enter the number of your selection: "
# 		choices.each_with_index do |choice, index|
# 			puts "#{index + 1}. #{choice}"
# 		end
# 	initial_answer = gets.chomp.to_i 
# 	selection = initial_answer if (1..choices.length).include?(initial_answer)
# 	end
# end
