# Define a function to play a round of rock-paper-scissors
play_round <- function() {
  # Display the options and prompt the user to choose
  cat("Choose your move:\n")
  cat("1. Rock\n")
  cat("2. Paper\n")
  cat("3. Scissors\n")
  choice <- as.integer(readline(prompt = "Enter your choice: "))
  
  # Generate the computer's move
  computer_choice <- sample(c(1, 2, 3), 1)
  
  # Determine the winner of the round
  if (choice == computer_choice) {
    result <- "Tie"
  } else if ((choice == 1 & computer_choice == 3) | 
             (choice == 2 & computer_choice == 1) |
             (choice == 3 & computer_choice == 2)) {
    result <- "You win!"
  } else {
    result <- "Computer wins!"
  }
  
  # Display the result
  cat(paste("You chose", c("Rock", "Paper", "Scissors")[choice], "\n"))
  cat(paste("Computer chose", c("Rock", "Paper", "Scissors")[computer_choice], "\n"))
  cat(result, "\n")
  
  # Return the result
  return(result)
}

# Define the main function for the game
play_game <- function() {
  # Display the welcome message
  cat("Welcome to Rock-Paper-Scissors!\n")
  
  # Loop until the user decides to quit
  repeat {
    # Play a round
    play_round()
    
    # Prompt the user to play again or quit
    cat("Do you want to play again? (y/n)\n")
    play_again <- readline(prompt = "Enter your choice: ")
    
    # If the user chooses to quit, break out of the loop
    if (tolower(play_again) == "n") {
      break
    }
  }
  
  # Display the goodbye message
  cat("Thanks for playing!\n")
}

# Play the game
play_game()
