#Random Forest Regression

# Data processing

#Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3] 


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


# Fitting the Random Forest Regression to the dataset
#install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1], 
                         y = dataset$Salary,
                         ntree = 500)


#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))


#Visualising the Random Forest Regression results (for higher resolution and smooother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle("Truth or Bluff (Random Forest Regression)") +
  xlab('Level')+
  ylab('Salary')



