# Define variables to track player stats and game state
player_name <- readline("What's your name? ")
player_money <- 100
player_drink_level <- 0
saloon_open <- TRUE

# Define a function to buy drinks
buy_drinks <- function() {
  num_drinks <- as.numeric(readline("How many drinks would you like to buy? "))
  drink_cost <- 5
  total_cost <- num_drinks * drink_cost
  
  if (player_money < total_cost) {
    cat("You don't have enough money for that many drinks!\n")
  } else {
    player_money <- player_money - total_cost
    player_drink_level <- player_drink_level + num_drinks
    cat(sprintf("You bought %d drinks and now have %d drink level.\n", num_drinks, player_drink_level))
  }
}

# Define a function to play a game of poker
play_poker <- function() {
  cat("Welcome to the poker table!\n")
  # Code to play a game of poker goes here
}

# Main game loop
while (saloon_open) {
  # Display player stats
  cat(sprintf("%s, you have $%d and are at drink level %d.\n", player_name, player_money, player_drink_level))
  
  # Ask the player what they want to do
  choice <- as.numeric(readline("What would you like to do? (1) Buy drinks, (2) Play poker, (3) Leave the saloon "))
  
  # Perform the chosen action
  if (choice == 1) {
    buy_drinks()
  } else if (choice == 2) {
    play_poker()
  } else if (choice == 3) {
    cat("Goodbye! Thanks for visiting the saloon.\n")
    saloon_open <- FALSE
  } else {
    cat("Sorry, I didn't understand your choice. Please choose 1, 2, or 3.\n")
  }
}
