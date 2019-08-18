# Sumeet Kumar
setwd("D:/Machine Learning/P14-Machine-Learning-AZ-Template-Folder/Machine Learning A-Z Template Folder/Part 1 - Data Preprocessing/Section 2 -------------------- Part 1 - Data Preprocessing --------------------")

dataset = read.csv('Data.csv')

dataset = dataset[, 2:3]

dataset$Age = ifelse(is.na(dataset$Age),
                    ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                   dataset$Age)

dataset$Salary = ifelse(is.na(dataset$Salary),
                    ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                   dataset$Salary)



#Encoding the categorical 
dataset$Country = factor(dataset$Country, levels = c('France', 'Spain', 'Germany'),
                        labels = c(1, 2, 3))


#Encoding the categorical 
dataset$Purchased = factor(dataset$Purchased, levels = c('No', 'Yes'),
                        labels = c(0, 1))

#train test split
library(caTools)
set.seed(123)

split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)


#feature scaling
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])




