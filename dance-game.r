# Function to play the dance game
play_dance_game <- function() {
  cat("Welcome to the dance simulator game!\n")
  cat("Follow the dance moves by entering the corresponding numbers on your keyboard.\n")
  cat("Press ENTER to start the game.\n")
  readline()

  # Set up dance moves and their corresponding numbers
  dance_moves <- list("Jump", "Turn left", "Turn right", "Spin", "Kick", "Squat")
  dance_numbers <- c(1, 2, 3, 4, 5, 6)

  # Shuffle dance moves for each round
  round_moves <- sample(dance_moves)

  # Initialize score
  score <- 0

  # Loop through dance moves for each round
  for (i in 1:length(round_moves)) {
    # Display current move and get user input
    cat("\n", round_moves[i], "\n")
    user_input <- readline(prompt = "Enter the corresponding number: ")

    # Check if user input is correct
    if (as.numeric(user_input) == dance_numbers[i]) {
      cat("Correct!\n")
      score <- score + 1
    } else {
      cat("Incorrect.\n")
    }
  }

  # Display final score
  cat("\nYour final score is: ", score, "\n")

  # Ask user if they want to play again
  play_again <- readline(prompt = "Do you want to play again? (y/n) ")
  if (play_again == "y") {
    play_dance_game()
  } else {
    cat("Thanks for playing!\n")
  }
}

# Call the function to start the game
play_dance_game()
