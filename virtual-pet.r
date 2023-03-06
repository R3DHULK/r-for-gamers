# Simple text-based virtual pet game

pet_name <- readline(prompt = "Enter a name for your pet: ")
pet_hunger <- 0
pet_thirst <- 0
pet_boredom <- 0
pet_energy <- 100

# Loop until pet dies or player quits
while (pet_energy > 0) {
  # Display current pet status
  cat("\n", pet_name, "status:\n")
  cat("Hunger: ", pet_hunger, "\n")
  cat("Thirst: ", pet_thirst, "\n")
  cat("Boredom: ", pet_boredom, "\n")
  cat("Energy: ", pet_energy, "\n\n")
  
  # Get user input
  user_input <- readline(prompt = "What do you want to do? (feed/drink/play/sleep/quit) ")
  
  # Perform action based on user input
  if (user_input == "feed") {
    pet_hunger <- max(0, pet_hunger - 10)
    cat("\nYou feed", pet_name, "\n")
  } else if (user_input == "drink") {
    pet_thirst <- max(0, pet_thirst - 10)
    cat("\nYou give", pet_name, "some water\n")
  } else if (user_input == "play") {
    pet_boredom <- max(0, pet_boredom - 10)
    cat("\nYou play with", pet_name, "\n")
  } else if (user_input == "sleep") {
    pet_energy <- min(100, pet_energy + 10)
    cat("\n", pet_name, "goes to sleep\n")
  } else if (user_input == "quit") {
    break
  } else {
    cat("\nInvalid input, try again.\n")
  }
  
  # Update pet status
  pet_hunger <- min(100, pet_hunger + 10)
  pet_thirst <- min(100, pet_thirst + 10)
  pet_boredom <- min(100, pet_boredom + 10)
  pet_energy <- max(0, pet_energy - 10)
  
  # Check if pet has died
  if (pet_hunger >= 100 || pet_thirst >= 100 || pet_boredom >= 100 || pet_energy <= 0) {
    cat("\nOh no! ", pet_name, " has died.\n")
    break
  }
}

cat("\nThanks for playing!\n")
