#Analisando os dados do ENEM 2016 
#dataset obtido em:http://portal.inep.gov.br/microdados

library(readr)
enem_2016<- read.csv2("~/R/R/dataset/enem_2016.csv", sep =  ";")


#explorando o dataset

#verificar a quantidade de linhas e colunas
dim(enem_2016)


#verificar o nome das variaveis
names(enem_2016)


#verificar a estrutura de dos dados 
str(enem_2016)

#verificar se há valores em branco
sapply(enem_2016,function(x) sum(is.na(x)))

#converter dados em branco
enem_2016[enem_2016==" "]<- NA


#removendo dados em branco 
enem_sem_branco<-na.omit(enem_2016)
sapply(enem_sem_branco,function(x) sum(is.na(x)))

#--------------------------------------------------------------------------------------------------------
#Medidas de tendência Central
summary(enem_2016)

mean(enem_2016$NU_IDADE)
#median(enem_2016$NU_IDADE)


#moda
subset(table(enem_2016$NU_IDADE), table(enem_2016$NU_IDADE) == max(table(enem_2016$NU_IDADE)))
#primeiro valor apresentado é a moda e o segundo é quantidade de vezes que aparece esse resultado
#--------------------------------------------------------------------------------------------------------


#--------------------------------------------------------------------------------------------------------
#Medidas de Dispersão

#Variancia
var(enem_2016$NU_IDADE)

#Desvio Padrão
sd(enem_2016$NU_IDADE)

min(enem_2016$NU_IDADE)
max(enem_2016$NU_IDADE)
#range(enem_2016$NU_IDADE)
hist(enem_2016$NU_IDADE)

#--------------------------------------------------------------------------------------------------------

#-------------------------------------------------------------------------------------------------------
# Identificar outLier
boxplot(enem_2016$NU_IDADE)

#--------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------------------------------------------

#Remover outlier
data_outliers<-subset(enem_2016,enem_2016$NU_IDADE>30)
dat_sem_outlier<-subset(enem_2016,enem_2016$NU_IDADE<=30)
dim(dat_sem_outlier)

boxplot(dat_sem_outlier$NU_IDADE)
#--------------------------------------------------------------------------------------------------------


hist(dat_sem_outlier$NU_IDADE, breaks = 50)


#Verificar a  quantidade de presentes, ausentes e eliminados  na prova objetiva de matematica

#variavel tp_presença é numerica com 3 level
table(enem_2016$TP_PRESENCA_MT)


mean(dat_sem_outlier$NU_IDADE)

# 

table(enem_2016$TP_PRESENCA_LC)
tp_presenca_lc<-table(enem_2016$TP_PRESENCA_LC)
barplot(tp_presenca_lc)

names(tp_presenca_lc)  <-c("Ausentes", "Presentes", "Eliminados")            
tp_presenca_lc
barplot(tp_presenca_lc)

taxaPresenca_lc<-tp_presenca_lc/length(enem_2016$TP_PRESENCA_LC)
taxaPresenca_lc

#transformar fatores em numerico
dados<-as.numeric(gsub(",", ".", as.character(enem_2016$NU_IDADE)))

#verificar a quantidade de participantes por sexo
participantes_por_sexo<-table(enem_2016$TP_SEXO)

barplot(participantes_por_sexo, ylab="Quantidade de participantes",xlab = "Sexo", col = c("pink","blue"))

#verificara quantidade de participantes nacionalidade
nacionalidade<-table(enem_2016$TP_NACIONALIDADE)
nacionalidade

names(nacionalidade)  <-c("Não Informado", "Brasileiro(a)","Brasileiro_Naturalizado(a)","Estrangeiro(a)", "Brasileiro Nato(a)")            
nacionalidade

barplot(nacionalidade, ylab="Quantidade de participantes",xlab = "Nacionalidade", col = rainbow(2))


#verificar o ano de consclusão do ensino médio dos participantes

ano_conclusao<-table(enem_2016$TP_ANO_CONCLUIU)
names(ano_conclusao)<-c('Não informado', '2015', '2014','2013','2012','2011','2010','2009','2008','2007','< 2007')
ano_conclusao

barplot(ano_conclusao, ylab="Quantidade de participantes",xlab = "Ano de Consclusão Ensino Médio", col = rainbow(12))


#verificar qtade de treineiros

treineiros<-table(enem_2016$IN_TREINEIRO)
names(treineiros)<- c('Não Treineiros ', 'Treineiros')
treineiros
barplot(treineiros, ylab = "Quantidade de Participantes", col = rainbow(2))


