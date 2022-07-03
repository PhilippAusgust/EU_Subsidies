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
