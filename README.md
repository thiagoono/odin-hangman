# Hangman

A command-line Hangman game built with Ruby as part of [The Odin Project](https://www.theodinproject.com/).

## Features

- Random word selection from a list of 10,000 English words.
- Word filtering to select words between 5 and 12 characters.
- Interactive command-line interface with an ASCII hangman drawing.
- Letter input validation to prevent invalid or repeated guesses.
- Visual feedback showing guessed letters and remaining attempts.
- Win and loss detection.
- Option to save the current game and resume it later.
- Game state serialization and deserialization using JSON.
- Option to start another round without restarting the program.

## Built With

- Ruby
- JSON — for saving and loading game states.

## Getting Started

### Prerequisites

Make sure Ruby is installed on your system.

No external gems are required.

### Running the Game

1. Clone the repository:

   ```bash
   git clone https://github.com/thiagoono/odin-hangman.git
   ```

2. Navigate to the project directory:

   ```bash
   cd odin-hangman
   ```

3. Run the game:

   ```bash
   ruby lib/hangman.rb
   ```

## How to Play

1. The game selects a random word from the word list.
2. The word is displayed as a sequence of underscores, representing its letters.
3. Enter one letter at a time to guess the secret word.
4. Correct guesses reveal the corresponding letters.
5. Incorrect guesses add a new part to the hangman drawing and reduce the remaining attempts.
6. You have six incorrect attempts before the game ends.
7. Guess the complete word to win the round.

### Saving and Loading

- Type `save` during the game to save your current progress.
- The game state is stored in `data/saved_game.json`.
- When starting the program, you can choose to load the previously saved game.
- The saved state includes the secret word and previously attempted letters.

## Project Structure

```text
odin-hangman/
├── data/
│   ├── google-10000-english-no-swears.txt
│   └── saved_game.json
├── lib/
│   ├── hangman/
│   │   ├── displayer.rb
│   │   ├── game.rb
│   │   ├── input_handler.rb
│   │   └── serializer.rb
│   └── hangman.rb
└── README.md
```

### File Responsibilities

- `hangman.rb` — initializes the game and manages the main game loop.
- `game.rb` — centralizes the game logic, including word selection, guesses, and win/loss conditions.
- `displayer.rb` — handles terminal output, including the hangman drawing, guessed letters, and game messages.
- `input_handler.rb` — receives and validates user input, reads the word list, and handles the option to load a saved game.
- `serializer.rb` — handles saving and loading game states through JSON serialization.
- `google-10000-english-no-swears.txt` — provides the word list used to select the secret word.
- `saved_game.json` — stores the saved game state.

## License

This project was created for educational purposes as part of The Odin Project curriculum.