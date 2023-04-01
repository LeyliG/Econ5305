#Upload the data,

library(readxl)
data1<- read_excel("MONEYDEM.xls")

tb3m<-ts(data1$TB3mo,frequency=4, start=c(1959,3)) 
plot(tb3m,col='red')
par(new=TRUE)
tb1y<-ts(data1$TB1yr,frequency=4, start=c(1959,3)) 
plot(tb1y,col='blue')

model1<-lm(data1$TB1yr~data1$TB3mo)
summary(model1)

#test statistics
(0.916-1)/0.01

plot(model1)


# Breusch–Pagan test 
library(lmtest)
bptest(model1)



#  In the coeftest() function, the vcovHC() function 
#  from the sandwich package is used to estimate the 
#  robust covariance matrix of the coefficient 
# estimates. The type = "HC" argument specifies the 
# type of robust standard errors to be used, which in 
# this case is the HC3 estimator.

library("sandwich")
coeftest(model1, vcov=vcovHC(model1, type = "HC0"))

data1$Indicator<-ifelse(data1$TB3mo > 10,1,0)
model2<-lm(data1$TB1yr~data1$TB3mo + data1$Indicator)
summary(model2)
                          
