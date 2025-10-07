library(ggplot2)
library(tidyverse)

data <- read.csv('ket_norket_data.csv')
data <- data %>% pivot_longer(cols=c(ket, norket), names_to = 'drug', values_to = 'conc')
data_summary <- summarySE(data, measurevar = 'conc', groupvars = c('time', 'drug'))
p <- ggplot(data_summary, aes(x=time, y=conc, group = drug, linetype=drug))
Figure1 <- p + geom_line() +
  geom_errorbar(aes(ymax=conc+sd, ymin=conc-sd), width = 3) +
  theme_classic() +
  labs(x='Time (minutes)', y='Plasma concentration (ng/mL)',
       title='Plasma Concentration of Ketamine and Norketamine') +
  theme(legend.position = c(.15, .8)) +
  scale_linetype_discrete(labels=c('ketamine', 'norketamine'))
ggsave('Figure_1.png', width=5, height=5, units=('in'))

