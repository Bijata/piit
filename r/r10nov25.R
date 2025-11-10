mtcars
str(mtcars)
?str
names(mtcars)
dim(mtcars)
head(mtcars)
tail(mtcars)
head(mtcars,2)
sum(is.na(mtcars))
summary(mtcars)
is.na(mtcars)

#analysis----
head(mtcars,2)
sapply(mtcars,max)
sapply(mtcars,min)
sapply(mtcars,fivenum)
mean(mtcars$mpg)
max(mtcars$qsec)
range(mtcars$mpg)
sd(mtcars$mpg)
quantile(mtcars$mpg)
summary(mtcars)


#filter----
mtcars[1:4,c('mpg','gear')]
sapply(mtcars[,c('mpg','gear')], max)
mtcars[3:6,2:5]
mtcars[c(1,5,8),c(3,8,9)]
head(mtcars)


#summary----
library(dplyr)

mtcars %>% summary()

#adding new column
mtcars %>% mutate(newMPG = mpg * 1.5)
mtcars %>% select(carb,vs) %>% mutate(newCarb = carb*2,newCarb1 = newCarb *newCarb)
mtcars %>% select(mpg,hp,carb) %>% mutate(mpg= NULL, hp= hp*2)
mtcars %>% select(vs,hp) %>% mutate(across(!vs,as.factor))
mtcars %>% select(vs,carb,mpg) %>% group_by(carb) %>% mutate(rank=min_rank(desc(carb)))
mtcars %>% select(carb) %>% max

#ways to find max/summary statstics
sapply(mtcars[, c('mpg','gear')], max)
mtcars %>% select(mpg,gear) %>% summarise(across(everything(),max))

df = mtcars
df
df <-df %>% mutate(newCARB = carb*2) 
df

#count the no. of types of am , carb
df %>% group_by(am) %>% summarize(n=n())
df %>% group_by(am,carb) %>% summarise(n=n())

#functions----
#transpose
t(df)
df = mtcars
head(df)
df %>% group_by(am) %>% summarise(meanMPG=mean(mpg,na.rm=T))
df %>% select(mpg,hp) %>% summarise(across(everything(),mean))
df %>% mutate(mpg2=if_else(am==0, mpg*2,mpg)) %>% select(am,mpg2,mpg)
?barplot
df %>% group_by(gear) %>% summarise(meanMPG = round(mean(mpg,na.rm=T)))
df %>% group_by(gear) %>% summarise(meanMPG = (mean(mpg,na.rm=T)))


#t.test()
?duplicated
unique(df$cyl)
unique(df$am)

#correlation
cor(df)
round(cor(df),2)
cor(df[,c('mpg','wt')])
df[,c('mpg','wt')]
names(df)

df %>% group_by(gear) %>% summarize(countCars=n())
df %>% select(gear,am) %>% arrange(gear,desc(am))
df %>% select(gear,am) %>% arrange(desc(am))
df %>% group_by(gear) %>% tally()


#plot
plot(df$mpg,df$hp)

df %>% mutate(am = factor(am),gear = factor(gear)) %>% ggplot(., aes(x=mpg, y=hp)) + geom_point(aes(size=am, color = gear))

mtcars %>%
  mutate(am = factor(am), gear = factor(gear)) %>%
  ggplot(aes(x = mpg, y = hp)) +
  geom_point(aes(size = wt, color = gear)) +
  labs(size = "Transmission", color = "Gears") +
  theme_minimal()

#Barcharts
ggplot(mtcars, aes(x = factor(cyl))) +
  geom_bar(fill = "skyblue") +
  labs(title = "Number of Cars by Cylinder",
       x = "Number of Cylinders",
       y = "Count of Cars") +
  theme_minimal()

mean(df$mpg, na.rm =T)
str(df)

#as.integer drops the rounding parts
as.integer(100.10)
as.integer(100.10201)

#pivot
df %>% group_by(gear,am) %>% summarise(meanMPG =mean(mpg, na.rm =T), meanHP = mean(hp, na.rm=T))
?pivot_longer
df %>% group_by(gear,am) %>% summarise(meanMPG =mean(mpg, na.rm =T), meanHP = mean(hp, na.rm=T)) %>% pivot_longer(cols =c(meanMPG,meanHP), names_to = 'aggType')

#import and export file
#export
write.csv(df, "D:/analytics/data/mtcars2R.csv", row.names = FALSE)

#import /load data
library (readxl)
df2 <- read_excel("D:\\analytics\\projects\\piit\\data\\student17082025.xlsx")
df2
