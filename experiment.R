library(datasets)
library(stats)
data<-cmdscale(eurodist)
head(data)
eurodist

require(stats)
loc <- cmdscale(eurodist)
rx <- range(x <- loc[,1])
ry <- range(y <- -loc[,2])
plot(x, y, type="n", asp=1, xlab="", ylab="")
abline(h = pretty(rx, 10), v = pretty(ry, 10), col = "light gray")
text(x, y, labels(eurodist), cex=0.8, col='gray')
#points(x, y, cex=0.8)
#points(x[1],y[1], col='red', pch=16)
text(x[1],y[1],rownames(data)[1], col='red', cex=0.8, font=4)
#points(x[2],y[2], col='green', pch=16)
text(x[2],y[2],rownames(data)[2], col='blue', cex=0.8, font=4)
lines(x[1:2], y[1:2])

dist12 = round(sqrt((x[2]-x[1])^2 + (y[2]-y[1])^2))
text(mean(x[1:2]),mean(y[1:2]), paste('~',as.character(dist12),'km'), cex=0.8, font=4)
