### R DATA SCIENCE AND MACHINE LEARNING BOOTCAMP
### UDEMY MOOC
### R PROGRAMMING - DATA MANIPULATIO, DPYLR and TIDYR

### UTILS
setwd(dir = 'C:/Users/Sebastien David/R-Data-Science')

#install.packages('dplyr')
#install.packages('nycflights13')
#install.packages('tidyr')
#install.packages('data.table') # data.frame w/ more features

library(dplyr)
library(nycflights13)
library(tidyr)
library(data.table)


###### 5.1. dplyr functions ######

nrow(flights)
ncol(flights)

# 5.1.1. filter()
filter(flights, month==11, day==3, carrier=='AA')
flights[flights$month==11 & flights$day==3 & flights$carrier=='AA',]

# 5.1.2. slice()
slice(flights, 1:10)

# 5.1.3. arrange()
head(flights)
arrange(flights, year, month, day, arr_time)

# 5.1.4. select()
select(flights, carrier)

# 5.1.5. rename()
rename(flights, airline_carrier = carrier)

# 5.1.6. distinct()
distinct(select(flights, carrier))

# 5.1.7. mutate()
mutate(flights, new_col = arr_delay - dep_delay)

# 5.1.8. transmute() (only get new_col)
transmute(flights, new_col = arr_delay - dep_delay)

# 5.1.9. summarise()
summarise(flights, avg_air_time=mean(air_time, na.rm=TRUE))

# 5.1.10. sample_n() (random sample)
sample_n(flights,10)


###### Pipe Operator ######
df = mtcars

a = filter(df, mpg>20)
b = sample_n(a, size=5)
c = arrange(b, desc(mpg))
print(c)

# data %>% op1 %>% op2 %>% op3

res = df %>% filter(mpg>20) %>% sample_n(size=5) %>% arrange(desc(mpg))
print(res)


###### 5.2. dplyr Exercices ######
df = mtcars

# EX-1
ex1 = df %>% filter(mpg>=20, cyl>=6)

# EX-2
ex2 = df %>% arrange(cyl, desc(wt))
ex2

# EX-3
ex3 = df %>% select(mpg, hp)
ex3

# EX-4
ex4 = df %>% select(gear) %>% distinct()
ex4

# EX-5
ex5 = df %>% mutate(Performance = hp/wt)
ex5

# EX-6
ex6 = df %>% select(mpg) %>% summarise(mean(mpg))
ex6

# EX-7
ex7 = df %>% filter(cyl==6) %>% select(hp) %>% summarise(mean(hp))
ex7


###### 5.3. tidyr ######

# 5.3.1. gather()


# 5.3.2. A


# 5.3.3. A


# 5.3.3. A