# get environment variable to determine which figure to make
fig2 <- Sys.getenv("fig2")

#read data
mydata <- read.csv("data/data.csv",header = TRUE)
mydata$type <- factor(mydata$type)

#plot and save fig1
png("figs/fig2.png")
library(ggplot2)
ggplot(data = mydata, mapping = aes(x = Years , y = Proportion..., colour = type)) + geom_point(size = 2)+ggtitle("The propotion of Electricity production from renewable sources")+ylab("Proportion(%)")
dev.off()

