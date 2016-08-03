---
output: html_document
---
# An example of a function for distribution statistics
## Function for geometric mean and geometric standard deviation

1. **First create a test dataset**

```{r} 
    n <- 30
    df <- data.frame(var1 = seq (1:n), 
                 var2 = sample(35:100, n, rep=T),
                 var3 = seq(2, 55, length.out=n))
```

2. **Next create a function that calculates the geometric mean and standard deviation**

  * In the below example, the "paste" function concatenates the geometric mean and standard deviations by adding parenthases around the standard deviation (e.g., GM(GSD))
  * The formatC function keeps 2 digits after the rounded statistics (use this if you want the trailing 0 in rounded numbers)

```{r} 
geo<-function(x){
      geomean.x<-exp(mean(log(x[which(!is.na(x))])))
      geosd.x<-exp(sd(log(x[which(!is.na(x))])))
      all.x<-paste(formatC(round(geomean.x,2), format='f', digits=2)," ", "(",formatC(round(geosd.x,2),
             format="f", digits=2),")", sep="")
      return(all.x)
}
```

3. **Create a table of these statistics and save as a CSV file**

```{r} 
table<-rbind(geo(df$var1),geo(df$var2), geo(df$var3))
rownames(table)<-c("Variable 1",'Variable 2','Variable 3')
colnames(table)<-c("GM(GSD)")
write.csv(table, file="table.csv", quote=FALSE) 
x = read.csv("table.csv")
```
## **Final Product**

```{r echo=TRUE}
kable(table, format="markdown", align="c")
```
