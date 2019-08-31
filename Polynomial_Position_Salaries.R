# Polynomial Regression Model
# install.packages('caTools')
library(caTools)
library(ggplot2)

# Importing the dataset
dataset = read.csv('D:/Machine Learning/P14-Machine-Learning-AZ-Template-Folder/Machine Learning A-Z Template Folder/Part 2 - Regression/Section 6 - Polynomial Regression/Position_Salaries.csv')

dataset = dataset[2:3]

#Fitting linear regresion to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

#Polynomial
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ ., 
              data = dataset)




#Visulize the data - Linear
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
        geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
                  color = 'blue') +
        ggtitle('Truth or Bluff(Linear Regression)') +
        xlab('Levels') +
        ylab('Salary')


#Visulize the data - Polynomial
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle('Truth or Bluff(Polynomial Regression)') +
  xlab('Levels') +
  ylab('Salary')


#Predict new result with LR
y_pred = predict(lin_reg, data.frame(Level = 6.5))

#Predict new result with PR
y_pred = predict(poly_reg, data.frame(Level = 6.5, 
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))

