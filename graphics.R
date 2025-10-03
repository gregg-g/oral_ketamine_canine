library(ggplot2)
library(tidyverse)

data <- read.csv('ket_norket_data.csv')
data <- data %>% pivot_longer(cols=c(ket, norket), names_to = 'drug', values_to = 'conc')
data_summary <- summarySE(data, measurevar = 'conc', groupvars = c('time', 'drug'))
p <- ggplot(data_summary, aes(x=time, y=conc, group = drug, linetype=drug))
p + geom_line()
