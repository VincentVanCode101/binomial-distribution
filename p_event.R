# Parameters
p         <- 0.01            # annual event probability
max_years <- 1000            # years to plot
outfile   <- "p_event.png" # your output filename

# Compute cumulative event probability
years        <- 0:max_years
prob_event   <- 1 - (1 - p)^years
df           <- data.frame(years, prob = prob_event)

png(filename = outfile,
    width    = 800, height = 600,
    bg       = "white")
plot(years, prob_event,
     type  = "l", lwd = 2,
     xlab  = "Years",
     ylab  = "P(at least one event)",
     main  = expression(f(x) == 1 - (1 - p)^x)
)
dev.off()

# ---- ggplot2 version with white theme ----
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}
library(ggplot2)

plt <- ggplot(df, aes(x = years, y = prob)) +
  geom_line(size = 1.2) +
  labs(
    title    = sprintf("Cumulative Probability of Event (p = %.2f%% per year)", p*100),
    subtitle = expression(f(x) == 1 - (1 - p)^x),
    x        = "Years",
    y        = "P(at least one event)"
  ) +
  theme_bw()  # white background + grid

ggsave(filename = outfile,
       plot     = plt,
       width    = 8, height = 6,
       units    = "in",
       bg       = "white")  # ensure white background
