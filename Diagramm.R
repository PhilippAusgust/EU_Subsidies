library(decisionSupport)
library(DiagrammeR)
#help(DiagrammeR)

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


#Final Diagram ####

DiagrammeR("
           
           graph LR
           I(income)-->A(final_decision)

           S(Subsidies) -->I
           BB(basic_subsidies)-->S
           
           MM(small_fields_subsidies)-->S
           B(basic_subsidies_costs)-->BB
           
           r(4%_costs_shutdown)-->B
           k(conversation_tillage)-->B
           ww(costs_water_protection)--> B
           pgl(costs_cns_tillage)-->B
           
           M(costs_field_area_<_5_ha)-->MM
           ef(more_cultivation_costs)-->M
           
           
           p(market_price)-->I
           YI(Yield)-->I
           
           
           
           
           
           c(costs)-->I
           
           saf(seeding_and_fertilizer_costs)-->c
           cp(costs_pesticides)-->c
           cm(costs_machinery)-->c
           hi(hail_insurance)-->c
           

           
           style S fill:lightgreen, stroke:#333,stroke-width:2px;
           style r fill:orange, stroke:#333,stroke-width:2px;
           style k fill:orange, stroke:#333,stroke-width:2px;
           style ww fill:orange, stroke:#333,stroke-width:2px;
           style pgl fill:orange, stroke:#333,stroke-width:2px;
           style ef fill:orange, stroke:#333,stroke-width:2px;
           style M fill:pink, stroke:#333,stroke-width:2px;
           style B fill:pink, stroke:#333,stroke-width:2px;
           style BB fill:lightgrey, stroke:#333,stroke-width:2px;
           style MM fill:lightgrey, stroke:#333,stroke-width:2px;
           style saf   fill:red, stroke:#333,stroke-width:2px;
           style cp    fill:red, stroke:#333,stroke-width:2px;
           style cm    fill:red, stroke:#333,stroke-width:2px;
           style c     fill:red, stroke:#333,stroke-width:2px;
           style hi    fill:red, stroke:#333,stroke-width:2px;
           ")
