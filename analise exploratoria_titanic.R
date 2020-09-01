#instalar o pacote titanic
library(titanic)

#explorar o data set
dtitanic<-titanic_train


#verificar o número d linhas e colunas

dim(dtitanic)#linhas/columas
#891  12

#verificar o nome das variaveis

names(dtitanic)
#[1] "PassengerId" "Survived"    "Pclass"      "Name"       
#[5] "Sex"         "Age"         "SibSp"       "Parch"      
#[9] "Ticket"      "Fare"        "Cabin"       "Embarked"


#verificar se há valores em branco

sapply(dtitanic,function(x) sum(is.na(x)))


#PassengerId    Survived      Pclass        Name         Sex 
#0           0           0           0           0 
#Age       SibSp       Parch      Ticket        Fare 
#177           0           0           0           0 
#Cabin    Embarked 
#0           0

#ou podemos usar para verificar os dados em branco 

colSums(is.na(dtitanic))#vai mostrar a mesma saída que o caomando anterior


#converter dados em branco

 dtitanic[dtitanic ==" "]<- NA
 
 #verificar os valores unicos 
 sapply(dtitanic,function(x) length(unique(x)))
 

 #Calcular a taxa de sobreviventes
 
 sobreviventes<-sum(dtitanic$Survived==1)/length(dtitanic$Survived)
 sobreviventes #0.3838384
 
 #Calcular  a taxa de sobreviventes homens

homens_sobreviventes<- sum((dtitanic$Survived==1)&(dtitanic$Sex=="male"))/length(dtitanic$Sex=="male")
homens_sobreviventes  # 0.1223345

#Calcular a taxa de sobreviventes mulheres
mulheres_sobreviventes<- sum((dtitanic$Survived==1)&(dtitanic$Sex=="female"))/length(dtitanic$Sex=="female")
mulheres_sobreviventes #0.2615039

#Calcular a taxa de sobreviventes por classe

primeira_classe<-sum((dtitanic$Survived==1)&(dtitanic$Pclass==1))/sum(dtitanic$Pclass==1)
primeira_classe # 0.6296296

segunda_classe<-sum((dtitanic$Survived==1)&(dtitanic$Pclass==2))/sum(dtitanic$Pclass==2)
segunda_classe #0.4728261

terceira_classe<-sum((dtitanic$Survived==1)&(dtitanic$Pclass==3))/sum(dtitanic$Pclass==3)
terceira_classe # 0.2423625

#outra forma de calcular as taxas

tdtitanic<-na.omit(subset(dtitanic,select=c(2,3,5))) #selecionar a quantidade de sobreviventes, a classe e o sexo dos passageiros
table(tdtitanic) 

prop.table(table(tdtitanic$Survived))
prop.table(table(tdtitanic$Sex))
prop.table(table(tdtitanic$Pclass))


#selecionar as colunas que serão usadas na regresão logistica
RL_dtitanic<-subset(dtitanic, select=(2,3,5,6,7,8,10,12))
