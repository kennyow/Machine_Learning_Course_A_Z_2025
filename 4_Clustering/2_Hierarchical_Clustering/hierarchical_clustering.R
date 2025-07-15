#Hierarchhical Clustering

#importing the mall dataset 
dataset = read.csv("Mall_Customers.csv")

X = dataset[4:5]

#Using de dendrogram to find the optimal number of clusters
dendrogram = hclust(dist(X, method = 'euclidean'), method = "ward.D")
plot(dendrogram,
     main = paste('Dendrogram'),
     xlab = 'Customers',
     ylab = 'Euclidean Distance')

#Fitting hierarchical clistering to the mall dataset
hc = hclust(dist(X, method = 'euclidean'), method = "ward.D")

y_hc = cutree(hc, k = 5, h = NULL)

#Visualising the clusters
library(cluster)
clusplot(X,
         y_hc,
         lines = 0,
         shade = TRUE,
         color = TRUE,
         labels = 2,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of customers'),
         xlab = "Annual Income",
         ylab = "Spending Score")