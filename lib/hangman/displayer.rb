# Module responsible to display the visuals to the user
module Displayer
  def display_board
    display_hangman
    display_secret_word
    display_guessed_letters
    display_remaining_attempts
  end

  def display_hangman
    puts <<~BOARD
        +---+
        |   |
        O   |
       /|\\  |
       / \\  |
            |
      =========

    BOARD
  end

  def display_secret_word
    puts "WORD: #{current_state.join(' ')}"
  end

  def display_guessed_letters
    puts "\nGuessed letters:"
    puts attempted_letters.join(" - ")
  end

  def display_remaining_attempts
    puts "\nRemaining attempts: #{6 - failures}"
  end

  def victory
    puts <<~MESSAGE
      =========================
            YOU WIN!
      =========================

      Congratulations! You guessed the word:
    MESSAGE
  end

  def game_over
    <<~MESSAGE
      =========================
            GAME OVER!
      =========================

      The correct word was:
    MESSAGE
  end

  def display_answer
    puts secret_word
  end

  def display_play_again
    puts "\nWould you like to play again? (y/n)"
  end
end
