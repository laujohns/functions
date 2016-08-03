#create dataset
n <- 30
df <- data.frame(cbind(var1 = seq (1:n), 
                 var2 = sample(35:100, n, rep=T),
                 var3 = seq(2, 55, length.out=n)))

#function to calculate statistics and concatenate appropriately for display in table
geo<-function(x){
  geomean.x<-exp(mean(log(x[which(!is.na(x))])))
  geosd.x<-exp(sd(log(x[which(!is.na(x))])))
  #all.x<-c(geomean.x, geosd.x)
  all.x<-paste(formatC(round(geomean.x,2), format='f', digits=2)," ", "(",formatC(round(geosd.x,2), format="f", digits=2),")", sep="")
  return(all.x)
}

#create table of statistics in csv file
table<-rbind(geo(df$var1),geo(df$var2), geo(df$var3))
rownames(table)<-c("Variable 1",'Variable 2','Variable 3')
colnames(table)<-c("GM(GSD)")
write.csv(table,file="table.csv")
