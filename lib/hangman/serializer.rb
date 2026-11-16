require "json"

# Module destined to serialize and deserialize the data
module Serializer
  def save_game
    File.write(File.join(__dir__, "..", "..", "data", "saved_game.json"),
               JSON.dump({ secret_word: secret_word, attempted_letters: attempted_letters }))
  end
end
