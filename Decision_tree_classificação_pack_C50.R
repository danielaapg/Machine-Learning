#decisin tree para variaveis categóricas usado o pacote C50
install.packages("C50")
library(C50)
#ler o arquivo
data(iris)

#explorar o dataset
table(iris)
head (iris)

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




# verificando a performance do modelo
modelo<-C5.0(iris2[1:100,-5],iris2[1:100,5])
modelo
summary(modelo)
predicao<-predict(modelo, iris2[101:150,])
predicao
table(iris2[101:150,5],Predicted= predicao)


#verificando a acuracia do modelo
accuracy <- function(iris_teste){
  correct <-0
  for(i in c(1:nrow(iris_teste))){
    if(iris_teste[i,5] == iris_teste[i,6]){ 
      correct <- correct+1
    }
  }
  accu = correct/nrow(iris_teste) * 100  
  return(accu)
}

iris_teste<-iris2[101:150,]
iris_teste[,6]<-predicao
iris_teste
print(accuracy(iris_teste))
#Podemos verificar que o modelo tem 98% de acuracia

plot(modelo)
