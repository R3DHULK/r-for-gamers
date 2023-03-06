# Define the main function for the game
play_game <- function() {
  cat("Welcome to the Detective Game!\n")
  
  # Set up the game variables
  suspects <- c("Alice", "Bob", "Charlie", "David", "Emily")
  weapon <- sample(c("Knife", "Gun", "Rope", "Poison", "Bat"), 1)
  room <- sample(c("Kitchen", "Living Room", "Bedroom", "Bathroom", "Study"), 1)
  
  # Loop through the player's turns
  repeat {
    # Display the game information
    cat("You are investigating a murder.\nThe murder weapon is a", weapon, "and the murder took place in the", room, ".\n")
    
    # Prompt the player to question a suspect
    cat("Which suspect do you want to question?\n", paste(suspects, collapse = "\n"), "\n")
    suspect <- readline(prompt = "Enter the name of the suspect: ")
    if (!(suspect %in% suspects)) {
      cat("Invalid suspect name. Try again.\n")
      next
    }
    
    # Determine the suspect's response
    response <- sample(c("I have an alibi for the time of the murder.", 
                         "I saw someone else at the scene of the crime.",
                         "I don't know anything about the murder."), 1)
    cat(suspect, "says:", response, "\n")
    
    # Determine if the player has enough information to make an accusation
    if (response == "I saw someone else at the scene of the crime.") {
      cat("You have enough information to make an accusation.\n")
      repeat {
        accusation_weapon <- readline(prompt = "Enter the murder weapon: ")
        if (accusation_weapon != weapon) {
          cat("Incorrect weapon. Try again.\n")
          next
        }
        accusation_room <- readline(prompt = "Enter the murder room: ")
        if (accusation_room != room) {
          cat("Incorrect room. Try again.\n")
          next
        }
        accusation_suspect <- readline(prompt = "Enter the name of the suspect you are accusing: ")
        if (accusation_suspect != suspect) {
          cat("Incorrect suspect. Try again.\n")
          next
        }
        cat("Congratulations, you have solved the case!\n")
        return()
      }
    } else {
      cat("You don't have enough information to make an accusation yet.\n")
    }
  }
}

# Start the game
play_game()
