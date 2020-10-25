library(ggplot2)
theme_set(theme_bw())  
library(tidyverse)        
options(scipen=999)

file2 <- read.csv("user-HW4-friend-count.csv")

ordered <- file2[order(-file2$FRIENDCOUNT),]
ordered$USER <- factor(ordered$USER, levels = ordered$USER)

theme_update(axis.text.x=element_blank())
ordered %>%
  mutate(highlight_flag = ifelse(USER=="U", T, F)) %>%
  ggplot(aes(x=USER, y=FRIENDCOUNT)) +
  geom_point(aes(color = highlight_flag)) +
  scale_color_manual(values = c('black', 'red')) +
  labs(y="Number of Friends", x="Users", caption="Facebook Data")
