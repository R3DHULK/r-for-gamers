# Define the function to play the game
play_game <- function() {
  cat("Welcome to the Cricket Game!\n")
  
  # Set up the initial variables
  runs <- 0
  wickets <- 0
  overs <- 0
  balls <- 0
  target <- sample(100:200, 1)
  
  # Print the target score
  cat("The target score is:", target, "\n")
  
  # Play the game
  repeat {
    # Increment the ball count
    balls <- balls + 1
    
    # Print the current over and ball count
    cat("Over:", overs, " Ball:", balls, "\n")
    
    # Get the player's action
    repeat {
      cat("Choose your action:\n1. Hit\n2. Defend\n")
      choice <- as.integer(readline(prompt = "Enter your choice: "))
      if (choice == 1 | choice == 2) {
        break
      } else {
        cat("Invalid choice. Try again.\n")
      }
    }
    
    # Determine the outcome of the player's action
    if (choice == 1) {
      # The player hits the ball
      result <- sample(c("Out", "Run"), 1, prob = c(0.2, 0.8))
      if (result == "Out") {
        wickets <- wickets + 1
        cat("You are out!\n")
      } else {
        run <- sample(1:6, 1)
        runs <- runs + run
        cat("You hit the ball for", run, "runs.\n")
      }
    } else {
      # The player defends the ball
      cat("You defend the ball.\n")
    }
    
    # Check if the game is over
    if (overs == 9 & balls == 6 | runs >= target | wickets == 10) {
      break
    }
    
    # Check if the over is complete
    if (balls == 6) {
      overs <- overs + 1
      balls <- 0
    }
    
    # Print the current score
    cat("Current score:", runs, "/", wickets, "\n")
    
    # Print the remaining runs and wickets needed to win
    cat("Runs needed to win:", target - runs, "\n")
    cat("Wickets remaining:", 10 - wickets, "\n")
  }
  
  # Determine the outcome of the game
  if (runs >= target) {
    cat("Congratulations, you win!\n")
  } else {
    cat("Better luck next time.\n")
  }
}

# Play the game
play_game()
