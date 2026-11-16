require_relative "hangman/game"

new_game = Game.new(false)

loop do
  next until new_game.attempt?

  break unless new_game.play_again?

  new_game = Game.new(true)
end
