# Basic text-based flight simulator game in R

# Define starting variables
altitude <- 0
fuel <- 100
distance <- 0
speed <- 0
game_over <- FALSE

# Define functions for game actions
takeoff <- function() {
  cat("The plane takes off and begins its ascent.\n")
  altitude <<- 1000
  fuel <<- fuel - 10
}

climb <- function() {
  cat("The plane climbs higher into the sky.\n")
  altitude <<- altitude + 1000
  fuel <<- fuel - 5
}

descend <- function() {
  cat("The plane begins to descend towards the ground.\n")
  altitude <<- altitude - 500
  fuel <<- fuel - 5
}

land <- function() {
  cat("The plane lands safely on the runway.\n")
  game_over <<- TRUE
}

# Start the game loop
while (!game_over) {
  # Print current status
  cat(paste0("Altitude: ", altitude, "\n"))
  cat(paste0("Fuel: ", fuel, "\n"))
  cat(paste0("Distance: ", distance, "\n"))
  cat(paste0("Speed: ", speed, "\n\n"))
  
  # Ask player for action
  action <- readline(prompt = "What would you like to do? (takeoff, climb, descend, land)\n")
  
  # Perform the chosen action
  if (action == "takeoff") {
    takeoff()
  } else if (action == "climb") {
    climb()
  } else if (action == "descend") {
    descend()
  } else if (action == "land") {
    land()
  } else {
    cat("Invalid input. Please choose a valid action.\n")
  }
  
  # Check if game over conditions are met
  if (altitude <= 0) {
    cat("The plane has crashed.\n")
    game_over <<- TRUE
  }
  
  if (fuel <= 0) {
    cat("The plane has run out of fuel.\n")
    game_over <<- TRUE
  }
  
  distance <<- distance + speed
  speed <<- speed + 10
}
