require_relative "displayer"

# Class responsible to centralize the logic for the game
class Game
  include(Displayer)

  attr_accessor :secret_word
  attr_reader :words_list, :wrong_letters

  def initialize
    # Reads the words list and filters by size
    @words_list = filter_list
    @secret_word = select_word
    @wrong_letters = []
    display_board
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
end
