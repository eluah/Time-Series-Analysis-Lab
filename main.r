library(tseries)
library(forecast)
#'cow.dat'data
data<-read.table('cow.dat')
cow<-as.ts(data)
autoplot(cow)
par(mfrow=c(1,2))
acf(cow,main='cow')
pacf(cow)
adf.test(cow)
cow1<-diff(cow)
acf(cow1,main='cow1')
pacf(cow1)
adf.test(cow1)
auto.arima(cow,d=0,approximation=F,max.p=5, max.q=5)
auto.arima(cow,d=1,approximation=F,max.p=5, max.q=5)
fit1<-arima(cow,order=c(0,1,1))
tsdiag(fit1)
Box.test(fit1$residuals,lag=1)
par(mfrow=c(1,1))
plot(cow,xlim=c(0,80),ylim=c(20,100),ylab='cow')
cow.pred<-predict(fit1,n.ahead=5)
lines(cow.pred$pred,col="red")
lines(cow.pred$pred+2*cow.pred$se,col="red",lty=3)
lines(cow.pred$pred-2*cow.pred$se,col="red",lty=3)

#'wwwusage.txt' data
data1<-read.table('wwwusage.txt',header=T)
x<-as.ts(data1)
autoplot(x)
par(mfrow=c(1,2))
acf(x)
pacf(x)
x1<-diff(x)
acf(x1,main='x1')
pacf(x1)
x2<-diff(x1)
acf(x2,main='x2')
pacf(x2)
adf.test(x2)
auto.arima(x,d=2,approximation = F,max.p=5, max.q=5)
fit2<-arima(x,order=c(0,2,3))
fit2
fit3<-arima(x,order=c(2,2,0))
fit3
tsdiag(fit3)
Box.test(fit3$residuals,lag=1)
par(mfrow=c(1,1))
plot(x,xlim=c(0,105),ylim=c(80,280),ylab='x')
x.pred<-predict(fit3,n.ahead=5)
lines(x.pred$pred,col="red")
lines(x.pred$pred+2*x.pred$se,col="red",lty=3)
lines(x.pred$pred-2*x.pred$se,col="red",lty=3)
