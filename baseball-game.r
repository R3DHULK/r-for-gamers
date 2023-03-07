# Baseball Game Simulation

# Define the function to simulate the pitch
pitch <- function() {
  # Generate a random number from 1 to 3 to determine the pitch type
  pitch_type <- sample(1:3, 1)
  if (pitch_type == 1) {
    cat("Pitching fastball...\n")
  } else if (pitch_type == 2) {
    cat("Pitching curveball...\n")
  } else {
    cat("Pitching changeup...\n")
  }
  # Return the pitch type
  return(pitch_type)
}

# Define the function to simulate the swing
swing <- function() {
  # Generate a random number from 1 to 3 to determine the swing type
  swing_type <- sample(1:3, 1)
  if (swing_type == 1) {
    cat("Swinging for a home run...\n")
  } else if (swing_type == 2) {
    cat("Swinging for a base hit...\n")
  } else {
    cat("Swinging for a sacrifice fly...\n")
  }
  # Return the swing type
  return(swing_type)
}

# Define the function to simulate the outcome of the at bat
at_bat <- function() {
  # Simulate the pitch
  pitch_type <- pitch()
  # Ask the player to choose a swing type
  cat("What type of swing do you want to take?\n")
  cat("1 - Swing for a home run\n")
  cat("2 - Swing for a base hit\n")
  cat("3 - Swing for a sacrifice fly\n")
  choice <- as.integer(readline(prompt = "Enter your choice: "))
  # Validate the input
  while (choice < 1 || choice > 3) {
    choice <- as.integer(readline(prompt = "Invalid choice. Enter your choice (1-3): "))
  }
  # Simulate the swing
  swing_type <- swing()
  # Determine the outcome based on the pitch and swing types
  if (pitch_type == 1 && swing_type == 1) {
    cat("It's a home run!\n")
  } else if (pitch_type == 2 && (swing_type == 1 || swing_type == 2)) {
    cat("Base hit!\n")
  } else if (pitch_type == 3 && swing_type == 3) {
    cat("Sacrifice fly!\n")
  } else {
    cat("Strike out!\n")
  }
}

# Start the game
cat("Welcome to the baseball game!\n")
cat("You are up to bat...\n")
at_bat()
