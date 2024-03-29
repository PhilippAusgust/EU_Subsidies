library("decisionSupport")
library(readr)


input_table <- read.csv2("Input_new.csv")
input_table
#View(input_table)

#Build_Function ####
subsidies_decision_function <- function(x, varnames){
  
  # define arrays with constant distribution
  farming_area_               <- rep(farm_size, n_years)
  eu_subsidies_basic          <- rep(eu_subsidies, n_years)
  eu_subsidies_small_fields   <- rep(small_fields, n_years)
  
  #define each Variable
  
  #Income factors
  wheat_price     <- vv(price_wheat, var_CV, n_years)
  wheat_yield     <- vv(yield_wheat, var_CV, n_years)
  
  #Costs general
  costs_fer_seeds <- vv(seeding_fertilizer_costs,var_CV, n_years)
  costs_pest      <- vv(costs_pesticides,var_CV, n_years)
  costs_machy     <- vv(costs_machinery, var_CV, n_years)
  costs_insur     <- vv(hail_insurance, var_CV, n_years)
  
  #Costs to get subsidies
  
  costs_consult               <- vv(cunsult_costs,var_CV,n_years)
  costs_shut_down             <- vv(costs_shutdown,var_CV,n_years)
  costs_conversation          <- vv(costs_cns_tillage, var_CV,n_years)
  costs_realize_small_fields  <- vv(more_cultivation_costs,var_CV, n_years)
  costs_own_effort            <- vv(own_efforts_costs,var_CV, n_years)
  costs_water_protec          <- vv(costs_water_protection,var_CV, n_years)
  costs_cultivation           <- vv(more_cultivation_costs,var_CV,n_years)
  
  net_subsidies <- rep(0, n_years)
  net_no_subsidies <- rep(0, n_years)
  
 
  
  #Berechne Risiko für den Fall, dass der Antrag aus EU Subventionen ausgefüllt wird und nicht eingereicht wird.In diesem Fall wird in 1 von 1000 Fällen der Antrag ausgefüllt. 
  basic_subsidies_small_fields_subsidies <- farming_area_*eu_subsidies_basic+farming_area_*eu_subsidies_small_fields
  
  
  planned_to_get_subsidies_but_not_realized <- chance_event(risk_, 1, 0, n = 1)
  
  for (decison_get_eu_subsidies in c(FALSE,TRUE)){
    
    if (decison_get_eu_subsidies){
      
      get_eu_subsidies <- TRUE
      application_costs <- TRUE 
      
    }
    
    else{
      
      get_eu_subsidies <- FALSE
      application_costs <- FALSE 
      
    }
    
    if (planned_to_get_subsidies_but_not_realized){
      
      get_eu_subsidies <- FALSE
      
    }
    #Beratungskosten und eigene Zeit die für Antrag benötigt wird
    cost_application <- rep(0, n_years)
    
    if (application_costs){
      cost_application <- (costs_consult+costs_own_effort)*farming_area_
    }
 
    #jährliche Kosten für Antrag (Beratung und eigene Zeit)
    annual_costs_subsidies <- rep(0,n_years)
    benefits_eu_subsidies  <- rep(0,n_years)
    #---------------------------------------------------------------------
    
    
    if (get_eu_subsidies){
      
      #Kosten die sofort entsthen, wenn der Antrag ausgefüllt/gestellt wird  
      annual_costs_subsidies <- cost_application
    
      #Subventionen die durch den Antrag potentiell ausgezahlt werden 
      benefits_eu_subsidies  <- basic_subsidies_small_fields_subsidies
    }
    
    opportunity_costs_subsedies <- rep(0, n_years)
    
    if(get_eu_subsidies){
      # Kosten, die durch Auflagen der Subventionen entstehen, wenn diese erhalten werden   
      opportunity_costs_subsedies <- (costs_shut_down+costs_conversation+costs_realize_small_fields+costs_water_protec+costs_cultivation) * farming_area_
    }
    
      
    
    
    #finale Gewinnberechnung mit Subventionen 
    if(get_eu_subsidies){ 
      
      total_benefits <-  benefits_eu_subsidies + farming_area_*(wheat_price*wheat_yield)
      net_subsidies <-  total_benefits - farming_area_* (costs_fer_seeds +costs_pest+costs_machy +costs_insur)- opportunity_costs_subsedies
      
    }
    
    else{
      
      net_no_subsidies <-  farming_area_*(wheat_price*wheat_yield) -farming_area_*(costs_fer_seeds +costs_pest+costs_machy +costs_insur)
      
    
    }
    
  }
  
    
  
  NPV_subsidies<-
    discount(net_subsidies, discount_rate, calculate_NPV = TRUE)

  NPV_no_subsidies <-
    discount(net_no_subsidies, discount_rate, calculate_NPV = TRUE)

  return(list(
    NPV_subsidies = NPV_subsidies,
    NPV_no_subsidies = NPV_no_subsidies,
    NPV_decision_do = NPV_subsidies - NPV_no_subsidies,
    Cashflow_decision_do = net_subsidies - net_no_subsidies
  ))
    
}
    

# mcSimulation ####

mcSimulation_results <- decisionSupport::mcSimulation(
  estimate = decisionSupport::estimate_read_csv("Input_new.csv", sep=";"),
  model_function = subsidies_decision_function,
  numberOfModelRuns = 1e3, #run 1,000 times
  functionSyntax = "plainNames"
)


mcSimulation_results

# Plots ####
decisionSupport::plot_distributions(mcSimulation_object = mcSimulation_results, 
                                    vars = c("NPV_subsidies", "NPV_no_subsidies"),
                                    method = 'smooth_simple_overlay', 
                                    colors = c("#FF0000", "#00FF00","#56B4E9" )) 


decisionSupport::plot_distributions(mcSimulation_object = mcSimulation_results, 
                                    vars = c("NPV_subsidies", "NPV_no_subsidies"),
                                    method = 'boxplot')









    
#Projection to Latent Structures (PLS) analysis ####

pls_result <- plsr.mcSimulation(object = mcSimulation_results,
                               resultName = names(mcSimulation_results$y)[3], ncomp = 1)


plot_pls(pls_result, input_table = input_table, threshold = 0.8)








# Value of Information (VoI) analysis ####


mcSimulation_table <- data.frame(mcSimulation_results$x, mcSimulation_results$y[1:3])
mcSimulation_table

#EVPI ####
evpi <- multi_EVPI(mc = mcSimulation_table, first_out_var = "NPV_subsidies")
evpi


plot_evpi(evpi, decision_vars = "NPV_decision_do")



#Cashflow ####
plot_cashflow(mcSimulation_object = mcSimulation_results, cashflow_var_name = "Cashflow_decision_do", x_axis_name = "Timeline Years",)

help("plot_cashflow")




decisionSupport::plot_distributions(mcSimulation_object = mcSimulation_results, 
                                    vars = "NPV_decision_do",
                                    method = 'boxplot_density')







compound_figure(mcSimulation_object = mcSimulation_results, input_table = input_table, plsrResults = pls_result, EVPIresults = evpi, decision_var_name = "NPV_decision_do", cashflow_var_name = "Cashflow_decision_do", base_size = 7)



# End



    
    