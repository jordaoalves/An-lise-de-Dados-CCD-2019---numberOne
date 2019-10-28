
dadosPorMesApodi9818Imputados <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorMesApodi9818Imputados.rds")

dadosPorMesApodi9818Imputados$INDEX <- c(1:240)

## barragem inaugurada em março de 2002 - ref linha: linha 51

DEPOISdadosPorMesApodi9818Imputados <-  dadosPorMesApodi9818Imputados[dadosPorMesApodi9818Imputados$INDEX >= 51,]
ANTESdadosPorMesApodi9818Imputados <-  dadosPorMesApodi9818Imputados[dadosPorMesApodi9818Imputados$INDEX < 51,]

ANTESdadosPorMesApodi9818Imputados$status <- "Antes"
DEPOISdadosPorMesApodi9818Imputados$status <- "Depois"

dadosPorMesApodi9818Imputados <- rbind.data.frame(ANTESdadosPorMesApodi9818Imputados, DEPOISdadosPorMesApodi9818Imputados)

library(plyr)
dadosPorMesApodi9818Imputados <- arrange(dadosPorMesApodi9818Imputados,INDEX)

View(dadosPorMesApodi9818Imputados)


dataMesApodi9818 <- dadosPorMesApodi9818Imputados[-c(1,16)]


analise.pca <- prcomp(dataMesApodi9818[, -c(15)], center=TRUE,scale.=TRUE)

head(analise.pca$x)

summary(analise.pca)

plot(analise.pca, main="Gráfico dos componentes principais do HTRU2")

### função que indica quantas variáveis conseguem explicar boa parte dos dados. Nesse caso ela indicou 3
library(psych)
psych::fa.parallel (dataMesApodi9818[, -c(15)], fa="pc", show.legend=T,main="Gráfico de scree da análise paralela do HTRU2")


library(GGally)
data <- as.data.frame(dataMesApodi9818[, -c(15)])
ggpairs(data)



require(ggfortify)
autoplot(analise.pca, data= dataMesApodi9818, colour="status",
         x=1, y=2,                                             ## para rotacionar o gráfico altere as variáveis
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 4,
         loadings.label.colour="dark green")

autoplot(analise.pca, data= dataMesApodi9818, colour="status",
         x=2, y=3,                                             ## para rotacionar o gráfico altere as variáveis
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 4,
         loadings.label.colour="dark green")

autoplot(analise.pca, data= dataMesApodi9818, colour="status",
         x=1, y=3,                                             ## para rotacionar o gráfico altere as variáveis
         loadings = TRUE, loadings.colour = 'blue',
         loadings.label = TRUE, loadings.label.size = 4,
         loadings.label.colour="dark green")


####### Vou plotar alguns gráficos "simples" para comprovar que o resultado da PCA 

dadosPorMesApodi9818Imputados <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorMesApodi9818Imputados.rds")

### como mostrado na PCA a precipitação não fica tão diferente entre as categorias 
plot(dadosPorMesApodi9818Imputados$prec)
plot(dadosPorMesApodi9818Imputados$prec,type = "l") 

### O tair já mostra que houve um aumento ao passar do tempo    ##########   
plot(dadosPorMesApodi9818Imputados$tair)
plot(dadosPorMesApodi9818Imputados$tair,type = "l")

### como mostrado na PCA o tw não fica tão diferente entre as categorias. 
plot(dadosPorMesApodi9818Imputados$tw)
plot(dadosPorMesApodi9818Imputados$tw,type = "l")

### como mostrado na PCA o tmax não fica tão diferente entre as categorias. 
plot(dadosPorMesApodi9818Imputados$tmax)
plot(dadosPorMesApodi9818Imputados$tmax,type = "l")

### O tmin mostra uma variação o mês 50  ###################
plot(dadosPorMesApodi9818Imputados$tmin)
plot(dadosPorMesApodi9818Imputados$tmin,type = "l")

### O urmax mostra uma variação até significativa, porém vou priorizar variáveis mais significativas
plot(dadosPorMesApodi9818Imputados$urmax)
plot(dadosPorMesApodi9818Imputados$urmax,type = "l")

### A patm na PCA mostrou bastante significativa e nos gráficos mostra um decaimento    ##################
plot(dadosPorMesApodi9818Imputados$patm)
plot(dadosPorMesApodi9818Imputados$patm,type = "l")

### Até ocorre mudanças mas é depois da criação da barragem mas ta muito bagunçado
plot(dadosPorMesApodi9818Imputados$wd)
plot(dadosPorMesApodi9818Imputados$wd,type = "l")

### Até ocorre mudanças mas é depois da criação da barragem
plot(dadosPorMesApodi9818Imputados$wsmax)
plot(dadosPorMesApodi9818Imputados$wsmax,type = "l")

### Esta variável tem que se manter constante pois é o tempo de sol por dia. NÃO AFETA NA BARRAGEM
plot(dadosPorMesApodi9818Imputados$n)
plot(dadosPorMesApodi9818Imputados$n,type = "l")

### mostra uma variação até significativa, porém vou priorizar variáveis mais significativas 
plot(dadosPorMesApodi9818Imputados$cc)
plot(dadosPorMesApodi9818Imputados$cc,type = "l")

### mostra uma variação até significativa, porém vou priorizar variáveis mais significativas ##############
plot(dadosPorMesApodi9818Imputados$evap)
plot(dadosPorMesApodi9818Imputados$evap,type = "l")

### mostra uma variação até significativa, porém vou priorizar variáveis mais significativas  ########
plot(dadosPorMesApodi9818Imputados$ur)
plot(dadosPorMesApodi9818Imputados$ur,type = "l")

### mostra uma variação até significativa, porém vou priorizar variáveis mais significativas 
plot(dadosPorMesApodi9818Imputados$ws)
plot(dadosPorMesApodi9818Imputados$ws,type = "l")

#### as variáveis que a PCA e os gráficos mostram significancia para a teoria da influência da barragem de santa
#### cruz nos dados metereologicos de APODI são: EVAP, PATM, TMIN, TAIR E UR.

### VOU EXPORTAR MEU DF PARA SER ANALISADO NO Series Shiny


write.csv2(dadosPorMesApodi9818Imputados,"dadosPorMesApodi9818Imputados.csv")


