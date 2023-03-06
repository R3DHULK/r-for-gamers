# Text-Based Farm Simulation Game in R

# Define initial variables
crops <- c("corn", "wheat", "potatoes")
crop_count <- c(5, 3, 4)
money <- 1000

# Define function to display current status
display_status <- function() {
  cat(paste0("You currently have ", crop_count, " ", crops, " and $", money, " in the bank.\n"))
}

# Define function to plant crops
plant_crops <- function() {
  # Get user input for crop and quantity
  crop <- readline(prompt = "What crop would you like to plant? (corn/wheat/potatoes) ")
  quantity <- as.integer(readline(prompt = "How many acres would you like to plant? "))
  
  # Check if user has enough money and crops
  cost <- quantity * 100
  crop_index <- match(crop, crops)
  if (cost > money) {
    cat("Sorry, you don't have enough money to plant that many acres.\n")
    return()
  }
  if (quantity > crop_count[crop_index]) {
    cat("Sorry, you don't have that many crops to plant.\n")
    return()
  }
  
  # Update crop count and money
  crop_count[crop_index] <- crop_count[crop_index] - quantity
  money <- money - cost
  
  cat(paste0("You now have ", crop_count[crop_index], " ", crop, "s and $", money, " left in the bank.\n"))
}

# Define function to harvest crops
harvest_crops <- function() {
  # Get user input for crop and quantity
  crop <- readline(prompt = "What crop would you like to harvest? (corn/wheat/potatoes) ")
  quantity <- as.integer(readline(prompt = "How many acres would you like to harvest? "))
  
  # Check if user has enough crops
  crop_index <- match(crop, crops)
  if (quantity > crop_count[crop_index]) {
    cat("Sorry, you don't have that many crops to harvest.\n")
    return()
  }
  
  # Update crop count and money
  yield <- quantity * sample(50:100, 1)
  crop_count[crop_index] <- crop_count[crop_index] - quantity
  money <- money + yield
  
  cat(paste0("You harvested ", yield, " bushels of ", crop, " and now have $", money, " in the bank.\n"))
}

# Define main game loop
while (TRUE) {
  display_status()
  
  # Get user input for action
  action <- readline(prompt = "What would you like to do? (plant/harvest/quit) ")
  
  # Perform action based on user input
  if (action == "plant") {
    plant_crops()
  } else if (action == "harvest") {
    harvest_crops()
  } else if (action == "quit") {
    cat("Thanks for playing!\n")
    break
  } else {
    cat("Invalid action.\n")
  }
}
