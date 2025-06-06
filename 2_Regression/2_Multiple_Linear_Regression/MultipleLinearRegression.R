# Data processing

#Importing the dataset
dataset = read.csv('50_Startups.csv')
#dataset = dataset[, 2:3]

#Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))



#Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)

set.seed(123) #python is for test set, here is for training set
split = sample.split(dataset$Profit, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Feature Scaling (Euclidian distance)

# training_set[, 2:3] = scale(training_set[, 2:3]) #all lines and columns 2 and 3
# test_set[, 2:3] = scale(test_set[, 2:3])

#Fitting Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
               data = training_set) #could be changed by a dot

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

#Buildind the optimal model using Backward Elimination (remove the non statistic significant variable
regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset)

summary(regressor)

# backwardElimination <- function(x, sl) {
#   numVars = length(x)
#   for (i in c(1:numVars)){
#     regressor = lm(formula = Profit ~ ., data = x)
#     maxVar = max(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"])
#     if (maxVar > sl){
#       j = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxVar)
#       x = x[, -j]
#     }
#     numVars = numVars - 1
#   }
#   return(summary(regressor))
# }
# 
# SL = 0.05
# dataset = dataset[, c(1,2,3,4,5)]
# backwardElimination(training_set, SL)