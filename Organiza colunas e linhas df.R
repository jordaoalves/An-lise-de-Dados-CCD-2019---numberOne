# organiza colunas e linhas
# jordao alves

## organizar por colunas os números de linhas por dia de observação para depois fazer matchs

## prec

prec <- cbind.data.frame(inmetrApodi9818[1:8])
precDia <-  with(prec, 
                aggregate(prec, by=list(idComData), FUN=function(x) 
                if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(precDia$x)

### tair
tair <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[9])
tairDia <-  with(tair, 
                 aggregate(tair, by=list(idComData), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(tairDia$x)

### tw
tw <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[10])
twDia <-  with(tw, 
                 aggregate(tw, by=list(idComData), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(twDia$x)

### tmax
tmax <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[11])
tmaxDia <-  with(tmax, 
               aggregate(tmax, by=list(idComData), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) max(z) else NA))

plot(tmaxDia$x)

### tmin
tmin <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[12])
tminDia <-  with(tmin, 
                 aggregate(tmin, by=list(idComData), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) min(z) else NA))
plot(tminDia$x)

### urmax
urmax <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[13])
urmaxDia <-  with(urmax, 
                 aggregate(urmax, by=list(idComData), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) max(z) else NA))
plot(urmaxDia$x)

### patm
patm <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[14])
patmDia <-  with(patm, 
                  aggregate(patm, by=list(idComData), FUN=function(x) 
                    if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(patmDia$x)

### pnmm
pnmm <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[15])
pnmmDia <-  with(pnmm, 
                 aggregate(pnmm, by=list(idComData), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(pnmmDia$x)

### wd
wd <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[16])
wdDia <-  with(wd, 
                 aggregate(wd, by=list(idComData), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(wdDia$x)

### wsmax
wsmax <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[17])
wsmaxDia <-  with(wsmax, 
               aggregate(wsmax, by=list(idComData), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(wsmaxDia$x)

### n
n <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[18])
nDia <-  with(n, 
                  aggregate(n, by=list(idComData), FUN=function(x) 
                    if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(nDia$x)

### cc
cc <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[19])
ccDia <-  with(cc, 
              aggregate(cc, by=list(idComData), FUN=function(x) 
                if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(ccDia$x)

### evap
evap <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[20])
evapDia <-  with(evap, 
               aggregate(evap, by=list(idComData), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(evapDia$x)

### ur
ur <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[21])
urDia <-  with(ur, 
               aggregate(ur, by=list(idComData), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(urDia$x)

### ws
ws <- cbind.data.frame(inmetrApodi9818[1:7],inmetrApodi9818[22])
wsDia <-  with(ws, 
               aggregate(ws, by=list(idComData), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(wsDia$x)



dadosPorDiaApodi9818 <- cbind.data.frame(precDia,tairDia$x,twDia$x,tmaxDia$x,tminDia$x,urmaxDia$x,patmDia$x,
                                pnmmDia$x,wdDia$x,wsmaxDia$x,nDia$x,ccDia$x,evapDia$x,urDia$x,wsDia$x)

names(dadosPorDiaApodi9818) <- names(inmetr)[-c(1,2)]

View(dadosPorDiaApodi9818)

dataDia <- str_sub(dadosPorDiaApodi9818$id, end = 10)
dataDia

dadosPorDiaApodi9818$id <- str_sub(dadosPorDiaApodi9818$id, start = 12)

dadosPorDiaApodi9818 <- cbind.data.frame(dataDia,dadosPorDiaApodi9818)

saveRDS(dadosPorDiaApodi9818, "C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorDiaApodi9818.rds", compress = FALSE) 

dadosPorDiaApodi9818 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorDiaApodi9818.rds")

str(dadosPorDiaApodi9818)

############################################################################################################################
#                                               agregando dados por mes
############################################################################################################################
dadosPorDiaApodi9818 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorDiaApodi9818.rds")

dadosPorDiaApodi9818$dataDia <- str_sub(dadosPorDiaApodi9818$dataDia, end = 7)



## prec

prec <- cbind.data.frame(dadosPorDiaApodi9818[1:3])
precMes <-  with(prec, 
                 aggregate(prec, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(precMes$x)

### tair
tair <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[4])
tairMes <-  with(tair, 
                 aggregate(tair, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(tairMes$x)

### tw
tw <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[5])
twMes <-  with(tw, 
               aggregate(tw, by=list(dataDia), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(twMes$x)

### tmax
tmax <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[6])
tmaxMes <-  with(tmax, 
                 aggregate(tmax, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) max(z) else NA))

plot(tmaxMes$x)

### tmin
tmin <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[7])
tminMes <-  with(tmin, 
                 aggregate(tmin, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) min(z) else NA))
plot(tminMes$x)

### urmax
urmax <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[8])
urmaxMes <-  with(urmax, 
                  aggregate(urmax, by=list(dataDia), FUN=function(x) 
                    if (any(is.finite(z<-na.omit(x)))) max(z) else NA))
plot(urmaxMes$x)

### patm
patm <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[9])
patmMes <-  with(patm, 
                 aggregate(patm, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(patmMes$x)

### pnmm
pnmm <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[10])
pnmmMes <-  with(pnmm, 
                 aggregate(pnmm, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(pnmmMes$x)

### wd
wd <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[11])
wdMes <-  with(wd, 
               aggregate(wd, by=list(dataDia), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(wdMes$x)

### wsmax
wsmax <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[12])
wsmaxMes <-  with(wsmax, 
                  aggregate(wsmax, by=list(dataDia), FUN=function(x) 
                    if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(wsmaxMes$x)

### n
n <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[13])
nMes <-  with(n, 
              aggregate(n, by=list(dataDia), FUN=function(x) 
                if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(nMes$x)

### cc
cc <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[14])
ccMes <-  with(cc, 
               aggregate(cc, by=list(dataDia), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(ccMes$x)

### evap
evap <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[15])
evapMes <-  with(evap, 
                 aggregate(evap, by=list(dataDia), FUN=function(x) 
                   if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(evapMes$x)

### ur
ur <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[16])
urMes <-  with(ur, 
               aggregate(ur, by=list(dataDia), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(urMes$x)

### ws
ws <- cbind.data.frame(dadosPorDiaApodi9818[1:2],dadosPorDiaApodi9818[17])
wsMes <-  with(ws, 
               aggregate(ws, by=list(dataDia), FUN=function(x) 
                 if (any(is.finite(z<-na.omit(x)))) mean(z) else NA))
plot(wsMes$x)



dadosPorMesApodi9818 <- cbind.data.frame(precMes,tairMes$x,twMes$x,tmaxMes$x,tminMes$x,urmaxMes$x,patmMes$x,
                                         pnmmMes$x,wdMes$x,wsmaxMes$x,nMes$x,ccMes$x,evapMes$x,urMes$x,wsMes$x)

names(dadosPorMesApodi9818) <- names(dadosPorDiaApodi9818)[-c(2)]

View(dadosPorMesApodi9818)

anoLinha <- str_sub(dadosPorMesApodi9818$dataDia, end = 4)
anoLinha

dadosPorMesApodi9818 <- cbind.data.frame(anoLinha,dadosPorMesApodi9818)

saveRDS(dadosPorMesApodi9818, "C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorMesApodi9818.rds", compress = FALSE) 

dadosPorMesApodi9818 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorMesApodi9818.rds")

str(dadosPorMesApodi9818)













