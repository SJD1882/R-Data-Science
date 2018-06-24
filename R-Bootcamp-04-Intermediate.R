### R DATA SCIENCE AND MACHINE LEARNING BOOTCAMP
### UDEMY MOOC
### R PROGRAMMING - ALGORITHMS

setwd(dir = 'C:/Users/Sebastien David/R-Data-Science')


###### 4. PROGRAMMING ######

# 4.1. Conditional statements
df = mtcars
df[(df$mpg>21.0) & (df$hp>100),]
df[(df$mpg>21.0) | (df$hp>100),]

# 4.2. If, else and else if statements
x = 10
temp = 5
if ((x==10) & (temp>10)){
  # Code
  print('X is equal to 10')
} else if(x==12){
  print('X is equal to 12')
} else {
  print('X was not equal to 10 or 12')
}

# 4.3. EXERCICE
# 1)
x = 3000
if ((x%%2) == 0){
  print('Even Number')
} else {
  print('Not Even')
}

# 2)
x = matrix(1:10, nrow=2, byrow=T)
if ((is.matrix((x))==T)){
  print('Is a Matrix')
} else {
  print('Is not a Matrix')
}

# 3)
v = c(3,7,1)

if (x[1]>x[2]){
  a = x[1]
  b = x[2]
} else {
  a = x[2]
  b = x[1]
}

if ((x[3] > a) & (x[3] > b)){
  c = b
  b = a
  a = x[3]
} else if (x[3] < a & x[3] < b){
  c = x[3]
} else {
  c = b
  b = x[3]
}

print(paste(a,b,c))  

# 4)
x = v
if (x[1]>x[2] & x[1]>x[3]){
  print(x[1])
} else if (x[2] > x[3]){
  print(x[2])
} else {
  print(x[3])
}

# 4.3. WHILE loops
i = -1
while (i < 5){
  i = i + 1
  print(i)
}

x = 0
while (x < 10){
  print(paste0('X is: ', x))
  
  x = x + 1
  if (x==5){
      print('X is now equal to 5! Break Loop!')
      break
    }
}

# 4.4. FOR loops
v = c(1,2,3,4,5)
for (i in v){
  print(paste('v = ', i))
}

mylist = list(c(1,2,3), mtcars)
for (item in mylist){
  print(item)
}

M = matrix(1:25, nrow=5)

for (row in 1:nrow(M)){
  for (col in 1:ncol(M)){
    print(paste('The element at row:', row, 'and col:',
                col, 'is', M[row,col]))
  }
}

# 4.5. FUNCTIONS
hello = function(name='Mass Effect'){
  print(paste('My favorite video game is', name))
}

hello()

add_num = function(x1,x2){
  mysum = x1 + x2
  return (mysum)
}

add_num(4,5)

num_count = function(num, v){
  count = 0
  for (i in v){
    if (i==num){
      count = count + 1
    }
  }
  return (count)
}

vector = c(1,1,9,24,3,999,1,3,5,1)
num_count(num=1, v=vector)

summer = function(a,b,c){
  out = c(0)
  
  if (a%%3 != 0){
    out = append(a, out)
  }
  if (b%%3 != 0){
    out = append(b, out)
  }
  if (c%%3 != 0){
    out = append(c, out)
  }
  
  return(sum(out))
}

print(summer(1,27,1))

prime_check = function(num){
  if (num==2){
    return (TRUE)
  }
  for (x in 2:(num-1)){
    if (num%%x == 0){
      return (FALSE)
    }
  }
  return (TRUE)
}

prime_check(8)

# 4.6. Some functions
seq(0, 10, by=2)  # 0 2 4 6 8 10

v = c(1,4,7,2,13,3,11)
sort(v) # 1 2 3 4 7 11 13
sort(v, decreasing = TRUE) # 13 11 7 ...

cv = c('B','b','a','c')
sort(cv)  # 'a','b','B','c'

str(cv)
str(mtcars)

v = 1:10
v2 = 35:40
append(v, v2)

# is. => checks type
# as. => converts to new type


# 4.7. Apply
v = c(1,2,3,4,5)

addrand = function(x){
  ran = sample(1:100, 1)
  return (x + ran)
}

lapply(v, addrand)  # returns list
sapply(v, addrand)  # returns vector

times2 = function(x){ return (x*2) }
sapply(v, times2)

v = 1:5
sapply(v, function(x){x*2}) # annoymous function

add_choice = function(x, choice){
  return(x+choice)
}
print(sapply(v, add_choice, choice=100))


# 4.8. GREPL, GREP
text = 'Hi there, do you know who you are voting for?'
grepl(pattern='you', text) # TRUE
grep(pattern='you', text) # 1

v = c('a','b','b','c','d')
grepl('b', v)
grep('b', v)


# 4.9. Date and Timestamps
Sys.Date() # 2018-06-15
c = '1990-01-01'
class(c)
my.date = as.Date(c)
my.date

as.Date('Nov-03-1990') # error
my.date = as.Date('Nov-03-90', format='%b-%d-%y')
my.date

as.Date('June,01,2002', format='%B,%d,%Y')

as.POSIXct('11:02:03', format='%H:%M:%S')

x = '11:02:03'
class(x)  # character
x = strptime(x, format='%H:%M:%S')
class(x)  # POSIXlt POSIXt