# Define the wrestlers
wrestler1 <- list(name = "Yokozuna", strength = 8, agility = 5, stamina = 6)
wrestler2 <- list(name = "Mongolian Giant", strength = 9, agility = 4, stamina = 5)

# Define the match settings
rounds <- 3
winning_rounds <- ceiling(rounds / 2)

# Define the function to simulate a round of the match
simulate_round <- function(wrestler1, wrestler2) {
  # Calculate the scores for each wrestler
  wrestler1_score <- wrestler1$strength + wrestler1$agility + wrestler1$stamina
  wrestler2_score <- wrestler2$strength + wrestler2$agility + wrestler2$stamina
  
  # Determine the winner of the round
  if (wrestler1_score > wrestler2_score) {
    return(wrestler1)
  } else if (wrestler2_score > wrestler1_score) {
    return(wrestler2)
  } else {
    return(NULL) # It's a tie
  }
}

# Simulate the match
wrestler1_wins <- 0
wrestler2_wins <- 0
for (i in 1:rounds) {
  round_winner <- simulate_round(wrestler1, wrestler2)
  if (!is.null(round_winner)) {
    if (round_winner == wrestler1) {
      wrestler1_wins <- wrestler1_wins + 1
    } else {
      wrestler2_wins <- wrestler2_wins + 1
    }
  }
  
  # Check if either wrestler has won the match
  if (wrestler1_wins >= winning_rounds) {
    print(paste0(wrestler1$name, " wins the match!"))
    break
  } else if (wrestler2_wins >= winning_rounds) {
    print(paste0(wrestler2$name, " wins the match!"))
    break
  } else if (i == rounds) {
    print("It's a tie!")
  }
}
