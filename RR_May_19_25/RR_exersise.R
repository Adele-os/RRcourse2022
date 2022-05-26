library(dplyr)
library(meta)
library("readxl")

my_data <- read_excel("data\\metaanalysis_data.xlsx")
head(my_data)
names(my_data)

# overall effects: effect sizes are already available
m1 <- metagen(TE=Mean_boys_play_male,
             seTE=SD_boys_play_male,
             data=my_data,
             studlab=paste(Study),
             fixed = TRUE,
             random = FALSE)
m1


############  Overall effects: effect sizes are not available #############
# Experimental group: boys who play with girl toys
# Control group: girls who play with girl toys
m.raw1 <- metacont(n.e=N_boys,
                  mean.e=Mean_boys_play_female,
                  sd.e=SD_boys_play_female,
                  n.c=N_girls,
                  mean.c=Mean_girls_play_female,
                  sd.c=SD_girls_play_female,
                  data=my_data,
                  studlab=paste(Study),
                  fixed = TRUE,
                  random = TRUE,
)
m.raw1

########### matada with random effects ##############################

m1_re <- metagen(TE=Mean_boys_play_male,
              seTE=SD_boys_play_male,
              data=my_data,
              studlab=paste(Study),
              fixed = F,
              random = T)
m1_re

########## Forest plots for graphical display of estimated results ##############
m1 %>% forest(sortvar=Mean_boys_play_male)
m1_re %>% forest(sortvar=Mean_boys_play_male)

########## Finding the variables which affect the results ##################

m1 %>% metareg(`Neutral toys` + `Parent present`)

########## Checking for publication bias #################################

m1 %>% funnel()





