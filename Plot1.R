# Plot1.R- Project 2

library("plyr")

# Load data
NEI <- readRDS("/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("/exdata-data-NEI_data/Source_Classification_Code.rds")

df<-transform(NEI,year=factor(year))

#Ploting Data grouped by year
plotdata<-ddply(df,.(year),summarize,sum=sum(Emissions))
png("plot1.png")
plot(plotdata$year,plotdata$sum,type="n",xlab="year",ylab="total PM2.5 Emission",boxwex=0.05)
lines(plotdata$year,plotdata$sum)
dev.off()
