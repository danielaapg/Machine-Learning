#limpar a memoria do r
rm(list=ls(all=TRUE))

#ler arquivos

library(readr)
df_preco <- read_csv("R/R/dataset/house_price/kc_house_train_data.csv")
View(kc_house_train_data)


#explorando o dataset
dim(df_preco)
str(df_preco)
names(df_preco)


#analise exploratoria dos dados
summary(df_preco)


#explora��o gr�fica
plot (df_preco$sqft_living,df_preco$price)


#correla��o
correlacao<-cor(df_preco$sqft_living,df_preco$price, method = "pearson")
correlacao

#regress�o

rl<-lm(df_preco$price~df_preco$sqft_living, data=df_preco)
rl
summary(rl)


plot (df_preco$price~df_preco$sqft_living)
abline(rl, col="blue")
residuals(rl)
predict(rl)       
coefficients(rl)


#inserindo predi��o e residuos no dataframe
df_preco["predicao"]<- predict(rl)
df_preco["residuos"]<-residuals(rl)


#soma dos residuos 

residuos<-residuals(rl)
resquad<- (residuos^2)
resquad
rss<-sum(resquad)
rss


#predi��o para uma casa com 2650m2

sep_coef<-coefficients(rl)
alpha<-sep_coef[1:1]
beta<-sep_coef[2:2]


pred_valor<-alpha+(beta*2650)
pred_valor

