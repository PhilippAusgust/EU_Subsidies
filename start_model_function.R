library("decisionSupport")
library(readr)

#uncomment below to have a look at inputs 
#shift+cmd+c drüchen und vorher zeile 7,8,9 markieren

# input_tabel <- read.csv2("Input_new.csv")
# input_tabel
# View(input_tabel)

subsidies_decision_funktion <- function(x, varnames){
  
  yield <- vv(yield_wheat,var_CV, n_years)
  eu_subsidies<- rep(eu_subsidies, n_years)
  price <- vv(price_wheat,var_CV,n_years )
  costs_plant_pro <- vv(costs_pesticides,var_CV,n_years)
  costs_sd_fer <- vv(seeding_fertilizer_costs,var_CV, n_years)
  costs_mach <- vv(costs_machinery,var_CV,n_years)
  costs_insurance <- vv(hail_insurance,var_CV,n_years)
  
  
  precalc_wheat_benefits <- yield*price- costs_plant_pro - costs_sd_fer - costs_mach - costs_insurance
  
  
  #german version
  # Hier startet die Fallunterscheidung. Man kann sich für oder gegen Subventionen entscheiden. TRUE und FALSE geben an, ob sich dafür oder dagegen entschieden wurde.
  # Abhängig davon wird einmal der Erwartende Gewinn einmal mit und einmal ohne EU Subventionen berechnet. Die Entscheidung für oder gegen Subventionen verursacht zum einen Kosten,
  # die durch Vorschriften auf Ackerbaulicher Seite entstehen. Hier sind das konkret die Kosten für das Stilllegen von 4% Ackerfläche (Kosten in dem Sinn "Wie viel weniger Ertrag 
  # wird generiert") -> weniger Einnahmen. Ich meine das heißt dann Opportunitätskosten :D, Kosten für Abstand zu Gewässern und Kosten die durch reduzierte Bodenbearbeitung entstehen. 
  
  # english version 
  # Here the case distinction starts. One can decide for or against subsidies. TRUE and FALSE indicate whether it was decided for or against.
  # Depending on it the expected profit is calculated once with and once without EU subsidies.The decision for or against subsidies causes costs on the one hand,
  # that arise from regulations on the arable side. Here these are concretely the costs for the shutdown of 4% arable land (costs in the sense of "How much less yield is 
  # is generated") -> less revenue. I mean that is then called opportunity costs :D, costs for distance to water bodies and costs that arise from reduced tillage.
  
  
  
  
  for (decison_get_eu_subsidies in c(FALSE,TRUE)){
    
    
    
    #Diese Variablen werden berechnet, wenn sich für die Subventionen entschieden wird.
    #These variables are calculated when the subsidies are decided.
    if (decison_get_eu_subsidies)
    {
      get_eu_subsidies <- TRUE
      cost_to_get_subsidies <- TRUE
      application_costs <- TRUE    
    }
    
    else
    {
      #Die Variablen werden nicht berechnet wenn sich gegen Subventionen entschieden wird.  
      #The variables are not calculated if subsidies are not chosen.
      get_eu_subsidies <- FALSE
      cost_to_get_subsidies <- FALSE
      application_costs <- FALSE
    }
    #Wenn der Antrag für die Subventionen bearbeitet wird, aber nicht final eingereicht wird. (Antragskosten bleiben bestehen)  
    #If the application for the subsidies is processed but not finally submitted. (application costs remain)
    if(planed_to_get_subsidies_but_not_realized)
      
    {
      get_eu_subsidies <- FALSE
      cost_to_get_subsidies <- FALSE
    }
    
    #--------------------------------------------------------
    
    if(cost_to_get_subsidies){
      #Var.from InputTabel
      costs_subsidies <- costs_shutdown+  costs_water_protection+ costs_cns_tillage
      
    }  
    
    else
    {
      costs_subsidies <- 0
    }
    
    if (application_costs){
      #Var.from InputTabel
      costs_application <- own_efforts_costs + cunsult_costs
      
    }
    
    else{
      application_costs <- 0
      
    }
    
    if(get_eu_subsidies)
      
    {
      get_eu_subsidies_wheat <- eu_subsidies + precalc_wheat_benefits 
      
    }}}