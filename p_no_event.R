# Parameters
p         <- 0.01
max_years <- 1000
outfile   <- "no_event.png"

# Compute
years      <- 0:max_years
prob_no_ev <- (1 - p)^years
df         <- data.frame(years, prob = prob_no_ev)

png(filename = outfile,
    width    = 800, height = 600,
    bg       = "white")
plot(years, prob_no_ev,
     type  = "l", lwd = 2,
     xlab  = "Years",
     ylab  = "P(no event)",
     main  = expression(f(x) == (1 - p)^x)
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
    title    = sprintf("Probability of No Event (p = %.2f%%)", p*100),
    subtitle = expression(f(x) == (1 - p)^x),
    x        = "Years",
    y        = "P(no event)"
  ) +
  theme_bw()                  # ← white background + grid

ggsave(filename = outfile,
       plot     = plt,
       width    = 8, height = 6,
       units    = "in",
       bg       = "white")    # ← ensure saved bg is white
