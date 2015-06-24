library(kml)

library(cluster)
library(fpc)








# clus2 <- kmeans(normalized_behaviour, centers=2)
# 

# 




### 8 clusters
mydata <- jerk_clustering
delta <- sum(kmeans(mydata,
                              centers=1)$withinss)
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)/delta
plot(2:15, wss, type="b", xlab="Number of Clusters",
     ylab="Total sum of squares")

# Fig 01 3 clusters
clus3 <- kmeans(mydata, centers=3)
plotcluster(mydata, clus3$cluster)


clus3table <- clus3$centers
clus3$size
# # # Fig 01 4 clusters
clus4 <- kmeans(mydata, centers=4)
plotcluster(mydata, clus4$cluster)


clus4table <- clus4$centers
clus4$size
### 8 clusters

mydata <- jerk_clustering_without_pauses
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

# Fig 01 3 clusters
clus3 <- kmeans(mydata, centers=3)
plotcluster(mydata, clus3$cluster)


clus3table <- clus3$centers
clus3$size
# # # Fig 01 4 clusters
clus4 <- kmeans(mydata, centers=4)
plotcluster(mydata, clus4$cluster)


clus4table <- clus4$centers
clus4$size
# # # Fig 01 6 clusters
clus6 <- kmeans(mydata, centers=6)
plotcluster(mydata, clus6$cluster)


clus6table <- clus6$centers
clus6$size

for (i in 1:nrow(mydata)) ccc4wopauses$class[i]<-clus4$cluster[i]
cluster_drivers <- ccc4wopauses
# mydata <- jerk_no_pauses
# wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
# for (i in 2:15) wss[i] <- sum(kmeans(mydata,
#                                      centers=i)$withinss)
# plot(1:15, wss, type="b", xlab="Number of Clusters",
#      ylab="Within groups sum of squares")
# 
# # Fig 01 3 clusters
# clus3 <- kmeans(mydata, centers=3)
# plotcluster(mydata, clus3$cluster)
# 
# 
# clus3table <- clus3$centers
# clus3$size
# # # # Fig 01 4 clusters
# clus4 <- kmeans(mydata, centers=4)
# plotcluster(mydata, clus4$cluster)
# 
# 
# clus4table <- clus4$centers
# clus4$size

