# Generate a random number between 1 and 100
random_number <- sample(1:100, 1)

# Initialize the number of guesses
num_guesses <- 0

# Loop until the user correctly guesses the number
while (TRUE) {
  # Prompt the user to enter a guess
  user_guess <- readline(prompt = "Guess a number between 1 and 100: ")
  
  # Convert the user's guess to a number
  user_guess <- as.numeric(user_guess)
  
  # Check if the user's guess is correct
  if (user_guess == random_number) {
    cat("Congratulations! You guessed the number in", num_guesses, "guesses.\n")
    break
  }
  
  # Check if the user's guess is too high
  if (user_guess > random_number) {
    cat("Your guess is too high.\n")
  }
  
  # Check if the user's guess is too low
  if (user_guess < random_number) {
    cat("Your guess is too low.\n")
  }
  
  # Increment the number of guesses
  num_guesses <- num_guesses + 1
}
