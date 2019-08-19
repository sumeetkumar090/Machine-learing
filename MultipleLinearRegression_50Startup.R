# Sumeet Kumar
library(caTools)
library(ggplot2)

setwd("D:/Machine Learning/P14-Machine-Learning-AZ-Template-Folder/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 5 - Multiple Linear Regression/")

dataset = read.csv('50_Startups.csv')


dataset$State = factor(dataset$State, 
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3)
                       )

#train test split
set.seed(123)

split = sample.split(dataset$Profit, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#fit Multiple Linear regression line
#regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State)
regressor = lm(formula = Profit ~ .,
               training_set
               )

#Predicting the test set results

y_pred = predict(regressor, newdata = test_set)
#y_pred

#Building backward elimination
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = dataset
               )
summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
               data = dataset
)
summary(regressor)




regressor = lm(formula = Profit ~ R.D.Spend + Marketing.Spend,
               data = dataset
)
summary(regressor)


regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset
)
summary(regressor)






