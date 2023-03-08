# Roller Coaster Simulator

# Define track
track <- c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0)

# Define cart position and speed
cart_pos <- 0
cart_speed <- 0

# Define game loop
while (TRUE) {
  # Update cart position based on speed
  cart_pos <- cart_pos + cart_speed
  
  # Print track and cart
  track_with_cart <- track
  track_with_cart[cart_pos + 1] <- "O"
  print(track_with_cart)
  
  # Get user input
  user_input <- readline(prompt = "Enter command (a=accelerate, d=decelerate, q=quit): ")
  
  # Process user input
  if (user_input == "a") {
    cart_speed <- cart_speed + 1
  } else if (user_input == "d") {
    cart_speed <- cart_speed - 1
  } else if (user_input == "q") {
    break
  }
  
  # Limit cart speed to 5 and -5
  if (cart_speed > 5) {
    cart_speed <- 5
  } else if (cart_speed < -5) {
    cart_speed <- -5
  }
  
  # Check if cart has crashed
  if (cart_pos < 0 || cart_pos > length(track) - 1) {
    print("You crashed! Game over.")
    break
  }
}
