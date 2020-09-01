# Objetivo: foi relizar uma análise estatistica  usando 
#regressão logistica para verificar se os anos   de exposição
#contribuiem para o numero de casos de pneumocomioses severes

#criando o dataframe
anos_exposicao<-c(5.8,15.0,21.5,27.5,33.5,39.5,46.0,51.5)
num_casos<-c(0,1,3,8,9,8,10,5)
num_miner<-c(98,54,43,48,51,38,28,11)
pneumoconioses<-data.frame(anos_exposicao,num_casos,num_miner)



attach(pneumoconioses)

#regressão logisitica

cw<-cbind(num_casos, num_miner- num_casos )
cw
logcase<- glm(cw~anos_exposicao, family = binomial)
summary(logcase)



#Call:
 # glm(formula = cw ~ anos_exposicao, family = binomial)

#Deviance Residuals: 
#  Min       1Q   Median       3Q      Max  
#-1.6625  -0.5746  -0.2802   0.3237   1.4852  

#Coefficients:
#  Estimate Std. Error z value Pr(>|z|)    
#(Intercept)    -4.79648    0.56859  -8.436  < 2e-16 ***
#  anos_exposicao  0.09346    0.01543   6.059 1.37e-09 ***
  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

#(Dispersion parameter for binomial family taken to be 1)

#Null deviance: 56.9028  on 7  degrees of freedom
#Residual deviance:  6.0508  on 6  degrees of freedom
#AIC: 32.877

#os anos de exposição é significante apara o modelo pois o
# resultado de  Pr(>|z|) = 1.37e-09 é menor que 0,05
  


qchisq(0.95,6) #porcentagem 95%, 6 graus de liberdade obtidos do comando summary (nome domodelodereglogistica) residual deviance
qchisq()
#12.59159
exp(0.09346)#0.09346 obtidos dos anos de exposição
#1.097967

exp(coef(logcase))
(1.09767-1)*100
#9.767
#O modelo indica que para cada ano de exposição eu tenho probabiliade 9,77% de ter pneumoconioses

plot(anos_exposicao,fitted.values(logcase))+points (anos_exposicao,num_casos/num_miner, col="red")

