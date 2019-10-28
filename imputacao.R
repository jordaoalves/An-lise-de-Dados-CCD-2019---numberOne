###############################################################################################################
#                                         dados agregados por dia
###############################################################################################################

dadosPorDiaApodi9818 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorDiaApodi9818.rds")
dadosPorDiaApodi9818$anoLinha <- str_sub(dadosPorDiaApodi9818$dataDia, end = 4)
dadosPorDiaApodi9818$anoLinha <- as.numeric(dadosPorDiaApodi9818$anoLinha)
dadosPorDiaApodi9818 <- dadosPorDiaApodi9818[-2]
dadosPorDiaApodi9818$dataDia <- as.Date(dadosPorDiaApodi9818$dataDia)

str(dadosPorDiaApodi9818)

dadosPorDiaApodi1218 <-  dadosPorDiaApodi9818[dadosPorDiaApodi9818$anoLinha > 2011,]

dataDia<- dadosPorDiaApodi1218$dataDia
anoLinha <- dadosPorDiaApodi1218$anoLinha

dadosPorDiaApodi1218$dataDia <- str_sub(dadosPorDiaApodi1218$dataDia, start = 6)
dadosPorDiaApodi1218$dataDia <- as.factor(dadosPorDiaApodi1218$dataDia)

dadosPorDiaApodi1218 <- dadosPorDiaApodi1218[-17]
str(dadosPorDiaApodi1218)


set.seed(111)
dadosPorDiaApodi1218Imputados <- rfImpute(dataDia ~ ., dadosPorDiaApodi1218)

dadosPorDiaApodi1218Imputados$dataDia <- dataDia
dadosPorDiaApodi1218Imputados <- cbind.data.frame(dadosPorDiaApodi1218Imputados,anoLinha)

View(dadosPorDiaApodi1218Imputados)

str(dadosPorDiaApodi1218Imputados)

saveRDS(dadosPorDiaApodi1218Imputados, "C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorDiaApodi1218Imputados.rds", compress = FALSE)

dadosPorDiaApodi1218Imputados <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorDiaApodi1218Imputados.rds")

write.csv2(dadosPorDiaApodi1218Imputados,"dadosPorDiaApodi1218Imputados.csv")

###############################################################################################################
#                                         dados agregados por mes 
###############################################################################################################

## Cada grupo de ver 12 linhas (agregação mensal)

dadosPorMesApodi9818 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorMesApodi9818.rds")


dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 1998,]) ## Ok
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 1999,]) ## Ok

apodi9899 <- rbind.data.frame(
  
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 1998,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 1999,] ## OK
  
)

str(apodi9899)


dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2000,]) ## menos linhas
apodi00 <- dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2000,]
apodi00Inicial <- apodi00
apodi00Outubro <- rbind.data.frame(c(2000,"2000-10",rep(NA,15)))
names(apodi00Outubro) <- names(apodi00)
apodi00Novembro <- rbind.data.frame(c(2000,"2000-10",rep(NA,15)))
names(apodi00Novembro) <- names(apodi00)
apodi00Dezembro <- rbind.data.frame(c(2000,"2000-10",rep(NA,15)))
names(apodi00Dezembro) <- names(apodi00)
apodi00 <- rbind.data.frame(apodi00Inicial,apodi00Outubro,apodi00Novembro,apodi00Dezembro)
dim(apodi00) ## Ok

apodi00$prec <- as.numeric(apodi00$prec)
apodi00$tair <- as.numeric(apodi00$tair)
apodi00$tw <- as.numeric(apodi00$tw)
apodi00$tmax <- as.numeric(apodi00$tmax)
apodi00$tmin <- as.numeric(apodi00$tmin)
apodi00$urmax <- as.numeric(apodi00$urmax)
apodi00$patm<- as.numeric(apodi00$patm)
apodi00$pnmm <- as.numeric(apodi00$pnmm)
apodi00$wd <- as.numeric(apodi00$wd)
apodi00$wsmax <- as.numeric(apodi00$wsmax)
apodi00$n <- as.numeric(apodi00$n)
apodi00$cc <- as.numeric(apodi00$cc)
apodi00$evap <- as.numeric(apodi00$evap)
apodi00$ur <- as.numeric(apodi00$ur)
apodi00$ws <- as.numeric(apodi00$ws)


