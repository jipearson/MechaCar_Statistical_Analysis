#load the dplyr package
library(dplyr)


#deliverable 1

#import and read in the mechacar_mpg.csv file as a dataframe
mechacar_mpg <- read.csv(file="./resources/mechacar_mpg.csv")
head(mechacar_mpg)
#perform linear regression using the lm() function
lm(mpg ~ vehicle_length  + vehicle_weight  + spoiler_angle  + ground_clearance  + AWD,data=mechacar_mpg)
#using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length  + vehicle_weight  + spoiler_angle  + ground_clearance  + AWD,data=mechacar_mpg))



#deliverable 2

#import and read in the suspension_coil.csv file as a table.
suspension_coil <- read.csv(file="./resources/suspension_coil.csv")
head(suspension_coil)
#create a total_summary dataframe to get the mean, median, variance, and standard deviation of the suspension coil's psi column
total_summary <- suspension_coil %>% summarize(mean=mean(PSI), median=median(PSI),variance=var(PSI),sd=sd(PSI), .groups = 'keep')
#group by manufacturing_lot before summarizing 
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(mean=mean(PSI), median=median(PSI),variance=var(PSI),sd=sd(PSI), .groups = 'keep')



#deliverable 3

#Use t.test() to determine if the PSI across all lots is statistically different from the population mean of 1,500 PSI
t.test(suspension_coil$PSI,mu=1500)
#Run t.test() for each individual lot
#lot1
lot1 <- subset(suspension_coil, Manufacturing_Lot  == "Lot1")
t.test(lot1$PSI,mu=1500)
#lot2
lot2 <- subset(suspension_coil, Manufacturing_Lot  == "Lot2")
t.test(lot2$PSI,mu=1500)
#lot3
lot3 <- subset(suspension_coil, Manufacturing_Lot  == "Lot3")
t.test(lot3$PSI,mu=1500)

