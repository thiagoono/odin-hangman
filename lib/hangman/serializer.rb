require "json"

# Module destined to serialize and deserialize the data
module Serializer
  def save_game
    File.write(File.join(__dir__, "..", "..", "data", "saved_game.json"),
               JSON.dump({ secret_word: secret_word, attempted_letters: attempted_letters }))

    exit
  end

  def load_game
    data = deserialize

    @secret_word = data["secret_word"]
    @current_state = Array.new(@secret_word.size, "_")
    data["attempted_letters"].each { |char| try_letter(char) }
  end

  def deserialize
    data = File.read(File.join(__dir__, "..", "..", "data", "saved_game.json"))
    JSON.parse data
  end
end