str(apodi00)



dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2001,]) ## menos linhas
apodi01 <- dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2001,]

apodi01Janeiro <- c("2001","2001-01",rep(NA,15))
apodi01Fevereiro <- c("2001","2001-02",rep(NA,15))
apodi01Marco <- apodi01[1,]
apodi01Abril <- c("2001","2001-04",rep(NA,15))
apodi01Maio <- c("2001","2001-05",rep(NA,15))
apodi01Junho <- c("2001","2001-06",rep(NA,15))
apodi01Julho <- c("2001","2001-07",rep(NA,15))
apodi01Final <- apodi01[-1,]
apodi01 <- rbind.data.frame(apodi01Janeiro,apodi01Fevereiro,apodi01Marco,apodi01Abril,
                          apodi01Maio,apodi01Junho,apodi01Julho,apodi01Final)
dim(apodi01) ## Ok

apodi01$prec <- as.numeric(apodi01$prec)
apodi01$tair <- as.numeric(apodi01$tair)
apodi01$tw <- as.numeric(apodi01$tw)
apodi01$tmax <- as.numeric(apodi01$tmax)
apodi01$tmin <- as.numeric(apodi01$tmin)
apodi01$urmax <- as.numeric(apodi01$urmax)
apodi01$patm<- as.numeric(apodi01$patm)
apodi01$pnmm <- as.numeric(apodi01$pnmm)
apodi01$wd <- as.numeric(apodi01$wd)
apodi01$wsmax <- as.numeric(apodi01$wsmax)
apodi01$n <- as.numeric(apodi01$n)
apodi01$cc <- as.numeric(apodi01$cc)
apodi01$evap <- as.numeric(apodi01$evap)
apodi01$ur <- as.numeric(apodi01$ur)
apodi01$ws <- as.numeric(apodi01$ws)

str(apodi01)

dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2002,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2003,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2004,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2005,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2006,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2007,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2008,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2009,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2010,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2012,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2013,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2014,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2015,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2016,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2017,]) ## OK
dim(dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2018,]) ## OK

apodi0218 <- rbind.data.frame(
  
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2002,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2003,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2004,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2005,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2006,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2007,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2008,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2009,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2010,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2012,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2013,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2014,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2015,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2016,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2017,], ## OK
  dadosPorMesApodi9818[dadosPorMesApodi9818$anoLinha == 2018,] ## OK
  
)

dadosPorMesApodi9818 <- rbind.data.frame(apodi9899,apodi00,apodi01,apodi0218)

dadosPorMesApodi9818 <- dadosPorMesApodi9818[-1]

dataDF <- dadosPorMesApodi9818$dataDia

dadosPorMesApodi9818$dataDia <- str_sub(dadosPorMesApodi9818$dataDia, start = 6)
dadosPorMesApodi9818$dataDia <- as.factor(dadosPorMesApodi9818$dataDia)

## Vou retirar a variável pnmm por ter mts NAs e seu gráfico não diz muito sobre ela
dadosPorMesApodi9818 <- dadosPorMesApodi9818[-9] ## 9 coluna representa a coluna do pnmm


str(dadosPorMesApodi9818)

set.seed(111)
dadosPorMesApodi9818Imputados <- rfImpute(dataDia ~ ., dadosPorMesApodi9818)
dadosPorMesApodi9818Imputados$dataDia <- dataDF
View(dadosPorMesApodi9818Imputados)

str(dadosPorMesApodi9818Imputados)

saveRDS(dadosPorMesApodi9818Imputados, "C:/Users/Jordão Alves/Desktop/ccd_2019/dadosPorMesApodi9818Imputados.rds", compress = FALSE)

