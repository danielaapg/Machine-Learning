#regress�o Linear
#rela��o desempenho academico Xsatisfa��o com o curso

#ler dataset
library(readxl)
satisfacao_uni<- read_excel("~/R/dataset/satisfa��o com universidade.xlsx")
View(satisfacao_uni)

#explorando o dataset
dim(satisfacao_uni)
names(satisfacao_uni)
str(satisfacao_uni)

#analise exploratoria dos dados

summary(satisfacao_uni)

#explora��o grafica

plot(satisfacao_uni$`Desempenho acad�mico`,satisfacao_uni$Satisfa��o)

#correla��o entre desempenhoxsatisfacao
correla��o<-cor(satisfacao_uni$`Desempenho acad�mico`, satisfacao_uni$Satisfa��o, method="pearson")
correla��o
#correla��o baixa

#regress�o linear
rl<-lm(satisfacao_uni$`Desempenho acad�mico`~satisfacao_uni$Satisfa��o, data=satisfacao_uni)
rl
summary(rl)

residuals(rl)
coefficients(rl)

#Teste para normalidade(valores de p <0,05 indicam dados normais)
shapiro.test(rstudent(rl))

#analise visual para homegeneidade dos residuos(visualmente eles devem se distribuir igualmente)
plot(rstudent(rl)~fitted(rl), pch=19)
abline(h=0,lty=2, col ="red")

