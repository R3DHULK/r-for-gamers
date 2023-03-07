# Set up the game
player_ship <- list(name = "Player's Ship", hp = 10, damage = 2)
enemy_ship <- list(name = "Enemy Ship", hp = 10, damage = 1)
turn_count <- 0

# Game loop
while (player_ship$hp > 0 && enemy_ship$hp > 0) {
  # Clear the screen
  cat("\033[2J\033[;H")
  
  # Display turn count
  turn_count <- turn_count + 1
  cat(sprintf("Turn %d\n\n", turn_count))
  
  # Display ship status
  cat(sprintf("%s: HP %d\n", player_ship$name, player_ship$hp))
  cat(sprintf("%s: HP %d\n\n", enemy_ship$name, enemy_ship$hp))
  
  # Player's turn
  cat("Player's turn\n")
  input <- readline("Attack or Defend? ")
  if (tolower(input) == "attack") {
    enemy_ship$hp <- enemy_ship$hp - player_ship$damage
    cat(sprintf("You dealt %d damage to the %s\n", player_ship$damage, enemy_ship$name))
  } else if (tolower(input) == "defend") {
    player_ship$hp <- player_ship$hp + 1
    cat("You defended and regained 1 HP\n")
  } else {
    cat("Invalid input. Skipping turn\n")
  }
  Sys.sleep(1)
  
  # Enemy's turn
  cat("\nEnemy's turn\n")
  if (runif(1) < 0.5) {
    player_ship$hp <- player_ship$hp - enemy_ship$damage
    cat(sprintf("%s dealt %d damage to you\n", enemy_ship$name, enemy_ship$damage))
  } else {
    enemy_ship$hp <- enemy_ship$hp + 1
    cat(sprintf("%s repaired and regained 1 HP\n", enemy_ship$name))
  }
  Sys.sleep(1)
}

# Game over
if (player_ship$hp > 0) {
  cat("\nYou won!\n")
} else {
  cat("\nYou lost. Better luck next time.\n")
}
