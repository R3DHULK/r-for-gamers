# Define the pool object with starting values
pool <- list(
  length = 50,  # meters
  width = 25,   # meters
  depth = 2,    # meters
  temperature = 25,  # Celsius
  chlorine_level = 1  # parts per million (ppm)
)

# Define a function to display the pool status
display_pool <- function(pool) {
  cat("Current pool status:\n")
  cat("Size: ", pool$length, "m x ", pool$width, "m x ", pool$depth, "m\n", sep = "")
  cat("Temperature: ", pool$temperature, "C\n")
  cat("Chlorine level: ", pool$chlorine_level, "ppm\n")
}

# Define a function to adjust the pool temperature
adjust_temperature <- function(pool) {
  cat("Current temperature: ", pool$temperature, "C\n")
  change <- as.numeric(readline(prompt = "Enter temperature change (+/-): "))
  pool$temperature <- pool$temperature + change
  cat("New temperature: ", pool$temperature, "C\n")
  return(pool)
}

# Define a function to add chlorine to the pool
add_chlorine <- function(pool) {
  cat("Current chlorine level: ", pool$chlorine_level, "ppm\n")
  amount <- as.numeric(readline(prompt = "Enter amount of chlorine to add (in ppm): "))
  pool$chlorine_level <- pool$chlorine_level + amount
  cat("New chlorine level: ", pool$chlorine_level, "ppm\n")
  return(pool)
}

# Define the main game loop
repeat {
  # Display the pool status
  display_pool(pool)
  
  # Prompt the user for an action
  cat("\nChoose an action:\n")
  cat("1. Adjust temperature\n")
  cat("2. Add chlorine\n")
  cat("3. Swim\n")
  cat("4. Exit\n")
  choice <- as.numeric(readline(prompt = "Enter your choice: "))
  
  # Perform the chosen action
  if (choice == 1) {
    pool <- adjust_temperature(pool)
  } else if (choice == 2) {
    pool <- add_chlorine(pool)
  } else if (choice == 3) {
    # Swim for 1 minute
    cat("\nSwimming for 1 minute...\n")
    Sys.sleep(1)
    cat("30 seconds remaining...\n")
    Sys.sleep(1)
    cat("15 seconds remaining...\n")
    Sys.sleep(1)
    cat("5 seconds remaining...\n")
    Sys.sleep(1)
    cat("Time's up! You finish swimming.\n")
  } else if (choice == 4) {
    # Exit the game
    cat("Goodbye!")
    break
  } else {
    cat("Invalid choice. Try again.\n")
  }
}
