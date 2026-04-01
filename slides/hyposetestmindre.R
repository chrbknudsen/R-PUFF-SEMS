library(ggplot2)

# To observerede testværdier
z_reject <- -2.2   # forkastes
z_accept <- -1.0   # forkastes ikke

# Kritisk værdi (ensidet, alpha = 0.05)
z_crit <- qnorm(0.05)  # ≈ -1.645

# Data til normalfordeling
df <- data.frame(
  x = seq(-4, 4, length.out = 1000)
)
df$y <- dnorm(df$x)

ggplot(df, aes(x, y)) +
  
  # Normalfordeling
  geom_line(linewidth = 1) +
  
  # Kritisk område (venstre hale)
  geom_area(
    data = subset(df, x <= z_crit),
    aes(x, y),
    fill = "red",
    alpha = 0.25
  ) +
  
  # Kritisk grænse
  geom_vline(xintercept = z_crit, linetype = 2, linewidth = 1) +
  
  # Observerede z-værdier
  geom_vline(xintercept = z_reject, color = "red", linewidth = 1.2) +
  geom_vline(xintercept = z_accept, color = "blue", linewidth = 1.2) +
  
  # Labels
  annotate("text", x = z_crit, y = 0.38,
           label = "kritisk værdi\n(-1.645)",
           hjust = 1.1) +
  
  annotate("text", x = z_reject, y = 0.32,
           label = "z = (x̄ - μ₀)/SE = -2.2\n→ forkast H₀",
           color = "red",
           hjust = 1.1) +
  
  annotate("text", x = z_accept, y = 0.27,
           label = "z = (x̄ - μ₀)/SE = -1.0\n→ forkast ikke H₀",
           color = "blue",
           hjust = 1.1) +
  
  labs(
    title = "Hypotesetest for middelværdi",
    subtitle = "Ensided test: H₀: μ ≥ μ₀ vs Hₐ: μ < μ₀",
    x = "z",
    y = "Tæthed"
  ) +
  
  theme_minimal()