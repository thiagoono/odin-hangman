require_relative "displayer"
require_relative "input_handler"

# Class responsible to centralize the logic for the game
class Game
  include Displayer
  include InputHandler

  attr_accessor :secret_word, :failures
  attr_reader :words_list, :attempted_letters, :current_state

  def initialize
    # Reads the words list and filters by size
    @words_list = filter_list
    @secret_word = select_word.strip
    @failures = 0
    @attempted_letters = []
    @current_state = Array.new(@secret_word.size, "_")
    display_board
    puts secret_word
  end

  # Makes a new attempt
  def attempt?
    char = ask_attempt
    try_letter(char)

    display_board
    if game_ended?
      end_game
      return true
    end

    false
  end

  private

  # Reads the words list and filter by word size
  def filter_list
    filtered_list = []
    File.open(File.join(__dir__, "..", "..", "data", "google-10000-english-no-swears.txt"), "r") do |file|
      file.readlines.each { |word| filtered_list << word if word.size.between?(5, 12) }
    end
    filtered_list
  end

  # Selects a random word from the list and checks if it is not repeated
  def select_word
    new_word = secret_word
    new_word = words_list.sample until new_word != secret_word
    new_word
  end

  # Checks if the attempt was successful
  def try_letter(char)
    if secret_word.include?(char.downcase)
      success_attempt(char)
    else
      failed_attempt
    end

    update_attempted_letters(char)
  end

  # Updates the current state when the attempt is successful
  def success_attempt(char)
    secret_word.each_char.with_index do |secret_char, index|
      current_state[index] = char if char.downcase == secret_char
    end
  end

  # Updates the attempted letters
  def update_attempted_letters(char)
    attempted_letters << char
  end

  # Adds one to the failures count
  def failed_attempt
    @failures += 1
  end

  # Checks if the game has ended
  def game_ended?
    if failures >= 6
      game_over
      return true
    end

    unless current_state.include?("_")
      victory
      return true
    end

    false
  end

  # Ends the game
  def end_game
    display_answer
    display_play_again
  end
end
