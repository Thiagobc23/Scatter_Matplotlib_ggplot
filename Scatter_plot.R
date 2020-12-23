# Data Viz ggplot2 - custom scatter plot

library(tidyverse)

# load data
poke <- read_csv('data/Pokemon.csv')
poke

summary(poke)

# 1
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense, color=Legendary))

# 2
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense, color=Legendary))+
  scale_color_manual(values = c('#F85C54','#2ACC74'),
                     labels = c('No', 'Yes'),
                     guide=guide_legend(title = 'Legendary',
                                        nrow=1,
                                        reverse=TRUE))+
  theme(legend.position = 'bottom', 
        legend.background = element_blank(),
        legend.key = element_rect(colour = NA, fill = NA))

# 3
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense, color=Legendary))+
  scale_color_manual(values = c('#F85C54','#2ACC74'),
                     guide=guide_legend(title = 'Legendary',
                                        nrow=1,
                                        reverse=TRUE),
                     labels = c('No', 'Yes'))+
  labs(title="Pokemon Attack X Defense",
       subtitle = "Stats values from Pokemon Games (Not Pokemon Cards or Pokemon GO)",
       caption = "Source: https://www.kaggle.com/abcsds/pokemon")+
  theme(legend.position = 'bottom', 
        legend.background = element_blank(),
        legend.key = element_rect(colour = NA, fill = NA))

# 4
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense, color=Legendary))+
  scale_color_manual(values = c('#F85C54','#2ACC74'),
                     guide=guide_legend(title = 'Legendary',
                                        nrow=1,
                                        reverse=TRUE),
                     labels = c('No', 'Yes'))+
  labs(title="Pokemon Attack X Defense",
       subtitle = "Stats values from Pokemon Games (Not Pokemon Cards or Pokemon GO)",
       caption = "Source: https://www.kaggle.com/abcsds/pokemon")+
  geom_hline(yintercept = mean(poke$Defense),
             size=1, alpha=0.5)+
  geom_vline(xintercept = mean(poke$Attack),
             size=1, alpha=0.5)+
  annotate(geom = "curve", x = 15, y = 210, xend = 10, yend = 230, 
           curvature = .3, arrow = arrow(length = unit(2, "mm"))) +
  annotate('text', label='Shuckle', x=15, y=210, hjust = "left")+
  annotate(geom = "curve", x = 170, y = 30, xend = 180, yend = 20, 
           curvature = .3, arrow = arrow(length = unit(2, "mm"))) +  
  annotate('text', label='Deoxys', x=170, y=33, hjust = "right") +
  theme(legend.position = 'bottom', 
        legend.background = element_blank(),
        legend.key = element_rect(colour = NA, fill = NA))


# Example Custom Viz
ggplot(data = poke) +
  geom_point(mapping = aes(x=Attack, y=Defense, color=Legendary))+
  scale_color_manual(values = c('#F85C54','#2ACC74'),
                     guide=guide_legend(title = 'Legendary',
                                        nrow=1,
                                        reverse=TRUE),
                     labels = c('No', 'Yes'))+
  labs(title="Pokemon Attack X Defense",
       subtitle = "Stats values from Pokemon Games (Not Pokemon Cards or Pokemon GO)",
       caption = "Source: https://www.kaggle.com/abcsds/pokemon")+
  geom_hline(yintercept = mean(poke$Defense), 
             color='white',
             size=1, alpha=0.5)+
  geom_vline(xintercept = mean(poke$Attack), 
             color='white',
             size=1, alpha=0.5)+
  annotate(geom = "curve", x = 15, y = 210, xend = 10, yend = 230, color='white', 
           curvature = .3, arrow = arrow(length = unit(2, "mm"))) +
  annotate('text', label='Shuckle', x=15, y=210, color='white', hjust = "left")+
  annotate(geom = "curve", x = 170, y = 30, xend = 180, yend = 20, color='white', 
           curvature = .3, arrow = arrow(length = unit(2, "mm"))) +  
  annotate('text', label='Deoxys', x=170, y=33, color='white', hjust = "right") +
  theme(legend.position = 'bottom', 
        legend.background = element_blank(),
        legend.key = element_rect(colour = NA, fill = NA),
        legend.title = element_text(color = "white", size = 11),
        legend.text = element_text(color = "white"),
        axis.text.x = element_text(color="white"),
        axis.text.y = element_text(color="white"),
        axis.title.x = element_text(color = "white"),
        axis.title.y = element_text(color = "white"),
        axis.line = element_line(color = "white"),
        plot.background = element_rect(fill = "#424242"),
        panel.background = element_rect(fill = "#424242"),
        panel.grid.major = element_line(color='#848484'),
        panel.grid.minor.y = element_blank(),
        panel.grid.minor.x = element_line(color='#848484'),
        plot.title = element_text(color = "white", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "white"),
        plot.caption = element_text(color = "white", face = "italic"))+
  ylim(0,250)+
  xlim(0,200)

# Clear environment
rm(list = ls()) 

# Clear console
cat("\014")  # ctrl+L
