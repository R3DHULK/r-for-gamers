# Trivia game in R

# Define questions and answers
questions <- c("What is the capital of Canada?",
               "What is the largest organ in the human body?",
               "What year did World War II end?",
               "Who painted the Mona Lisa?",
               "What is the smallest planet in our solar system?",
               "What is the highest mountain in Africa?",
               "What is the name of the first man to walk on the moon?",
               "What is the chemical symbol for gold?",
               "What is the most abundant gas in the Earth's atmosphere?",
               "What is the largest continent by land area?")

answers <- c("Ottawa", "Skin", "1945", "Leonardo da Vinci", "Mercury", "Mount Kilimanjaro", "Neil Armstrong", "Au", "Nitrogen", "Asia")

# Shuffle questions
questions <- sample(questions)

# Initialize score
score <- 0

# Loop through questions
for (i in 1:length(questions)) {
  
  # Display question
  cat("\nQuestion", i, ":", questions[i], "\n")
  
  # Get user input
  user_answer <- readline(prompt = "Your answer: ")
  
  # Check if answer is correct
  if (tolower(user_answer) == tolower(answers[i])) {
    score <- score + 1
    cat("Correct! Your score is now", score, "\n")
  } else {
    cat("Incorrect. The correct answer is", answers[i], "\n")
  }
}

# Display final score
cat("\nYour final score is", score, "out of", length(questions), "\n")
