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
end
