n  <- 100   # number of trials
p  <- 0.01  # per‐game win probability
k0 <- 1    # minimum wins

# -------------------------------------------
# analytical probability of ≥ k0 wins
# -------------------------------------------
prob_at_least_k0 <- 1 - pbinom(k0 - 1, size = n, prob = p)
cat(sprintf("P(win ≥ %d of %d) = %.4f\n", k0, n, prob_at_least_k0))

# -------------------------------------------
# full distribution
# -------------------------------------------
wins <- 0:n
# Method 1:
probs <- dbinom(wins, size = n, prob = p)

# # Method 2: chris likes more
# probs <- numeric(length = n + 1) # init empty vector
# for (k in 0:n) { # Loop over each possible number of wins (from 0 to n)
#   # Calculate the binomial probability for exactly k wins
#   probs[k + 1] <- choose(n, k) * (p^k) * ((1 - p)^(n - k))
# }

df <- data.frame(wins, probs)

# -------------------------------------------
# visualizing
# -------------------------------------------
library(ggplot2)

# Calculate the maximum number of wins with a significant probability
threshold <- 0.0000001  # Arbitrary threshold for considering "zero" probability
max_win <- max(wins[probs > threshold])  # Maximum wins with significant probability


# aes = aesthetic mapping
# geom = geometric object
# geom_col = geometric object type column

ggplot(df, aes(x = wins, y = probs)) +
  geom_col(fill = "steelblue") +
  geom_col(
    data = subset(df, wins >= k0),
    aes(x = wins, y = probs),
    fill = "firebrick"
  ) +
  labs(
    title = sprintf("Binomial(n=%d, p=%.2f): P(win >= %d) = %.2f%%",
                    n, p, k0, prob_at_least_k0 * 100),
    x = "Number of wins",
    y = "Probability"
  ) +
  theme_minimal() +
  scale_x_continuous(limits = c(0, max_win))  # Adjust the x-axis to zoom in on relevant values


# -------------------------------------------
# Info
# -------------------------------------------

# See: https://www.geeksforgeeks.org/a-guide-to-dbinom-pbinom-qbinom-and-rbinom-in-r/
# dbinom return: probability density function (pdf) ||  probability mass function (pmf)
# pbinom return: cumulative density function (cdf)

# PDF/PMF tells you how probability is distributed at each point -> P(X = k)
# CDF tells you how much probability has accumulated by a given point -> P(X => k)
