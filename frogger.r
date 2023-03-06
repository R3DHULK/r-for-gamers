# Define game board dimensions
board_width <- 20
board_height <- 10

# Define starting position of frog
frog_x <- 10
frog_y <- board_height

# Define starting positions and speeds of cars
car_positions <- c(2, 5, 8, 11, 14, 17)
car_speeds <- c(1, -1, 1, -1, 1, -1)

# Define game loop
while (TRUE) {
  
  # Clear console
  cat("\014")
  
  # Draw game board
  for (y in 1:board_height) {
    for (x in 1:board_width) {
      if (y == frog_y && x == frog_x) {
        cat("F")
      } else if (y == 1 || y == board_height) {
        cat("-")
      } else if (x %in% car_positions && y %in% 2:board_height-1) {
        cat("C")
      } else {
        cat(" ")
      }
    }
    cat("\n")
  }
  
  # Move cars
  car_positions <- car_positions + car_speeds
  
  # Check for collision with cars
  if (frog_y %in% 2:board_height-1 && frog_x %in% car_positions) {
    cat("Game over!")
    break
  }
  
  # Check for win
  if (frog_y == 1) {
    cat("You win!")
    break
  }
  
  # Wait for input
  input <- readline("Move frog (left/right/up/down): ")
  
  # Move frog
  if (input == "left" && frog_x > 1) {
    frog_x <- frog_x - 1
  } else if (input == "right" && frog_x < board_width) {
    frog_x <- frog_x + 1
  } else if (input == "up" && frog_y > 1) {
    frog_y <- frog_y - 1
  } else if (input == "down" && frog_y < board_height) {
    frog_y <- frog_y + 1
  }
}
