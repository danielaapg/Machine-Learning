#Arvore de classificação  usando package rpart
#instalando os pacotes necessários
install.packages("rpart")
install.packages("rpart.plot")
library(rpart)
library(rpart.plot)

#ler o dataset

data("iris")

#explorar o dataset
str(iris)

table(iris$Species)


set.seed(9850)
#Pegando dados aleatorios com a função runif
gp<-runif(nrow(iris))#vai pegar aleatoriamente conforme o numero de linhas do dataset
gp
iris2<-iris[order(gp),]
#agora o dataset vai estar ordenado de forma aleatória conforme podemos verificar
str(iris)
str(iris2)

#criando modelo os dados


modelo<-rpart(Species~Sepal.Length+Sepal.Width+Petal.Length+Petal.Width, data=iris2[1:100,], method = "class")

#pode-se usar o comamdo rpart(Species~.,)o ponto significa todos outros atributos

modelo

rpart.plot(modelo)
#rpart.plot(modelo, type=3, extra=101,fallen.leaves = TRUE)

summary(modelo)

#verificando a performance  do modelo

predicao<-predict(modelo, iris2[101:150,], type="class")
table(iris2[101:150,5],predicted=predicao)
