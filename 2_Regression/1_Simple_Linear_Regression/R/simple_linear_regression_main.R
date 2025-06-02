# Data processing

#Importing the dataset
dataset = read.csv('Salary_Data.csv')
#dataset = dataset[, 2:3]


#Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)

set.seed(123) #python is for test set, here is for training set
split = sample.split(dataset$Salary, SplitRatio = 2/3)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Future Scaling (Euclidian distance)

# training_set[, 2:3] = scale(training_set[, 2:3]) #all lines and columns 2 and 3
# test_set[, 2:3] = scale(test_set[, 2:3])

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

#Visualizing the Training set results
library(ggplot2)

ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata=training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (Training Set)')+
  xlab('Years of experience') + 
  ylab('Salary')


#Visualizing the Test set results
ggplot()+
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor , newdata = training_set)),
            color = 'blue') +
  ggtitle('Salary vs Experience (Test Set)')+
  xlab('Years of experience') +
  ylab('Salary')