# Define game board dimensions
board_width <- 20
board_height <- 10

# Define starting positions of moles
mole_positions <- sample(1:board_width, 5, replace=FALSE)

# Define starting score
score <- 0

# Define game loop
while (TRUE) {
  
  # Clear console
  cat("\014")
  
  # Draw game board
  for (y in 1:board_height) {
    for (x in 1:board_width) {
      if (y == 1) {
        cat("-")
      } else if (x %in% mole_positions && y == 2) {
        cat("M")
      } else {
        cat(" ")
      }
    }
    cat("\n")
  }
  
  # Wait for input
  input <- readline("Whac a mole (1-20): ")
  
  # Check for hit
  if (as.numeric(input) %in% mole_positions) {
    mole_positions <- sample(1:board_width, 5, replace=FALSE)
    score <- score + 1
  }
  
  # Check for game over
  if (score == 10) {
    cat("Game over! Final score: ", score)
    break
  }
  
  # Display score
  cat("Score: ", score, "\n")
}
