# ajuste dos dados
# jordao alves



muniAlagado = bdmep$id[teste]

muniAlagado


indexEnxente <-  match(municipiosCheia2015$NM_MUNICIP,bdmep$name)
indexEnxente <- indexEnxente[complete.cases(indexEnxente)]

bdmepEnxente <-  bdmep[indexEnxente,]

library(dplyr)

idComEnchente <- dadosPorDia2015 %>% 
                  filter(id %in% bdmepEnxente$id)

idSemEnchente <- dadosPorDia2015 %>% 
                  filter(!id %in% bdmepEnxente$id)


idComEnchente$situacaoEnchente <- "Inundou"


idSemEnchente$situacaoEnchente <- "Não Inundou"

dadosPorDia2015 <- rbind.data.frame(idComEnchente,idSemEnchente)

dadosPorDia2015$situacaoEnchente <- as.factor(dadosPorDia2015$situacaoEnchente)



testeParaModelo <- dadosPorDia2015[10:18]


library(rpart)
modelo <- rpart(situacaoEnchente ~ ., method="class",data=testeParaModelo)


print(modelo)

library(rattle)
fancyRpartPlot(modelo, caption=NULL)

