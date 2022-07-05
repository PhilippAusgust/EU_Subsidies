library(decisionSupport)
library(DiagrammeR)



DiagrammeR("
   graph LR
     WaterProtection-->Circulation
     ShutDownAreas-->Circulation
     LessPesticides-->Circulation
     Intercropping-->Circulation
     FloweringStrips-->Circulation
     Circulation -->EUSubsidies
     Circulation -->Yield
     Circulation -->Effort
     Effort -->Income
     Yield -->Income
     EUSubsidies -->Income
     ConventionalAgriculture -->EUSubsidies
     ConventionalAgriculture -->Yield
     Income -->FinalDecision
     Water_Protection-->ConventionalAgriculture
     Fertilizer_maximum-->ConventionalAgriculture
 ")



help(DiagrammeR)

DiagrammeR("
           
           graph LR
           
           I(income)-->A(final_decision)
           S(Subsidies) -->I
           YY(TRUE)-->S
           BB(TRUE)-->S
           MM(TRUE)-->S
           
           Y(young_farmers)-->YY
           Y-->aa(FALSE)
           B(basic_subsidies)-->BB
           B--> aaa(FALSE)
           
           M(max_field_size)-->MM
           M-->aaaa(FALSE)
           a(age_farmer)-->Y
           q(qualification_farmer)-->Y
           qq(max_support_time)-->Y
           r(4%_shutdown)-->B
           k(conversation_tillage)-->B
           ww(water_protection)--> B
           pgl(permanent_grass_land)-->B
           
           ef(each_field<5 ha)-->M
           
           
           p(market_price)-->I
           
           YI(Yield)-->I
           ppt(plant_protection)-->YI
           fez(fertilizer)-->YI
           cir(circulation_to_get_subsidies)-->YI
           w(weather_conditions)--> YI
           
           c(costs)-->I
           
           saf(seeding_and_fertilizer_costs)-->c
           cp(costs_pesticides)-->c
           cm(costs_machinery)-->c
           hi(hail_insurance)-->c
           
           
           
           
           
            
           
           
           
           
           
           
           style S fill:lightgreen, stroke:#333,stroke-width:2px;
           style a fill:lightgreen, stroke:#333,stroke-width:2px;
           style q fill:lightgreen, stroke:#333,stroke-width:2px;
           style qq fill:lightgreen, stroke:#333,stroke-width:2px;
           style r fill:lightgreen, stroke:#333,stroke-width:2px;
           style k fill:lightgreen, stroke:#333,stroke-width:2px;
           style ww fill:lightgreen, stroke:#333,stroke-width:2px;
           style pgl fill:lightgreen, stroke:#333,stroke-width:2px;
           style ef fill:lightgreen, stroke:#333,stroke-width:2px;
           style M fill:lightgreen, stroke:#333,stroke-width:2px;
           style B fill:lightgreen, stroke:#333,stroke-width:2px;
           style Y fill:lightgreen, stroke:#333,stroke-width:2px;
           
           style YY fill:darkgreen, stroke:#333,stroke-width:2px;
           style BB fill:darkgreen, stroke:#333,stroke-width:2px;
           style MM fill:darkgreen, stroke:#333,stroke-width:2px;
           
           
           style aa   fill:pink, stroke:#333,stroke-width:2px;
           style aaa  fill:pink, stroke:#333,stroke-width:2px;
           style aaaa fill:pink, stroke:#333,stroke-width:2px;
           
           
           style saf   fill:red, stroke:#333,stroke-width:2px;
           style cp    fill:red, stroke:#333,stroke-width:2px;
           style cm    fill:red, stroke:#333,stroke-width:2px;
           style c     fill:red, stroke:#333,stroke-width:2px;
           style hi    fill:red, stroke:#333,stroke-width:2px;
           ")
