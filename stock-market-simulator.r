# define the initial balance and starting price of the stock
balance <- 1000
price <- 50

# define a function to buy shares of the stock
buy <- function(shares) {
  cost <- shares * price
  if (cost > balance) {
    print("Insufficient funds.")
  } else {
    balance <<- balance - cost
    print(paste("Bought", shares, "shares for", cost, "dollars."))
  }
}

# define a function to sell shares of the stock
sell <- function(shares) {
  proceeds <- shares * price
  if (shares < 0) {
    print("Invalid number of shares.")
  } else if (shares > 0 && shares <= balance) {
    balance <<- balance + proceeds
    print(paste("Sold", shares, "shares for", proceeds, "dollars."))
  } else {
    print("Insufficient shares.")
  }
}

# define a function to simulate the stock price movement
simulate <- function() {
  # generate a random price change between -10% and +10%
  change <- runif(1, -0.1, 0.1)
  price <<- price + price * change
  print(paste("Price is now", round(price, 2), "dollars."))
}

# main loop of the simulator
while (TRUE) {
  print(paste("Balance:", balance, "dollars."))
  print("Enter an action (buy, sell, simulate, exit):")
  action <- readline()
  if (action == "buy") {
    print("Enter the number of shares to buy:")
    shares <- as.integer(readline())
    buy(shares)
  } else if (action == "sell") {
    print("Enter the number of shares to sell:")
    shares <- as.integer(readline())
    sell(shares)
  } else if (action == "simulate") {
    simulate()
  } else if (action == "exit") {
    break
  } else {
    print("Invalid action.")
  }
}
