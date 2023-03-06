# Define the function to simulate a basketball game
simulate_basketball_game <- function() {
  # Set the team scores to 0
  team_scores <- c(0, 0)
  
  # Set the number of quarters to 4
  num_quarters <- 4
  
  # Loop through each quarter
  for (quarter in 1:num_quarters) {
    # Display the current quarter
    cat("Quarter", quarter, "\n")
    
    # Loop through each team
    for (team in 1:2) {
      # Display the current team
      if (team == 1) {
        cat("Team 1's Turn\n")
      } else {
        cat("Team 2's Turn\n")
      }
      
      # Prompt the user to choose an action
      repeat {
        cat("Choose an action:\n")
        cat("1. Shoot\n")
        cat("2. Pass\n")
        choice <- as.integer(readline(prompt = "Enter your choice: "))
        if (choice == 1 | choice == 2) {
          break
        } else {
          cat("Invalid choice. Try again.\n")
        }
      }
      
      # Determine the result of the action
      if (choice == 1) {
        # Shooting
        success_prob <- rnorm(1, mean = 0.5, sd = 0.1)
        if (runif(1) < success_prob) {
          points <- sample(c(2, 3), 1)
          cat("You made a", points, "point shot!\n")
        } else {
          cat("You missed the shot.\n")
          points <- 0
        }
      } else {
        # Passing
        if (runif(1) < 0.9) {
          cat("You completed the pass.\n")
          points <- 0
        } else {
          cat("You turned the ball over.\n")
          points <- 0
        }
      }
      
      # Update the team score
      team_scores[team] <- team_scores[team] + points
      cat("Team", team, "score:", team_scores[team], "\n")
    }
  }
  
  # Display the final score
  cat("Final score:\n")
  cat("Team 1:", team_scores[1], "\n")
  cat("Team 2:", team_scores[2], "\n")
  
  # Determine the winner
  if (team_scores[1] > team_scores[2]) {
    cat("Team 1 wins!\n")
  } else if (team_scores[1] < team_scores[2]) {
    cat("Team 2 wins!\n")
  } else {
    cat("It's a tie!\n")
  }
}

# Play the game
simulate_basketball_game()
