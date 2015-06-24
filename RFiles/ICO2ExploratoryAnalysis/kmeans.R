library(kml)

library(cluster)
library(fpc)





normalized_behaviour <- cluster[,c(-1, -2,-3)]


# clus2 <- kmeans(normalized_behaviour, centers=2)
# 

# 




### 8 clusters
mydata <- normalized_behaviour
wss <- (nrow(mydata)-1)*sum(apply(mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(mydata,
                                     centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters",
     ylab="Within groups sum of squares")

# Fig 01 8 clusters
clus8 <- kmeans(normalized_behaviour, centers=8)
plotcluster(normalized_behaviour, clus8$cluster)

with(cluster, pairs(normalized_behaviour, col=c(1:8)[clus8$cluster])) 


# # Fig 01 4 clusters

# 
clus4 <- kmeans(normalized_behaviour, centers=4)
plotcluster(normalized_behaviour, clus4$cluster)
with(cluster, pairs(normalized_behaviour, col=c(1:4)[clus4$cluster]))


correlation_eco_cluster<-cluster[1]
correlation_eco_cluster$driver_type<- ordered(cluster$driver_type, levels = c("Eco", "Gentle", "Normal", "Crazy"))
correlation_eco_cluster$behaviour_type<- clus4$cluster
correlation_eco_cluster$rank_more_emphasis_on_driving<- ordered(clus4$cluster, levels = c(2,1,4,3))

cor(as.numeric(correlation_eco_cluster$driver_type), as.numeric(correlation_eco_cluster$rank_more_emphasis_on_driving))

#Modders
with(correlation_eco_cluster,prop.table(table(driver_type,behaviour_type)))





##new analysis

correlation_eco_b <-merge(x = cluster_drivers, y = correlation_eco_cluster, by.y = "driver_id",by.x = "DriverID")


correlation_eco_b$driver_type<- ordered(correlation_eco_b$Cluster, levels = c(1, 3, 4, 2))
with(correlation_eco_b,prop.table(table(driver_type,behaviour_type)))
