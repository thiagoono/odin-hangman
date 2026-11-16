require_relative "displayer"

# Class responsible to centralize the logic for the game
class Game
  include(Displayer)

  attr_accessor :secret_word
  attr_reader :words_list, :attempted_letters, :current_state

  def initialize
    # Reads the words list and filters by size
    @words_list = filter_list
    @secret_word = select_word
    @attempted_letters = []
    @current_state = []
    display_board
  end

  def attempt?
    char = ask_attempt
    try_letter(char)
  end

  private

  # Reads the words list and filter by word size
  def filter_list
    filtered_list = []
    File.open("../../data/google-10000-english-no-swears.txt", "r") do |file|
      while (word = file.readline)
        filtered_list << word if word.size.between?(5, 12)
      end

      file.close
    end
    filtered_list
  end

  # Selects a random word from the list and checks if it is not repeated
  def select_word
    new_word = secret_word
    new_word = words_list.sample until new_word != secret_word
  end

  def ask_attempt
    char = ""
    char = gets.strip.upcase until char.match?(/^[A-Z]$/)
  end

  def try_letter(char)
    success_attempt(char) if secret_word.include?(char)

    update_attempted_letters(char)
  end

  def success_attempt(char)
    secret_word.each_char.with_index { |secret_char, index| current_state[index] = char if char == secret_char }
  end

  def update_attempted_letters(char)
    attempted_letters << char
  end
end
