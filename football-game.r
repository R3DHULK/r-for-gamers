# Define a function to generate a random opponent team
generate_opponent <- function() {
  teams <- c("Real Madrid", "Barcelona", "Manchester United", "Liverpool", "Bayern Munich", "Paris Saint-Germain", "Juventus", "AC Milan")
  sample(teams, 1)
}

# Define the main function for the game
play_game <- function() {
  cat("Welcome to the Football Game!\n")
  
  # Prompt the user to choose their team
  cat("Choose your team:\n1. Real Madrid\n2. Barcelona\n3. Manchester United\n4. Liverpool\n5. Bayern Munich\n6. Paris Saint-Germain\n7. Juventus\n8. AC Milan\n")
  choice <- as.integer(readline(prompt = "Enter your choice: "))
  teams <- c("Real Madrid", "Barcelona", "Manchester United", "Liverpool", "Bayern Munich", "Paris Saint-Germain", "Juventus", "AC Milan")
  if (choice %in% 1:8) {
    player_team <- teams[choice]
  } else {
    cat("Invalid choice. Defaulting to Real Madrid.\n")
    player_team <- "Real Madrid"
  }
  
  # Generate a random opponent
  opponent_team <- generate_opponent()
  cat("Your opponent is", opponent_team, "!\n")
  
  # Simulate the outcome of the game
  player_score <- sample(0:4, 1)
  opponent_score <- sample(0:4, 1)
  cat("The final score is:", player_team, player_score, "-", opponent_team, opponent_score, "\n")
  if (player_score > opponent_score) {
    cat("Congratulations, you win!\n")
  } else if (player_score < opponent_score) {
    cat("You lost the game.\n")
  } else {
    cat("It's a draw.\n")
  }
}

# Loop the game until the user quits
repeat {
  play_game()
  repeat {
    play_again <- readline(prompt = "Do you want to play again? (y/n) ")
    if (play_again %in% c("y", "n")) {
      break
    } else {
      cat("Invalid choice. Try again.\n")
    }
  }
  if (play_again == "n") {
    break
  }
}
