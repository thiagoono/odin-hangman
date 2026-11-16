# Module responsible to display the visuals to the user
module Displayer
  def display_board
    display_hangman
    display_secret_word
    display_guessed_letters
    display_remaining_attempts
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
    puts <<~MESSAGE
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

  def clear_board
    15.times { print "\e[1A\e[2K" }
  end

  private

  def display_hangman
    puts <<~BOARD
        +---+           type "save" to save the game
        |   |
        #{part(0)}   |
       #{part(1)}#{part(2)}#{part(3)}  |
       #{part(4)} #{part(5)}  |
            |
      =========

    BOARD
  end

  def part(num)
    return find_part(num) if failures > num

    " "
  end

  def find_part(num)
    case num
    when 0
      "O"
    when 1, 4
      "/"
    when 2
      "|"
    when 3, 5
      "\\"
    end
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
end
