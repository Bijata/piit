#Bind in R (Join)

library(dplyr)

?bind

#rbind-----
#column no. and column name should be same
(df1 = data.frame(rollno = 1:5, name= paste('Student',1:5)))
(df2 = data.frame(rollno = 11:15, name= paste('Student',11:15)))
df12 = rbind(df1,df2)
df12


#cbind-----
#no. of rows to be same, names of cols can be same of different

(df3 = data.frame(rollno = 1:5, name= paste('Student',1:5)))
(df4 = data.frame(rollno = 1:5, gender = c('M','F','M','F','M')))
df34 = cbind(df3, df4)
df34
(df5 = data.frame(city=paste('C', 1:5)))
df5
(df345 = cbind(df3,df4,df5))


#join-----
df34B = merge(df3,df4, by='rollno')
df34B
