# Time-Series-Analysis-Lab
# 1 “cow.dat” data
First we look at the time plot for the ‘cow.dat’ data. 

![cowplot](./img/cowplot.png)

<p align="center">
Fig 1 Time plot of ‘cow.dat’ data
</p>

The time plot has no abnormalities aside from the one high value and no evidence of
changing variance, so there is no need for data transformation.

## 1.1 Analysis of ACF and PACF

![cowcfplot](./img/cowcfplot.png)

<p align="center">
Fig 2.1 ACF and PACF of cow
</p>

From the ACF in Fig 2.1, we observe that the data seems to be stationary since the ACF
cutoffs at lag 7. We conduct the augmented Dickey-Fuller test to test for stationarity. 

![adf_cow](./img/adf_cow.png)

<p align="center">
Fig 2.2 Augmented Dickey-Fuller test for cow
</p>
  
From Fig 2.2, the p-value=0.04933 which is extremely close to the significance level of 0.05,
so it is difficult to reach any conclusions. Thus we perform differencing and take a look at the
ACF and PACF.

![cow1cfplot](./img/cow1cfplot.png)

<p align="center">
Fig 2.3 ACF and PACF of differenced cow
</p>

![cow1cfplot](./img/cow1cfplot.png)

<p align="center">
Fig 2.4 Augmented Dickey-Fuller test for differenced cow
</p>

From Fig 2.3, the ACF cuts off quickly after lag 1 which implies that the data is now
stationary. This is further confirmed by Fig 2.4 where the Augmented Dickey-Fuller test
returns a p-value smaller than the significance level of 0.05. This suggests using a
differencing of 1 for the ARIMA model.

## 1.2 Parameter Estimation
From Fig 2.3, the ACF cut off after lag 1 suggests ARIMA(0,1,1) model and the PACF cut
off after lag 6 suggests ARIMA(6,1,0) model. Next we use the auto.arima function in R with
a differencing of 1 to decide between the two.

![arima_cow](./img/arima_cow.png)

<p align="center">
Fig 3.1 Best fitted ARIMA model with differencing of 1
</p>
  
From Fig 3.1, we obtain ARIMA(0,1,1) which confirms our theory so we pick ARIMA(0,1,1)
as our fitted model.

## 1.3 Diagnostic Checking
We perform diagnostic checking of the fitted model by analysing the residuals from the fit for
any signs of non–randomness using the tsdiag function in R and checking for autocorrelation
among the residuals using the Box.plot function.

![cowdiagnostic](./img/cowdiagnostic.png)

<p align="center">
Fig 3.2 Output from tsdiag
</p>

![box_test_cow](./img/box_test_cow.png)

<p align="center">
Fig 3.3 Output from Box.test
</p>

From Fig 3.2, the standardised residuals seem random and the ACF of residuals and the p-
value of Ljung-Box statistic are within acceptable range. The p-value from the Box-Pierce
test is more than 0.05, so the residuals are not autocorrelated. Thus the ARIMA(0,1,1) model
is adequate.

## 1.4 Prediction of ARIMA model
We do prediction for the next 5 time steps and plot the results with an approximate
confidence interval (95%) of the prediction using “prediction ± 2 × SE”. The confidence
bands are drawn as a red, dotted line. The plot is shown below in Fig 3.4.

![cowpred](./img/cowpred.png)

<p align="center">
Fig 3.4 cow plot and predicted values
</p>

# 2 “wwwusage.txt” data
First, we observe the time plot for the data.

![xplot](./img/xplot.png)

<p align="center">
Fig 4 Time plot of “wwwusage.txt” data
</p>

From Fig 4, we observe that the data is clearly not stationary as the time series wanders up and down for long periods of time. The time plot has no evidence of changing variance, so there is no need for data transformation.

## 2.1 Analysis of ACF and PACF

![xcfplot](./img/xcfplot.png)

<p align="center">
Fig 5.1 ACF and PACF of x
</p>

From Fig 5.1, the ACF further support the conclusion that the data is nonstationary as it cuts off slowly. Hence we perform differencing to make the data stationary.

![x1cfplot](./img/x1cfplot.png)

<p align="center">
Fig 5.2 ACF and PACF of differenced x
</p>

From the slow cut off of the ACF in Fig 5.2, we can conclude that the data is still nonstationary, so we perform differencing again.

<p align="center">
Fig 5.3 ACF and PACF of twice differenced x
</p>

From Fig 5.3 the ACF cuts off quickly after lag 3 which means that the data is now stationary. We perform the augmented Dickey-Fuller test to confirm. 

![adf_x2](./img/adf_x2.png)

<p align="center">
Fig 6.1 Augmented Dickey-Fuller test
</p>

## 2.2 Parameter Estimation
From Fig 5.3, the ACF cut off after lag 3 suggests ARIMA(0,2,3) model and the PACF cut off after lag 2 suggests ARIMA(2,2,0) model. We construct both ARIMA models for comparison.

![arima_x1](./img/arima_x1.png)

<p align="center">
Fig 6.2 ARIMA(0,2,3) model
</p>

![arima_x2](./img/arima_x2.png)

<p align="center">
Fig 6.3 ARIMA(2,2,0) model
</p>

By comparing the aic values from Fig 6.2 and Fig 6.3, we observe that the ARIMA(2,2,0) model has a lower aic value of 511.46. Thus we choose ARIMA(2,2,0) as the fitted model.

## 2.3 Diagnostic Checking
Finally, we perform diagnostic checking of the fitted model by analysing the residuals from the fit for any signs of non–randomness using the tsdiag function in R and checking for autocorrelation among the residuals using the Box.plot function. 

![xdiagnostic](./img/xdiagnostic.png)

<p align="center">
Fig 6.4 Output from tsdiag
</p>

![box_plot_x](./img/box_plot_x.png)

<p align="center">
Fig 6.5 Output from Box.test
</p>

From Fig 6.3, the standardised residuals seem random and the ACF of residuals and the p-value of Ljung-Box statistic are within acceptable range. The p-value from the Box-Pierce test is more than 0.05, so the residuals are not autocorrelated. Thus the ARIMA(2,2,0) model is adequate.

## 2.4 Prediction of ARIMA model 
Using this model, we do prediction for the next 5 time steps and plot the results with an approximate confidence interval (95%) of the prediction using “prediction ± 2 × SE”. The confidence bands are drawn as a red, dotted line. The plot is shown below in Fig 6.6.

![xpred](./img/xpred.png)

<p align="center">
Fig 6.6 x plot and predicted values
</p>
