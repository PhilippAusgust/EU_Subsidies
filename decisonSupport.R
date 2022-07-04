# import_area ####

library(decisionSupport)
library(readr)
library(readxl)
library(ggplot2)



#exante calculation

#Data preparation ####

# Reading the input table. The file is stored as an xlsx file in git repositorie. 
inputfile_wheat <- read_excel("Input_wheat.xlsx")

# short view on it
View(inputfile_wheat)

#create a dataframe from scratch, if you dont want work with the xlsx file. For activation  highlight the code and press cmd +shift+ c

# cmd+shift+c = an aus 
# input_estimates_1 <- data.frame(variable = c("Yield", "Price", "seeding_and_fertilizer_costs", "costs_pesticides","costs_machinery","hail_insurance"),
#                               lower = c(70,16.5,323,175,160,10),
#                               median = NA,
#                               upper = c(110, 25.5, 386,240,190,12),
#                               distribution = c("posnorm", "posnorm", "posnorm","posnorm", "posnorm", "posnorm"),
#                               label = c("dt/ha", "Euro/dt", "Euro/ha", "Euro/ha", "Euro/ha", "Euro/ha")
#                               )




#create data frame with input table. 

input_estimates_wheat <- data.frame(variable = c("Yield", "Price", "seeding_and_fertilizer_costs", "costs_pesticides","costs_machinery","hail_insurance","eu_sub"),
                              lower =inputfile_wheat$lower ,
                              median = inputfile_wheat$median,
                              upper = inputfile_wheat$upper,
                              distribution = inputfile_wheat$distribution,
                              label = inputfile_wheat$label
)


input_estimates_wheat


#build the model function for wheat profit ####


modelfunction_wheat <- function(){
  
  total_turnover <- Price*Yield 
  
  total_effort <- seeding_and_fertilizer_costs+costs_pesticides+costs_machinery+hail_insurance
  
  profit_margin  <- total_turnover- total_effort
  
  if(eu_sub==TRUE){ profit_margin <- profit_margin +150
                    total_turnover <- total_turnover * 0.96
                    }
  
  
  return(list(profit_margin = profit_margin))
  }


#montecarlo Simulation ####

# 1000 times simulate the cultivation of wheat and calculate the profit


wheat_mc_simulation <- mcSimulation(estimate = as.estimate(input_estimates_wheat),
                                      model_function = modelfunction_wheat, 
                                      numberOfModelRuns = 1000,
                                      functionSyntax = "plainNames")



# show results og mc simulation
wheat_mc_simulation

# y <- wheat_mc_simulation$y
# y
# write.csv(y,"Profit.csv", row.names = FALSE)
# 
# # some plots####
# 
# #perparation for plots
# Profit <- read_csv("Profit.csv")
# 
# y_1 <- Profit$profit_margin
# y_1
# 
# #craete dataframe
# 
# data <- data.frame(
#   
#   n = rep(1:1000, 1),
#   re = y_1
# )
# 
# 
# 
# # use ggplot
# 
# 
# 
# plot_1 <- ggplot(data=data, aes(x =m, y=re))+
#           geom_line() 
#           
# 
# plot_1



plot_distributions(mcSimulation_object = wheat_mc_simulation,
                   vars = "profit_margin",
                   method = "boxplot_density",
                   old_names = "profit_margin",
                   new_names = "Outcome distribution for profits")





# Use helper function ####
# use the helper function for generating Variables


make_variables <- function(est,n=1)
{ x<-random(rho=est, n=n)
for(i in colnames(x)) assign(i,
 as.numeric(x[1,i]),envir=.GlobalEnv)
}


make_variables(as.estimate(input_estimates_wheat))

seeding_and_fertilizer_costs

# in german: Funktion um einen Wert aus der generierten MC Simulation zu picken
# Im Weiteren kann auf die Erzeugten Variablen dann über die sog. Hilfsfunktion "make_variables" zugegriffen werden. 







