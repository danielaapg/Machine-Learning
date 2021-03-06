#coursera ML-Regress�o semana 1 Teste

#limpar a memoria do r
rm(list=ls(all=TRUE))

#ler arquivos

test_data <- read.csv("~/R/dataset/house_price/kc_house_test_data.csv",sep=",", header =  TRUE)
train_data <- read.csv("~/R/dataset/house_price/kc_house_train_data.csv", sep=",", header=TRUE)



#explorando o dataset
dim(train_data)
str(train_data)
names(train_data)

#analise exploratoria dos dados

summary(train_data)

#explora��o grafica

plot (train_data$sqft_living,train_data$price)

#correla��o
correlacao<-cor(train_data$sqft_living,train_data$price, method = "pearson")
correlacao
#correla��o forte e positiva

matcor <- 
matcor

#regress�o

rl<-lm(train_data$price~train_data$sqft_living, data=train_data)
rl
summary(rl)

plot (train_data$price~train_data$sqft_living)
abline(rl, col="blue")
residuals(rl)
predict(rl)       
coefficients(rl)

teste<-coefficients(rl)
inter<-teste[1:1]
inter
slope<-teste[2:2]
slope


#predi��o para uma casa com 2650m2

pred<-inter+(slope*2650)
pred


#soma dos residuos trainset

residuos<-residuals(rl)
resquad<- (residuos^2)
resquad
rss<-sum(resquad)
rss


#RSS testset
rlt<-lm(test_data$price~test_data$sqft_living)
rlt
summary(rlt)


#soma dos residuos testset

residuos<-residuals(rlt)
resquad<- (residuos^2)
resquad
rss<-sum(resquad)
rss
