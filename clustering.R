# Import data. The analyses below assume the data are stored in a data.frame with items as 
# columns and clients as rows (as in the spreadsheet)
setwd("C:/.../LAIR")
lair.data = read.table("lairdata.txt", header=FALSE, sep="\t")
item.data = lair.data[, 1:29]
response.data = lair.data[, 30]
num.clients = nrow(item.data)
num.items = ncol(item.data)

# Run agglomerative hierarchical clustering, with Euclidean distances and Ward's linkage
hc = hclust(dist(t(item.data)), method="ward.D")

# Create pretty SVG plot of the resulting dendrogram
svg.file = "dendrogram.svg"
svg(svg.file, width=5, height=4, pointsize=10)
par(oma=c(0,0,0,0), mar=c(3,1,1,1)) # Set margins
hc$labels = 1:num.items # Give numerical labels
plot(as.dendrogram(hc), nodePar=list(lab.cex=0.7, pch=c(NA,NA)), edgePar=list(lwd=2), axes=FALSE, xlab="", ylab="")
title(xlab="Item number", line=1)
dev.off()
