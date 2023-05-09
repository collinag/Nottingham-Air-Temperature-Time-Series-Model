library(ggplot2)
library(forecast)

# Load the nottem dataset
data(nottem)
ts_data <- ts(nottem, start = c(1920, 1), frequency = 12)


# Plot the original and differenced data
par(mfrow = c(2, 1))

# Time series plot of the original data with mean and trend line
ggplot() +
  geom_line(aes(x = time(ts_data), y = ts_data)) +
  geom_hline(yintercept = mean(ts_data), linetype = "dashed", color = "red") +
  geom_smooth(aes(x = time(ts_data), y = ts_data), method = "lm", se = FALSE) +
  xlab("Year") + ylab("Temperature") +
  ggtitle("nottem Data with Mean and Trend Line")


# ACF and PACF plots of the original data
ggtsdisplay(ts_data, main = "ACF and PACF Plots of nottem Data")

# Create the subplots by subinterval (Month)
monthplot(
  x = ts_data
)



library(forecast)

# Fit the best seasonal ARIMA model
fit <- auto.arima(ts_data, seasonal=TRUE)

modelfit <- arima(ts_data, order=c(1,0,2), seasonal=list(order=c(1,1,2), period=12))
summary(modelfit)

#Create 5 other models to compare
# Fit five seasonal ARIMA models using the arima function
model1 <- arima(ts_data, order=c(1,0,1), seasonal=list(order=c(0,0,0), period=12))
summary(model1)
model2 <- arima(ts_data, order=c(1,0,1), seasonal=list(order=c(0,0,1), period=12))
summary(model2)
model3 <- arima(ts_data, order=c(2,0,1), seasonal=list(order=c(0,0,2), period=12))
summary(model3)
model4 <- arima(ts_data, order=c(2,0,1), seasonal=list(order=c(0,0,0), period=12))
summary(model4)
model5 <- arima(ts_data, order=c(2,0,0), seasonal=list(order=c(0,0,0), period=12))
summary(model5)

checkresiduals(fit)
checkresiduals(model1)
checkresiduals(model2)
checkresiduals(model3)
checkresiduals(model4)
checkresiduals(model5)


# Generate forecasts for 24 periods into the future
forecast <- forecast(fit, h = 24)

# Plot original data with predicted values
autoplot(ts_data) +
  autolayer(forecast$mean, series = "Forecast") +
  xlab("Year") + ylab("Temperature") +
  ggtitle("nottem Data with 24 Period Forecast")






