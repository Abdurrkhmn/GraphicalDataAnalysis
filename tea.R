tea <- read.xlsx("tea.xlsx")

dev.off()

ggplot(tea, aes(x = tea, fill = tea)) +
  geom_bar() +
  scale_fill_manual(values=c("gray5",
                             "green3",
                             "red4")) +
  theme_bw()
