iluminapublic <- read_csv("~/iluminapublic.csv")
View(iluminapublic)

#soma a qtade de postes de iluninação por local
qtd_ilumi<-aggregate(cbind(count = iluminapublic$LAT) ~ iluminapublic$LOCAL, 
data = iluminapublic, FUN = function(x){NROW(x)})
teste<-aggregate(iluminapublic$LAT~iluminapublic$LOCAL, data=iluminapublic, sum)



furto_cel_bairro<-aggregate(cbind(count = furto_celsp$LATITUDE) ~ furto_celsp$BAIRRO, 
                     data = furto_celsp, FUN = function(x){NROW(x)})




