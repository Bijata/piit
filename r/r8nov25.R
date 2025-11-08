mtcars
summary(mtcars)
dim(mtcars)
str(mtcars)

#analysis----
range(mtcars)
min(mtcars)

#filter----
mtcars[1:4, c('mpg', 'gear')]
sapply(mtcars[,  c('mpg', 'gear'),max]
mtcars[3:6, 1:5]
mtcars[c(1,5,8), c(3,8,9)]    


#summary----
library(dplyr)

mtcars %>% summary()
mtcars %>% mutate(newMPG = mpg * 1.5)
mtcars %>%  select(mpg,wt) %>% head(6)

df = mtcars
df
df <- df %>%  mutate(newMPG = mpg * 1.5)
df
df %>%  group_by(gear) %>% summarise(n = n())
df %>%  group_by(gear,cyl) %>% summarise(n = n())
df %>%  group_by(gear,cyl,carb) %>% summarise(n = n())

#function----

#cars having < 100 mpg, with 4 cyl
subset(mtcars, mpg < 30 & cyl == 4)

#transpose row to column
t(df)

df = mtcars
head(df)
#meanMPG-txttype----
df %>% group_by(am) %>% summarise(meanMPG = mean(mpg, na.rm=T))
#change----
#double the mpg for am = 0
df %>% mutate(mpg2 = if_else(am==0, mpg*2, mpg)) %>%  select(am,mpg,mpg2)

#meanMPG
df %>%group_by(gear) %>% summarise(meanMPG = mean(mpg, na.rm=T))
?barplot
library(ggplot2)


#duplicated
unique(df$cyl)

#correlatio
cor(df)
cor(df[,c('mpg','wt')])

df %>% arrange(gear,mpg) %>%  select(gear,mpg)
df %>% arrange(gear,desc(mpg)) %>%  select(gear,mpg)

#scatterplot
plot(df$mpg, df$hp)

df %>% ggplot(., aes(x=mpg, y=hp)) + geom_point()
df %>% ggplot(., aes(x=mpg, y=hp)) + geom_point()

as.integer(100.10)
as.numeric(100.10201)

#pivot----
df %>% group_by(gear, am) %>% summarise(meanMPG =mean(mpg,na.rm=T)),meanHP=mean(hp,na.rm=T))



#import data from folder
df2 =read.csv(file.name())

#export data
write.csv(mtcars, '/Users/ ', col.names = F, na ='')