require_relative "hangman/game"

game = Game.new

next until game.attempt?
