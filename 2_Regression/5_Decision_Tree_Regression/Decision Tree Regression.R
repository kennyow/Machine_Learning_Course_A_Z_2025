#Decision Tree Regression
#Regression Template

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


# Fitting the Decision Tree Regression to the dataset
#install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ Level, 
                  data = dataset,
                  control = rpart.control(minsplit = 1))

#Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))


#Visualising the Decision Tree Regression results (for higher resolution and smooother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             color = 'red') + 
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            color = 'blue') +
  ggtitle("Truth or Bluff (Decision Tree Regression)") +
  xlab('Level')+
  ylab('Salary')

