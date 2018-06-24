### R DATA SCIENCE AND MACHINE LEARNING BOOTCAMP
### UDEMY MOOC
### R PROGRAMMING - VECTORS AND MATRICES


###### 1. VECTORS ######

nvec = c(1,2,3,4,5)
cvec = c('U','S','A')
v = c('USA', 20, 40)

nvec
cvec
v
class(v) # 'USA','20','40'

temps = c(72,71,68,74,69,75,76)
days = c('Mon','Tue','Wed','Thu','Fri','Sat','Sun')
names(temps) = days
temps
# Mon Tue Wed Thu Fri Sat Sun 
# 72  71  68  74  69  75  76 


v1 = c(1,2,3)
v2 = c(5,6,7)

v1 + v2
v1 * v2  # 5 12 21
v1 / v2

sum(v1)
sum.of.vec = sum(v1)
sum.of.vec

mean(v1)
sd(v1)
prod(v1)


v1 = c(100,200,300)
v2 = c('a','b','c')

v1[1] # 100
v1[1:2] # 100 200
v1[c(1,2)]

v = c(1,2,3,4,5,6,7,8,9,10)
v[1:10]

names(v) = c('a','b','c','d')
v[c('c','d','a')]
# c d a
# 3 4 1

v[v>2]


###### 2. MATRICES ######

v = 1:12
matrix(v, byrow=FALSE, nrow=4)
matrix(v, byrow=TRUE, nrow=4)

goog = c(450,451,452,445,468)
msft = c(230,231,232,233,220)
stocks = c(goog, msft)
stock.matrix = matrix(stocks, byrow=T, nrow=2)
stock.matrix

days = c('Mon','Tue','Wed','Thu','Fri')
st.names = c('GOOG','MSFT')

colnames(stock.matrix) = days
rownames(stock.matrix) = st.names
stock.matrix
#      Mon Tue Wed Thu Fri
# GOOG 450 451 452 445 468
# MSFT 230 231 232 233 220

mat = matrix(1:25, byrow=TRUE, nrow=5)
mat * 2
mat ^ 2
1/mat
mat[mat>15]

# Matrix multiplication
mat %*% mat

# Basic matrix operations
colSums(stock.matrix)
rowSums(stock.matrix)
rowMeans(stock.matrix)

FB = c(111,112,113,120,145)
tech.stocks = rbind(stock.matrix, FB)
tech.stocks

avg = rowMeans(tech.stocks)
tech.stocks = cbind(tech.stocks, avg)
tech.stocks

mat = matrix(1:50, byrow=TRUE, nrow=5)
mat[1,] # first row
mat[,1] # first col
mat[1:3,]
mat[2:3, 5:6]

# Factor and categorical matrices
animal = c('d','c','d','c')
id = c(1,2,3,4,5)

factor(animal)
# [1] d c d c
# Levels: c d

fac.ani = factor(animal)

# Nominal categorical variables : no order
# Ordinal categorical variables : w/ order

ord.cat = c('cold','med','hot')
temps = c('cold','med','hot','hot','hot','cold','med')
fact.temps = factor(temps, ordered=TRUE,
                    levels=c('cold','med','hot'))

# [1] cold med  hot  hot  hot  cold med 
# Levels: cold < med < hot

fact.temps
summary(temps)

is.matrix(mat)

runif(n=20, min=0, max=1) # random uniform dist