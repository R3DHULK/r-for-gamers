# Define the tank class
Tank <- function(health, armor, damage) {
  list(
    health = health,
    armor = armor,
    damage = damage
  )
}

# Define the game function
play_game <- function() {
  # Initialize player and enemy tanks
  player_tank <- Tank(health = 100, armor = 50, damage = 25)
  enemy_tank <- Tank(health = 100, armor = 50, damage = 25)
  
  # Game loop
  while (player_tank$health > 0 && enemy_tank$health > 0) {
    # Player turn
    cat("Your turn:\n")
    action <- readline(prompt = "What would you like to do? (shoot, defend) ")
    
    if (action == "shoot") {
      enemy_tank$health <- enemy_tank$health - player_tank$damage
      cat("You dealt", player_tank$damage, "damage to the enemy tank.\n")
    } else if (action == "defend") {
      player_tank$armor <- player_tank$armor + 25
      cat("You raised your armor by 25 points.\n")
    } else {
      cat("Invalid action.\n")
    }
    
    # Enemy turn
    cat("\nEnemy turn:\n")
    action <- sample(c("shoot", "defend"), 1)
    
    if (action == "shoot") {
      player_tank$health <- player_tank$health - enemy_tank$damage
      cat("The enemy dealt", enemy_tank$damage, "damage to your tank.\n")
    } else {
      enemy_tank$armor <- enemy_tank$armor + 25
      cat("The enemy raised their armor by 25 points.\n")
    }
    
    # Display tank status
    cat("\nYour tank:\n")
    cat("  Health:", player_tank$health, "\n")
    cat("  Armor:", player_tank$armor, "\n")
    cat("\nEnemy tank:\n")
    cat("  Health:", enemy_tank$health, "\n")
    cat("  Armor:", enemy_tank$armor, "\n")
  }
  
  # Game over
  if (player_tank$health > 0) {
    cat("\nYou won!\n")
  } else {
    cat("\nYou lost.\n")
  }
}

# Play the game
play_game()
