
dadosPorDia2015
dadosPorDia2015SemId <- dadosPorDia2015[-c(1,2)]

library(randomForest)

str(dadosPorDia2015SemId)

model1 <- randomForest(situacaoEnchente ~ ., data = dadosPorDia2015SemId, importance = TRUE,na.action = na.roughfix)
model1

predTrain <- predict(model1, dadosPorDia2015SemId, type = "class")

table(predTrain, dadosPorDia2015SemId$situacaoEnchente) 


varImpPlot (model1)



library(ggRandomForests)




library("party")
x <- ctree(situacaoEnchente ~ ., data = dadosPorDia2015SemId)
plot(x, type="simple")



ggplot(iris_rf)




library(rpart)
library(rpart.plot)
modelo <- rpart(situacaoEnchente ~ ., method="class", data = dadosPorDia2015SemId)
prp(modelo, extra = 1)




library(rattle)
fancyRpartPlot(fit, caption=NULL)




plot(model1)


fit <- rpart(situacaoEnchente ~ ., method="class", data = dadosPorDia2015SemId)


plot(fit)
