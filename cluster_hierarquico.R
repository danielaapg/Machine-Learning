#cluster hierarquico

#ler o arquivo

library(readxl)
University_Clustering <- read_excel("~/Linguagem R/dataset/University-Clustering-data/University_Clustering.xlsx")
 View(University_Clustering)

#selecioando as columas que serão utilizadas
 
dados<-University_Clustering[1:25,c(1,3:8)] 
dados

#normalizando os dados

dados_nor<-scale(dados[,2:7])#foi excluido a 1 columa porque os dados são categoricos

#criando a matriz de distancia

mdist<-dist(dados_nor,method="euclidean")
mdis
mdist


fit<-hclust(mdist,method="complete")
fit
?hclust

#analisando o dendograma
plot(fit)

plot(fit,hang=-1)

#co
groups<-cutree(fit,k=5)
?cutree

#colocando retangulo nos clusters
rect.hclust(fit,k=5,border="red")
?rect.hclust

#criando a matriz que mostra qual observação pertence a qual cluster
membership<-as.matrix(groups)

#adicioando a columa que mostra qual cluster pertence cada observação

final<-data.frame(dados,membership)
final1<-final[,c(ncol(final),1:(ncol(final)-1))]
View(final1)

# criando o arquivo com o dataframe final.
#library(xlsx)
#write.xlsx(final1,file="final1.xlsx")
