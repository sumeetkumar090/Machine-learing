# Sumeet Kumar
library(caTools)
library(ggplot2)


setwd("D:/Machine Learning/P14-Machine-Learning-AZ-Template-Folder/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 4 - Simple Linear Regression/")


dataset = read.csv('Salary_Data.csv')

#dataset = dataset[, 2:3]


#train test split

set.seed(123)

split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#fit Linear regression line
regressor = lm(formula = Salary ~ YearsExperience, data = training_set)

#Prediction
y_pred = predict(regressor, newdata = test_set)

#visualize the graph for training set
ggplot() + 
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            color = 'blue') +
  ggtitle('Salary Vs Experience (Training Set)') + 
  xlab('Years of Experience') + 
  ylab('Salary')


#visualize the graph for test set
ggplot() + 
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)), 
            color = 'blue') +
  ggtitle('Salary Vs Experience (Test Set)') + 
  xlab('Years of Experience') + 
  ylab('Salary')








