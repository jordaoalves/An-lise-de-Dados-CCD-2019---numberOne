library(stringr)

### Primeiro vou importar os arquivos .csv e os transformar em .rds 

## importando os dados .csv
#system.time({
#bdmep <- read.csv("bdmep_meta.csv", encoding="UTF-8")
#inmetr <- read.csv("inmetr.csv", encoding="UTF-8")
#municipiosCheia2015 <- read.csv("Municípios_Atingidos_por_Eventos_de_Inundação_em_2015.csv", encoding="UTF-8")
#})
## usuário   sistema decorrido 
## 62.75      2.90     65.78 

# ajuste no df antes de converter em .rds
# municipiosCheia2015$NM_MUNICIP <- str_to_title(municipiosCheia2015$NM_MUNICIP)

## exportando os dados (compress = F para otimizar o processo de leitura dos dados)
#saveRDS(bdmep, "C:/Users/Jordão Alves/Desktop/ccd_2019/bdmep_meta.rds", compress = FALSE) 
#saveRDS(inmetr, "C:/Users/Jordão Alves/Desktop/ccd_2019/inmetr.rds", compress = FALSE) 
#saveRDS(municipiosCheia2015, "C:/Users/Jordão Alves/Desktop/ccd_2019/municipiosCheia2015.rds", compress = FALSE) 

#system.time({
#bdmep <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/bdmep_meta.rds")
inmetr <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/inmetr.rds")
#municipiosCheia2015 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/municipiosCheia2015.rds")
#})
## usuário   sistema decorrido 
## 2.67      1.02      3.72 

### Repare que a diferença no tempo para importar os arquivos .csv vs .rds é gigante. A partir de agora sempre
### utilizarei os arquivos .rds por serem MUITO MAIS RÁPIDOS!!!


########################### ajuste df inmetr

anoLinha <- str_sub(inmetr$date, end = 4)
anoLinha <- as.numeric(anoLinha)

inmetr <- cbind.data.frame(anoLinha,inmetr)

inmetrApodi <- inmetr %>% 
  #   select(ano, muni, uf) %>% 
  filter(id == 82590)

inmetrApodi9818 <- inmetrApodi[inmetrApodi$anoLinha > 1997,]

mesLinha <- str_sub(inmetrApodi9818$date,  start = 6)
mesLinha <- str_sub(mesLinha,  end = 2)

diaLinha <- str_sub(inmetrApodi9818$date, end = 10)
diaLinha <- str_sub(diaLinha,  start = 9)

horaLinha <- str_sub(inmetrApodi9818$date, start = 12)

dataLinha <- str_sub(inmetrApodi9818$date, end = 10)

idComData <- paste(dataLinha,inmetrApodi9818$id, sep = "_")

inmetrApodi9818 <- cbind.data.frame(idComData,horaLinha, diaLinha, mesLinha,inmetrApodi9818)

# salvando em .rds para ficar mais fácil de importar 
saveRDS(inmetrApodi9818, "C:/Users/Jordão Alves/Desktop/ccd_2019/inmetrApodi9818.rds", compress = FALSE) 

inmetrApodi9818 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/inmetrApodi9818.rds")
bdmep <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/bdmep_meta.rds")
municipiosCheia2015 <- readRDS("C:/Users/Jordão Alves/Desktop/ccd_2019/municipiosCheia2015.rds")





