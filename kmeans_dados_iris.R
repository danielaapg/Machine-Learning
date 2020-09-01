#k-means

#outra maneira de usar o dataset
library(datasets)
head(iris)

#lendo e  visualizando o dataset
attach(iris)
View(iris)
dim(iris)



# selecionadno os dados que seão utilizados
iris_dados<-iris[1:150,c(1:4)]
View(iris_dados)

#criando o cluster com os dados não normalizados

ckm<- kmeans(iris_dados,3)
str(ckm)

#visualizar o passo a passo  do cluster                   

install.packages("animation")
library(animation)


km <- kmeans.ani(iris_dados, 3)
km$centers
              
dados<-iris
dados<-data.frame(dados,km$cluster)
 table(km$cluster,dados$Species)

#criando o cluster com dados nornalizados
dados_norm<-scale(dados[,1:4])
dados_cluster<-kmeans(dados_norm,3)
dados<-data.frame(dados,dados_cluster$cluster)

table(dados_cluster$cluster,dados$Species)

plot(dados_cluster, data=dados)
