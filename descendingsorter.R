setwd("~/Desktop")
communitymatrix <- read.csv("DryCreekcommunitymatrixASV.csv", header = TRUE, row.names = 1)
descending_order <- sort(colSums(communitymatrix[1:6,]), decreasing=TRUE)
View(descending_order[1:10])

