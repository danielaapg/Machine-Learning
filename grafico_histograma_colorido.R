data("VADeaths")
View(VADeaths)

?VADeaths

head(VADeaths)
par(mfrow=c(1,1))
#col=heat.colors(7)o numero sete indica depois de sete vezes a
#a primeira cor vai voltar a aparecer
hist(VADeaths, col=heat.colors(7), main="col=heat.colors(7)")
hist(VADeaths, col=heat.colors(8), main="col=heat.colors(7)")

hist(VADeaths, col=terrain.colors(7), main="col=terrain.colors(7)")
hist(VADeaths, col=topo.colors(7), main="col=topo.colors(7)")
hist(VADeaths, col=cm.colors(7), main="col=cm.colors(7)")
hist(VADeaths, col=rainbow.colors(7), main="rainbow=heat.colors(7)")

install.packages("RColorBrewer")
library(RColorBrewer)
par(mfrow=c(2,3))#linhas e columas -faz os graficos aparecerem lado a lado  em duas linhas 3 columas
hist(VADeaths, col=brewer.pal(3,"Set3"), main="set 3 3colors")
hist(VADeaths, col=brewer.pal(3,"Set2"), main="set 2 3colors")
hist(VADeaths, col=brewer.pal(3,"Set1"), main="set 1 3colors")
hist(VADeaths, col=brewer.pal(8,"Set3"), main="set 3 8colors")
hist(VADeaths, col=brewer.pal(8,"Greys"), main="Grey 8 colors")
hist(VADeaths, col=brewer.pal(8,"Greens"), main="Green 8 colors")

