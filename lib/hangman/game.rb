# Class responsible to centralize the logic for the game
class Game
  attr_accessor :secret_word
  attr_reader :words_list

  def initializer
    @words_list = []

    File.open("../../data/google-10000-english-no-swears.txt", "r") do |file|
      while (word = file.readline)
        @words_list << word if word.size.between?(5, 12)
      end

      file.close
    end

    @secret_word = select_word
  end

  def select_word
    new_word = secret_word
    new_word = words_list.sample until new_word != secret_word
  end
end
