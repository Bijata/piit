library(dplyr)
df1 <- data.frame(employee_id = c(1,2,3,4), name = c('Roy','Rose','Aman', 'Bel'),age = c(20,25,23,30))
df1
df2 <- data.frame(employee_id = c(1,2,4) ,dept = c('HR', 'Finance','IT'))
df2
inner_join(df1,df2, by="employee_id")
left_join(df1,df2, by="employee_id")
right_join(df1,df2, by="employee_id")
full_join(df1,df2, by="employee_id")
