# Text-based volleyball simulator game

# Define function to check if the ball is in bounds
is_in_bounds <- function(position) {
  return(position >= 0 && position <= 10)
}

# Define function to simulate a serve
serve <- function() {
  cat("Server is serving...\n")
  position <- readline(prompt = "Enter the position of the serve (0-10): ")
  position <- as.numeric(position)
  
  if (!is.numeric(position) || !is_in_bounds(position)) {
    cat("Invalid position, try again.\n")
    serve()
  } else {
    cat("Serve to position ", position, "!\n")
    return(position)
  }
}

# Define function to simulate a hit
hit <- function() {
  cat("Player is hitting...\n")
  position <- readline(prompt = "Enter the position of the hit (0-10): ")
  position <- as.numeric(position)
  
  if (!is.numeric(position) || !is_in_bounds(position)) {
    cat("Invalid position, try again.\n")
    hit()
  } else {
    cat("Hit to position ", position, "!\n")
    return(position)
  }
}

# Define function to simulate a block
block <- function() {
  cat("Player is blocking...\n")
  position <- readline(prompt = "Enter the position of the block (0-10): ")
  position <- as.numeric(position)
  
  if (!is.numeric(position) || !is_in_bounds(position)) {
    cat("Invalid position, try again.\n")
    block()
  } else {
    cat("Block at position ", position, "!\n")
    return(position)
  }
}

# Define function to simulate a point
point <- function(server_position, player_position) {
  if (server_position == player_position) {
    cat("Point for the server!\n")
    return("server")
  } else {
    cat("Point for the player!\n")
    return("player")
  }
}

# Define function to simulate a game
game <- function() {
  # Set the score to 0-0
  server_score <- 0
  player_score <- 0
  
  # Start the game loop
  while (TRUE) {
    # Serve the ball
    server_position <- serve()
    
    # Hit the ball
    player_position <- hit()
    
    # Block the ball
    server_block_position <- block()
    
    # Determine the point
    winner <- point(server_position, player_position)
    
    # Update the score
    if (winner == "server") {
      server_score <- server_score + 1
    } else {
      player_score <- player_score + 1
    }
    
    # Check if a player has won
    if (server_score >= 5 && server_score - player_score >= 2) {
      cat("Game over! Server wins!\n")
      break
    } else if (player_score >= 5 && player_score - server_score >= 2) {
      cat("Game over! Player wins!\n")
      break
    }
    
    # Print the score
    cat("Server: ", server_score, " - Player: ", player_score, "\n")
  }
}

# Start the game
cat("Welcome to the text-based volleyball simulator game!\n")
game()
