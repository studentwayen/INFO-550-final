# get environment variable to determine which figure to make
fig1 <- Sys.getenv("fig1")

#read data
mydata <- read.csv("data/data.csv",head=T)
mydata$type <- factor(mydata$type)

#plot and save fig1
png("figs/fig1.png")
library(ggplot2)
ggplot(data = mydata, mapping = aes(x = Years , y = Amount.kWh., colour = type)) + geom_point(size = 2)+ggtitle("The Electricity production from renewable sources")+ylab("Amount(kWh)")
dev.off()

