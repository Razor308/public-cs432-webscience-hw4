library(ggplot2)
theme_set(theme_bw())  
library(tidyverse)        
options(scipen=999)

file3 <- read.csv("user-Followers.csv", sep="\t")

ordered2 <- file3[order(-file3$FOLLOWERS),]
ordered2$USER <- factor(ordered2$USER, levels = ordered2$USER)

theme_update(axis.text.x=element_blank())
ordered2 %>%
  mutate(highlight_flag = ifelse(USER=="U", T, F)) %>%
  ggplot(aes(x=USER, y=FOLLOWERS)) +
  geom_point(aes(color = highlight_flag)) +
  ylim(0, 1000) +
  scale_color_manual(values = c('black', 'red')) +
  labs(y="Number of Followers", x="Users", caption="Twitter Data")
