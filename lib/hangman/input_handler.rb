# Method destined to get and handle the inputs from the user
module InputHandler
  # Gets the char that will be attempted from the user
  def ask_attempt
    char = gets.strip.upcase
    until char.match?(/^[A-Z]$/) && !attempted_letters.include?(char)
      print "\e[1A\e[2K"
      char = gets.strip.upcase
    end
    char
  end

  def play_again?
    display_play_again
    input = gets.strip.downcase
    input == "y"
  end
end
