# Define the teams
teams <- list(
  c("Manchester United", "Red Devils", "4-4-2", 87),
  c("Real Madrid", "Los Blancos", "4-3-3", 91),
  c("FC Barcelona", "Blaugrana", "4-3-3", 89),
  c("Bayern Munich", "FC Hollywood", "4-2-3-1", 88)
)

# Define a function to simulate a match
simulate_match <- function(home_team, away_team) {
  # Get team information
  home_team_name <- home_team[1]
  home_team_nickname <- home_team[2]
  home_team_formation <- home_team[3]
  home_team_rating <- home_team[4]
  
  away_team_name <- away_team[1]
  away_team_nickname <- away_team[2]
  away_team_formation <- away_team[3]
  away_team_rating <- away_team[4]
  
  # Print team information
  cat("Home team:", home_team_name, "(", home_team_nickname, ")\n")
  cat("Formation:", home_team_formation, "\n")
  cat("Rating:", home_team_rating, "\n")
  
  cat("\n")
  
  cat("Away team:", away_team_name, "(", away_team_nickname, ")\n")
  cat("Formation:", away_team_formation, "\n")
  cat("Rating:", away_team_rating, "\n")
  
  cat("\n")
  
  # Simulate the match
  home_goals <- rpois(1, home_team_rating / 10)
  away_goals <- rpois(1, away_team_rating / 10)
  
  # Print the result
  cat("Result:", home_team_name, home_goals, "-", away_goals, away_team_name, "\n")
}

# Prompt the user to select a team
cat("Select a team:\n")
for (i in seq_along(teams)) {
  cat(i, teams[[i]][1], "\n")
}

team_choice <- as.integer(readline(prompt = "Enter a number: "))
team <- teams[[team_choice]]

# Simulate a match against a random team
opponent <- sample(teams[1:4][team_choice != seq_along(teams)], 1)
simulate_match(team, opponent)
