# Create a list of snakes and ladders
game_board <- list(`3` = 17, `7` = 11, `19` = 2, `21` = 9, `27` = 4, `26` = 10)

# Set the initial position and number of moves
position <- 0
moves <- 0

# Play the game
while (position < 30) {
  # Roll the dice
  roll <- sample(1:6, 1, replace = TRUE)
  cat("You rolled a", roll, "\n")
  
  # Update the position
  position <- position + roll
  
  # Check if the position is a snake or ladder
  if (position %in% names(game_board)) {
    new_position <- game_board[[as.character(position)]]
    cat("You landed on a snake or ladder! Moving to position", new_position, "\n")
    position <- new_position
  }
  
  # Print the current position
  cat("You are now at position", position, "\n")
  
  # Increment the number of moves
  moves <- moves + 1
}

# Print the number of moves it took to win
cat("Congratulations! You won in", moves, "moves!")
