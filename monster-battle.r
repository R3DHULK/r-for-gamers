# Create the monster class
Monster <- list(
  name = "",
  health = 0,
  attack = 0,
  defense = 0,
  speed = 0
)

# Create the player and enemy monsters
player <- Monster
player$name <- "Player"
player$health <- 100
player$attack <- 10
player$defense <- 5
player$speed <- 8

enemy <- Monster
enemy$name <- "Enemy"
enemy$health <- 80
enemy$attack <- 8
enemy$defense <- 3
enemy$speed <- 6

# Define the battle function
battle <- function(player, enemy) {
  # Loop until one monster has no health
  while(player$health > 0 && enemy$health > 0) {
    # Determine which monster attacks first based on speed
    if(player$speed > enemy$speed) {
      # Player attacks
      damage <- player$attack - enemy$defense
      if(damage < 0) {
        damage <- 0
      }
      enemy$health <- enemy$health - damage
      cat(player$name, "attacks", enemy$name, "for", damage, "damage.\n")
      
      # Check if enemy is defeated
      if(enemy$health <= 0) {
        cat(enemy$name, "has been defeated!\n")
        break
      }
      
      # Enemy attacks
      damage <- enemy$attack - player$defense
      if(damage < 0) {
        damage <- 0
      }
      player$health <- player$health - damage
      cat(enemy$name, "attacks", player$name, "for", damage, "damage.\n")
      
      # Check if player is defeated
      if(player$health <= 0) {
        cat(player$name, "has been defeated!\n")
        break
      }
    } else {
      # Enemy attacks
      damage <- enemy$attack - player$defense
      if(damage < 0) {
        damage <- 0
      }
      player$health <- player$health - damage
      cat(enemy$name, "attacks", player$name, "for", damage, "damage.\n")
      
      # Check if player is defeated
      if(player$health <= 0) {
        cat(player$name, "has been defeated!\n")
        break
      }
      
      # Player attacks
      damage <- player$attack - enemy$defense
      if(damage < 0) {
        damage <- 0
      }
      enemy$health <- enemy$health - damage
      cat(player$name, "attacks", enemy$name, "for", damage, "damage.\n")
      
      # Check if enemy is defeated
      if(enemy$health <= 0) {
        cat(enemy$name, "has been defeated!\n")
        break
      }
    }
  }
}

# Start the battle
cat("A wild", enemy$name, "appears!\n")
battle(player, enemy)
