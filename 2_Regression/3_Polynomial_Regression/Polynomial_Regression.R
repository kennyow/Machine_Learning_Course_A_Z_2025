# Data processing

#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3] #columns to keep for the training model

################################################################
#NO TRAINING SET OR TEST SET WILL BE CREATED OR FEATURE SCALING
################################################################
#Splitting the dataset into the Training set and Test set


#install.packages('caTools')
# library(caTools)
# 
# set.seed(123) #python is for test set, here is for training set
# split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

#Future Scaling (Euclidian distance)

# training_set[, 2:3] = scale(training_set[, 2:3]) #all lines and columns 2 and 3
# test_set[, 2:3] = scale(test_set[, 2:3])

##########################################################################

# Fitting Linear Regression to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

# Fitting Polynomial Regression to the dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

#Visualising the Linear Regresison results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(lin_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle("Truth or Bluff (Linear Regression)") +
  xlab('Level')+
  ylab('Salary')

#Visualising the Polynomial Regresison results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') + 
  geom_line(aes(x = dataset$Level, y = predict(poly_reg, newdata = dataset)),
            color = 'blue') +
  ggtitle("Truth or Bluff (Polynomial Regression)") +
  xlab('Level')+
  ylab('Salary')

#Predicting a new result with Linear Regression ( a single level prediction- 6.5)
y_pred = predict(lin_reg, data.frame(Level = 6.5))

#Predicting a new result with Polynomial Regression
y_pred = predict(poly_reg, data.frame(Level = 6.5,
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))

