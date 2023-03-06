# Zoo Simulation Game in R

# Define initial variables
animals <- c("lion", "tiger", "bear")
animal_count <- c(2, 3, 4)
money <- 1000

# Define function to display current status
display_status <- function() {
  cat(paste0("You currently have ", animal_count, " ", animals, " and $", money, " in the bank.\n"))
}

# Define function to buy an animal
buy_animal <- function() {
  # Get user input for animal and quantity
  animal <- readline(prompt = "What animal would you like to buy? (lion/tiger/bear) ")
  quantity <- as.integer(readline(prompt = "How many would you like to buy? "))
  
  # Check if user has enough money
  cost <- quantity * 500
  if (cost > money) {
    cat("Sorry, you don't have enough money to buy that many animals.\n")
    return()
  }
  
  # Update animal count and money
  animal_index <- match(animal, animals)
  animal_count[animal_index] <- animal_count[animal_index] + quantity
  money <- money - cost
  
  cat(paste0("You now have ", animal_count[animal_index], " ", animal, "s and $", money, " left in the bank.\n"))
}

# Define function to sell an animal
sell_animal <- function() {
  # Get user input for animal and quantity
  animal <- readline(prompt = "What animal would you like to sell? (lion/tiger/bear) ")
  quantity <- as.integer(readline(prompt = "How many would you like to sell? "))
  
  # Check if user has enough animals
  animal_index <- match(animal, animals)
  if (quantity > animal_count[animal_index]) {
    cat("Sorry, you don't have that many animals to sell.\n")
    return()
  }
  
  # Update animal count and money
  cost <- quantity * 200
  animal_count[animal_index] <- animal_count[animal_index] - quantity
  money <- money + cost
  
  cat(paste0("You now have ", animal_count[animal_index], " ", animal, "s and $", money, " left in the bank.\n"))
}

# Define main game loop
while (TRUE) {
  display_status()
  
  # Get user input for action
  action <- readline(prompt = "What would you like to do? (buy/sell/quit) ")
  
  # Perform action based on user input
  if (action == "buy") {
    buy_animal()
  } else if (action == "sell") {
    sell_animal()
  } else if (action == "quit") {
    cat("Thanks for playing!\n")
    break
  } else {
    cat("Invalid action.\n")
  }
}
