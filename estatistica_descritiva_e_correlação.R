#ver os datasets dispon�veis em R
data()
data(mtcars)
View(mtcars)
?mtcars
attach(mtcars)#usar as variaveis diretamente

#pacotes gr�fico

install.packages("Hmisc")
install.packages("grid")
install.packages("lattice")
install.packages("ggplot2")

install.packages("survival")
install.packages("Formula")



library(Hmisc)
library(grid)
library(lattice)
library(survival)
library(Formula)
library(ggplot2)

#explorando os dados - visualizar informa��es m�nimo, maximo,media,
#mediana 1e 3quartil

summary(mtcars)

#explorando os dados - observa��es de cada variavel do dataset como, valores, faltantes
#media
describe(mtcars)#instalar package Hmiisc e survival
??describe

#fazendo um groupby da variavel cyl e calculando a m�dia de
#mpg 
exemplo<-summarize(mtcars$mpg,mtcars$cyl,mean)#package Hmisc
exemplo

exemplo2<-summarize(mtcars$mpg,mtcars$cyl,quantile)
exemplo2

exemplo3<-summarize(mtcars$mpg,mtcars$cyl,summary)
exemplo3

mean(mtcars$wt,na.rm = T )
var(mtcars$wt,na.rm = T )
sd(mtcars$wt,na.rm = T )
unique(mtcars$hp)


aggregate(mtcars$cyl~mtcars$mpg, data=mtcars, mean)
aggregate(mtcars$wt~mtcars$gear,data = mtcars, sd)

#Estatistica descritiva,  usa apply, laplly,saplly, taplly
#summarize, aggregate

cor(mtcars)
?cor

install.packages("corrgram")
install.packages("iterators")

library(corrgram)
library(iterators)

#cor azulescuro indica correla��o forte e positiva,
#cor azul medio indica correla��o m�dia e positiva
#cor azul claro indica correla��o fraca
#cor vermelha indica correla��o forte negativa
#cor vermelho medio indica correla��o m�dia e positiva
#cor vermelho claro indica correla��o fraca
corrgram(mtcars)

plot(mtcars$cyl, mtcars$mpg )
plot(mtcars$cyl,type = "o", col="blue",ylim = c(0,30))
lines(mtcars$mpg,type = "o", col= "red")

boxplot(mtcars$mpg, col = "blue", horizontal = T)
boxplot(mtcars$mpg~mtcars$cyl, main="car mileage data",ylab="milles pergallon",xlab="No of cylinder")



#pie-chart
stars(mtcars, draw.segments = T, key.loc = c(13,1.5))
