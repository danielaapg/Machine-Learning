
#lendo os dados
data("iris")

#explorando o dataset

str(iris)

table(iris$Species)
summary(iris)
head(iris)

#setar a semente para pegar os  mesmas amostras qdo rodar o programa novamente 
set.seed(9850)

#Pegando dados aleatorioscom a função runif
runif(5) # gera 5 numeros aleatorios entre 0  e 1
gp<-runif(nrow(iris))#vai pegar aleatoriamente conforme o numero de linhas do dataset
gp
iris2<-iris[order(gp),]
#agora o datase vai estar misturado conforme podemos verificar
str(iris)
str(iris2)
summary(iris2[,c(1,2,3,4)])
#criando a função que normaliza os dados

normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}

normalize(c(1,2,3,4,5))
iris2_n<-as.data.frame(lapply(iris2[,c(1,2,3,4)],normalize))
str(iris2_n)
summary(iris2_n)

#criar o dataset de treinamento e  de teste
iris_train <- iris2_n[1:129,]
iris_test <- iris2_n[130:150,]

iris_train_target <- iris2[1:129,5]
iris_test_target<-iris2[130:150,5]
require(class)
# definir o valor de k uma maneira simplificada (raiz quadrada do total numero de observações )
sqrt(150)
modelo1<- knn(train = iris_train, test = iris_test, cl=iris_train_target, k=13)

#validando a performance do modelo
table(iris_test_target,modelo1)


library(gmodels)
CrossTable(x=iris_test_target,y=modelo1,prop.chisq = FALSE)



accuracy <- function(iris_test2){
  correct <-0
  for(i in c(1:nrow(iris_test2))){
    if(iris_test2[i,5] == iris_test2[i,6]){ 
      correct <- correct+1
    }
  }
  accu = correct/nrow(iris_test2) * 100  
  return(accu)
}

View(iris_test)
iris_test2<-iris_test
iris_test2[,5]<-modelo1
iris_test2[,6]<-iris_test_target
View(iris_test2)
print(accuracy(iris_test2))
# como podemos observar o modelo tem 90.47% acuracia
