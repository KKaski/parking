library(ibmdbR)
#library(plotly)
mycon <- idaConnect("BLUDB", "", "")
idaInit(mycon)

spaces <- as.data.frame(ida.data.frame('"DASH100925"."PLUGITCHARGERS"')[ ,c('DATE', 'DATEFULL', 'DAY', 'HOURS', 'MONTH', 'P10', 'P3', 'P5', '_ID', '_REV')])

names(spaces)
head(spaces)

#Do the graphics instead of pdf files which is default
#jpeg(type='cairo', file = "graph.jpg",width=650, height=600)
#sink('/dev/null') 

#Lets plot some histograms to see the data
hist(as.numeric(spaces$P3),col=rainbow(7))
hist(as.numeric(spaces$P5),col=rainbow(7))
hist(as.numeric(spaces$P10),col=rainbow(7))

#Now some experimenting with the days
plot(spaces$DAY,spaces$P3,main="Free spaces/day P3", xlab="Weekday", ylab="Free Spaces", pch=19)
plot(spaces$DAY,spaces$P5,main="Free spaces/day P5", xlab="Weekday", ylab="Free Spaces", pch=19)
plot(spaces$DAY,spaces$P10,main="Free spaces/day P10", xlab="Weekday", ylab="Free Spaces", pch=19)

#P10 Seem interesting so lets get some zoom in by using hours
plot(spaces$HOUR,spaces$P10,main="Free spaces/hour P10", xlab="Hour of day", ylab="Free Spaces P10", pch=19)

#Lets filter to days 1 and 2
spacesday1 <- spaces[spaces[, "DAY"]==1, ]
plot(spacesday1$HOUR,spacesday1$P10,main="Free spaces Day1 /hour P10", xlab="Hour of day", ylab="Free Spaces P10", pch=19)

spacesday2 <- spaces[spaces[, "DAY"]==2, ]
plot(spacesday2$HOUR,spacesday2$P10,main="Free spaces Day2 /hour P10", xlab="Hour of day", ylab="Free Spaces P10", pch=19)

#Housekeeping
#dev.off() 
#sink() 
close(mycon)
