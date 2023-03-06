# Set up the track and car positions
track_length <- 30
car_position <- 15
track <- rep(" ", track_length)
track[car_position] <- "o"

# Function to move the car left or right
move_car <- function(direction) {
  if (direction == "left") {
    if (car_position > 1) {
      track[car_position] <- " "
      car_position <- car_position - 1
      track[car_position] <- "o"
      return(TRUE)
    } else {
      return(FALSE)
    }
  } else if (direction == "right") {
    if (car_position < track_length) {
      track[car_position] <- " "
      car_position <- car_position + 1
      track[car_position] <- "o"
      return(TRUE)
    } else {
      return(FALSE)
    }
  }
}

# Game loop
while (TRUE) {
  # Print the track and instructions
  cat("\n")
  cat(paste(track, collapse=""))
  cat("\n")
  cat("Use left and right arrow keys to move (q to quit)")
  
  # Wait for user input
  key <- readChar(1)
  
  # Update the car position based on the user input
  if (key == "q") {
    break
  } else if (key == "\033[D") {
    move_car("left")
  } else if (key == "\033[C") {
    move_car("right")
  }
}
