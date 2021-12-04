
#read data
prodat<-read.csv("data/rapi.csv")
amountdat<-read.csv("data/namount.csv")

#drop useless columns
prodat<-prodat[,!names(prodat) %in% c("Indicator.Code","Indicator.Name")]
amountdat<-amountdat[,!names(amountdat) %in% c("Indicator.Code","Indicator.Name")]
mydim3<-dim(prodat)
mydim4<-dim(amountdat)

#create new dataframe for High income
#create year list
Years<-seq(1960,2015,1)

#create proportion list
myProportion<-list()
for (i in seq(3,mydim3[2])){
  myProportion[i-2]<-as.numeric(prodat[prodat$Country.Code=="HIC",i])
}
temp1<-unlist(myProportion)
myProportion<-list(temp1)

#create amount list
myAmount<-list()
for (i in seq(3,mydim4[2])){
  myAmount[i-2]<-as.numeric(amountdat[amountdat$Country.Code=="HIC",i])
}
temp1<-unlist(myAmount)
myAmount<-list(temp1)

#create new dataframe
mydataHIC<-data.frame(Years,myProportion,myAmount)
names(mydataHIC)<-c("Years","Proportion(%)","Amount(kWh)")

#create new dataframe for MID INCOME
#create year list
Years<-seq(1960,2015,1)

#create proportion list
myProportion<-list()
for (i in seq(3,mydim3[2])){
  myProportion[i-2]<-as.numeric(prodat[prodat$Country.Code=="MIC",i])
}
temp1<-unlist(myProportion)
myProportion<-list(temp1)

#create amount list
myAmount<-list()
for (i in seq(3,mydim4[2])){
  myAmount[i-2]<-as.numeric(amountdat[amountdat$Country.Code=="MIC",i])
}
temp1<-unlist(myAmount)
myAmount<-list(temp1)

#create new dataframe
mydataMIC<-data.frame(Years,myProportion,myAmount)
names(mydataMIC)<-c("Years","Proportion(%)","Amount(kWh)")

#create new dataframe for LOW INCOME
#create year list
Years<-seq(1960,2015,1)

#create proportion list
myProportion<-list()
for (i in seq(3,mydim3[2])){
  myProportion[i-2]<-as.numeric(prodat[prodat$Country.Code=="LIC",i])
}
temp1<-unlist(myProportion)
myProportion<-list(temp1)

#create amount list
myAmount<-list()
for (i in seq(3,mydim4[2])){
  myAmount[i-2]<-as.numeric(amountdat[amountdat$Country.Code=="LIC",i])
}
temp1<-unlist(myAmount)
myAmount<-list(temp1)

#create new dataframe
mydataLIC<-data.frame(Years,myProportion,myAmount)
names(mydataLIC)<-c("Years","Proportion(%)","Amount(kWh)")

# let each data have a new column to show their group
mydataHIC$type<-"High Income"
mydataMIC$type<-"Median Income"
mydataLIC$type<-"Low Income"

# combine all data
mydata<-rbind(mydataHIC,mydataMIC,mydataLIC)
mydata<-na.omit(mydata)
# save data
write.csv(mydata, file=("data/data.csv"), quote = FALSE, row.names = FALSE)
