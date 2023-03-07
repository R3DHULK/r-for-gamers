# Define yoga poses
yoga_poses <- c("Downward Dog", "Warrior I", "Warrior II", "Tree Pose", "Child's Pose", "Cobra Pose", "Triangle Pose", "Eagle Pose", "Plank Pose", "Savasana")

# Define player attributes
player_name <- readline(prompt = "What is your name? ")
player_level <- 1
player_experience <- 0
player_energy <- 100

# Define game functions
perform_yoga_pose <- function() {
  # Choose a random yoga pose
  pose_index <- sample(1:length(yoga_poses), 1)
  pose <- yoga_poses[pose_index]
  
  # Calculate energy cost of performing the pose
  energy_cost <- sample(10:20, 1)
  
  # Check if player has enough energy to perform the pose
  if (player_energy < energy_cost) {
    cat("You don't have enough energy to perform this pose. Try resting or eating something.\n\n")
    return()
  }
  
  # Calculate experience gained from performing the pose
  experience_gain <- sample(5:10, 1) * player_level
  
  # Update player attributes
  player_energy <- player_energy - energy_cost
  player_experience <- player_experience + experience_gain
  
  # Print results
  cat(paste("You perform the", pose, "pose.\n"))
  cat(paste("You gain", experience_gain, "experience and lose", energy_cost, "energy.\n\n"))
}

rest <- function() {
  # Calculate energy gain from resting
  energy_gain <- sample(5:10, 1) * player_level
  
  # Update player attributes
  player_energy <- player_energy + energy_gain
  
  # Print results
  cat(paste("You rest and gain", energy_gain, "energy.\n\n"))
}

eat <- function() {
  # Calculate energy gain from eating
  energy_gain <- sample(10:20, 1) * player_level
  
  # Update player attributes
  player_energy <- player_energy + energy_gain
  
  # Print results
  cat(paste("You eat and gain", energy_gain, "energy.\n\n"))
}

# Main game loop
while (TRUE) {
  # Print player status
  cat("=== Player Status ===\n")
  cat(paste("Name: ", player_name, "\n"))
  cat(paste("Level: ", player_level, "\n"))
  cat(paste("Experience: ", player_experience, "\n"))
  cat(paste("Energy: ", player_energy, "\n"))
  cat("\n")
  
  # Print available actions
  cat("Choose an action:\n")
  cat("1. Perform a yoga pose\n")
  cat("2. Rest\n")
  cat("3. Eat\n")
  cat("4. Quit game\n\n")
  
  # Get player choice
  choice <- readline(prompt = "Enter your choice: ")
  
  # Perform the chosen action
  if (choice == "1") {
    perform_yoga_pose()
  } else if (choice == "2") {
    rest()
  } else if (choice == "3") {
    eat()
  } else if (choice == "4") {
    cat("Thanks for playing!\n")
    break
  } else {
    cat("Invalid choice. Please try again.\n\n")
  }
}
