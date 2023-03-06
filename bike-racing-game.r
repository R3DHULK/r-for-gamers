# Define the player's initial attributes
player <- list(
  speed = 0,
  stamina = 100,
  distance = 0
)

# Define the actions available to the player
actions <- c("Pedal", "Rest", "Exit")

# Game loop
while (TRUE) {
  # Print the game status
  cat("Player status:\n")
  cat("  Speed: ", player$speed, "\n")
  cat("  Stamina: ", player$stamina, "\n")
  cat("  Distance: ", player$distance, "\n")
  cat("\n")
  
  # Print the available actions
  cat("Available actions:\n")
  for (i in 1:length(actions)) {
    cat("  ", i, ": ", actions[i], "\n")
  }
  
  # Get the user's action choice
  cat("\n")
  choice <- readline(prompt="Choose an action: ")
  choice <- as.integer(choice)
  
  # Handle the user's action
  if (choice == 1) { # Pedal
    # Reduce stamina
    player$stamina <- player$stamina - 10
    
    # Calculate the new speed based on stamina
    if (player$stamina >= 80) {
      player$speed <- 20
    } else if (player$stamina >= 60) {
      player$speed <- 15
    } else if (player$stamina >= 40) {
      player$speed <- 10
    } else if (player$stamina >= 20) {
      player$speed <- 5
    } else {
      player$speed <- 0
    }
    
    # Increase distance
    player$distance <- player$distance + player$speed
    
    cat("You pedal forward.\n")
    
    # Check if the player has won
    if (player$distance >= 100) {
      cat("Congratulations! You won the race!\n")
      break
    }
    
    # Check if the player has run out of stamina
    if (player$stamina <= 0) {
      cat("You ran out of stamina and had to rest.\n")
      player$stamina <- 100
      player$speed <- 0
    }
  } else if (choice == 2) { # Rest
    # Increase stamina
    player$stamina <- player$stamina + 20
    
    # Check if stamina is above maximum
    if (player$stamina > 100) {
      player$stamina <- 100
    }
    
    cat("You take a rest.\n")
  } else if (choice == 3) { # Exit
    cat("Thanks for playing!\n")
    break
  } else { # Invalid choice
    cat("Invalid choice.\n")
  }
  
  cat("\n")
}
