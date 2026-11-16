# Method destined to get and handle the inputs from the user
module InputHandler
  # Gets the char that will be attempted from the user
  def ask_attempt
    input = gets.strip.upcase
    save_game if input == "SAVE"
    until input.match?(/^[A-Z]$/) && !attempted_letters.include?(input)
      print "\e[1A\e[2K"
      input = gets.strip.upcase
      save_game if input == "SAVE"
    end
    input
  end

  def play_again?
    display_play_again
    input = gets.strip.downcase
    23.times { print "\e[1A\e[2K" } if input == "y"
    input == "y"
  end

  # Reads the words list and filter by word size
  def filter_list
    filtered_list = []
    File.open(File.join(__dir__, "..", "..", "data", "google-10000-english-no-swears.txt"), "r") do |file|
      file.readlines.each { |word| filtered_list << word if word.size.between?(6, 13) }
    end
    filtered_list
  end

  def ask_to_load?
    return false unless File.file?(File.join(__dir__, "..", "..", "data", "saved_game.json"))

    puts "Would you like to load your last game?(y/n)"
    gets.strip.downcase == "y"
  end
end
