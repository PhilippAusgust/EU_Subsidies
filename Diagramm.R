library(decisionSupport)
library(DiagrammeR)

help(DiagrammeR)
help("graph LR")

#Previous Diagram ####

# DiagrammeR("
#    graph LR
#      WaterProtection-->Circulation
#      ShutDownAreas-->Circulation
#      LessPesticides-->Circulation
#      Intercropping-->Circulation
#      FloweringStrips-->Circulation
#      Circulation -->EUSubsidies
#      Circulation -->Yield
#      Circulation -->Effort
#      Effort -->Income
#      Yield -->Income
#      EUSubsidies -->Income
#      ConventionalAgriculture -->EUSubsidies
#      ConventionalAgriculture -->Yield
#      Income -->FinalDecision
#      Water_Protection-->ConventionalAgriculture
#      Fertilizer_maximum-->ConventionalAgriculture
#  ")
# 


#Final Diagram Main ####

DiagrammeR("
           
           graph LR
           I(income)-->A(final_decision)

           S(Subsidies) -->I
           BB(basic_subsidies)-->S
           
           MM(small_fields_subsidies)-->S
           B(costs_basic_subsidies)-->BB
           
           r(costs_4%_shutdown)-.->B
           k(costs_conversation_tillage)-.->B
           ww(costs_water_protection)-.-> B
     
           
           M(costs_field_area_<_5_ha)-->MM
           ef(costs_more_cultivation)-.->M
           
           
           CC(costs_consulting) -.-> S
           OE(costs_own_effort)-.-> S
           
           p(market_price)-->I
           YI(Yield)-->I
           
           
           
           
           
           c(costs)-->I
           
           saf(costs_seeding_and_fertilizer)-->c
           cp(costs_pesticides)-->c
           cm(costs_machinery)-->c
           hi(costs_hail_insurance)-->c
           

           
           style S fill:lightgreen, stroke:#0000ff,stroke-width:3px;
           style r fill:orange, stroke:#333,stroke-width:2px;
           style k fill:orange, stroke:#333,stroke-width:2px;
           style ww fill:orange, stroke:#333,stroke-width:2px;
           style ef fill:orange, stroke:#333,stroke-width:2px;
           style CC fill:orange, stroke:#333,stroke-width:2px;
           style OE fill:orange, stroke:#333,stroke-width:2px;
           style M fill:pink, stroke:#333,stroke-width:2px;
           style B fill:pink, stroke:#333,stroke-width:2px;
           style BB fill:lightgrey, stroke:#333,stroke-width:2px;
           style MM fill:lightgrey, stroke:#333,stroke-width:2px;
           style saf fill:orangered, stroke:#333,stroke-width:2px;
           style cp fill:orangered, stroke:#333,stroke-width:2px;
           style cm fill:orangered, stroke:#333,stroke-width:2px;
           style c  fill:orangered, stroke:#333,stroke-width:2px;
           style hi fill:orangered, stroke:#333,stroke-width:2px;
           style costs_for_eu_subsidies    fill:orange;
           style general_production_costs    fill:orangered;
           ")









#Final Diagram Subsection Subsidies ####


DiagrammeR("
           
           graph LR
           

           
           BB(basic_subsidies)-->S(Subsidies)
           
           MM(small_fields_subsidies)-->S
           B(basic_subsidies_costs)-->BB
           
           r(costs_4%_shutdown)-.->B
           k(costs_conversation_tillage)-.->B
           ww(costs_water_protection)-.-> B
           
           
           M(costs_field_area_<_5_ha)-->MM
           ef(costs_more_cultivation)-->M
           
           
           CC(costs_consulting) -.-> S
           OE(costs_own_effort)-.-> S

           
           style S fill:lightgreen, stroke:#0000ff,stroke-width:3px;
           style r fill:orange, stroke:#333,stroke-width:2px;
           style k fill:orange, stroke:#333,stroke-width:2px;
           style ww fill:orange, stroke:#333,stroke-width:2px;
           
           style ef fill:orange, stroke:#333,stroke-width:2px;
           style CC fill:orange, stroke:#333,stroke-width:2px;
           style OE fill:orange, stroke:#333,stroke-width:2px;
           style M fill:pink, stroke:#333,stroke-width:2px;
           style B fill:pink, stroke:#333,stroke-width:2px;
           style BB fill:lightgrey, stroke:#333,stroke-width:2px;
           style MM fill:lightgrey, stroke:#333,stroke-width:2px;
           
           style costs_for_eu_subsidies    fill:orange;
          
           ")




#Final Diagram Subsection Costs ####


DiagrammeR("
           
           graph LR
         
           
           
           
           
           
           
           
          
           
           saf(seeding_and_fertilizer_costs)-->c(general_costs)
           cp(costs_pesticides)-->c
           cm(costs_machinery)-->c
           hi(hail_insurance)-->c
           

           
           
           style saf fill:orangered, stroke:#333,stroke-width:2px;
           style cp fill:orangered, stroke:#333,stroke-width:2px;
           style cm fill:orangered, stroke:#333,stroke-width:2px;
           style c  fill:orangered, stroke:#333,stroke-width:2px;
           style hi fill:orangered, stroke:#333,stroke-width:2px;
          
           style general_production_costs    fill:orangered;
           ")









