# Nottingham-Air-Temperature-Time-Series-Model
In this project, I will be exploring the nottem dataset in R and will create time series models based on this data. The nottem dataset contains the average air temperatures in Nottingham, England from 1920 to 1939, recorded monthly.
# Time Series Model

![image](https://user-images.githubusercontent.com/50085554/236972865-5536726e-6773-4f4b-968e-5eb670299ae5.png)

Here is a plot of the time series data, with the red dashed line being the mean of the data, and the blue line being a trend line of the regressed observed values on time. This data is stationary and therefore does not require any manual differencing to start. This data also has constant mean and variance.

![image](https://user-images.githubusercontent.com/50085554/236972955-3be74f56-7eec-4b25-b527-0c1eac6237c2.png)

The plot above shows the ACF and PACF of our data, the ACF plot shows a significant autocorrelation at lag 6 and 12, which indicates a seasonal pattern.

The below plot showcases the data for the seasonal period of a year in the horizontal axis, with the temperature on the vertical axis. As you can see, the data continues to trend up till halfway through the year and then back down for the other half, this would make sense with seasonal weather patterns. There is much more variability during the summer months which is interesting to note.

![image](https://user-images.githubusercontent.com/50085554/236973096-b2f58388-3009-4d14-892e-0d9f9a8cbd03.png)

Now, I will begin by using the auto.arima() function to find the best seasonal autoregressive integrated model of the form SARIMA(p, d, q)(P, D, Q)m. From the auto.arima() function, the below model is created.

![image](https://user-images.githubusercontent.com/50085554/236973167-23a6f11e-869d-4d21-9cc8-b43251ef84d1.png)

Next, I will create five more models and see how they compare and if the above model is the best model.

![image](https://user-images.githubusercontent.com/50085554/236973256-49613895-a5a1-46c6-b825-c272cd1d5a72.png)

![image](https://user-images.githubusercontent.com/50085554/236973273-d025997e-82c0-4ca2-b091-7ba85f7d65a8.png)

![image](https://user-images.githubusercontent.com/50085554/236973285-c88d44b1-589c-4a8f-9c8f-2316d4af3ef8.png)

![image](https://user-images.githubusercontent.com/50085554/236973298-b0e7015c-5c8c-4e7c-94d5-09076f63d4a9.png)

![image](https://user-images.githubusercontent.com/50085554/236973314-b634b8a1-9d0a-4b59-a5d2-5549f57caed1.png)

The below table shows how each model performed.

![image](https://user-images.githubusercontent.com/50085554/236973638-1649351d-a6b7-41f4-b2d4-4281ba9121c0.png)

Based on the model selection process, I have select the model determined best fit, seasonal ARIMA (1, 0, 2)(1, 1, 2)[12] as the final model for the nottem dataset. This model has the lowest AIC value among the models we fitted and also has a much lower root-mean-squared-error (RMSE) value. Additionally, the residuals of the model appear to be normally distributed with no significant patterns in their ACF and PACF plots. Overall, the model seems to fit the data well and is a good balance between complexity and performance.

Now, I will proceed with predicting future values of the nottem data using the final model.

![image](https://user-images.githubusercontent.com/50085554/236973511-7c078383-d956-4e9f-a0f5-1f5a1de485de.png)

From the plot above you can see that the model performed quite well in that the trend seen is continued with the additional 24 subinterval (months) or two years forecasted. Based on my assessment of model quality, the seasonal ARIMA model (SARIMA (1, 0, 2)(1, 1, 2)[12]) selected seems to fit the data reasonably well. The residuals of the model are not significantly autocorrelated, and their ACF and PACF plots do not show any significant patterns. The model also has reasonably low RMSE and AIC values. 
