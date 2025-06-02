# Data processing

#Importing the dataset
dataset = read.csv('Data.csv')
#dataset = dataset[, 2:3]


#Splitting the dataset into the Training set and Test set
#install.packages('caTools')
library(caTools)

set.seed(123) #python is for test set, here is for training set
split = sample.split(dataset$Purchased, SplitRatio = 0.8)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Future Scaling (Euclidian distance)

# training_set[, 2:3] = scale(training_set[, 2:3]) #all lines and columns 2 and 3
# test_set[, 2:3] = scale(test_set[, 2:3])


