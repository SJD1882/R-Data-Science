### R DATA SCIENCE AND MACHINE LEARNING BOOTCAMP
### UDEMY MOOC
### R PROGRAMMING - DATAFRAMES

setwd(dir = 'C:/Users/Sebastien David/R-Data-Science')


###### 3. DATAFRAMES ######

### 3.1. Basics
df = state.x77
head(df)
tail(df)
str(df)
summary(df)

days = c('Mon','Tue','Wed','Thur','Fri')
temp = c(22.2,21,23,24.3,25)
rain = c(T,T,F,F,T)
df = data.frame(days, temp, rain)
df
str(df)

### 3.2. Indexing and selection
df[1,]
df[,1]
df[,'rain']
df[1:5,c('days','temp')]

df$rain
df['rain']

subset(df, subset = rain==T)
subset(df, subset = temp>23)

sorted.temp = order(df['temp'])
sorted.temp # 2 1 3 4 5
df[sorted.temp,]
#    days temp  rain
# 2  Tue 21.0  TRUE
# 1  Mon 22.2  TRUE
# 3  Wed 23.0 FALSE
# 4 Thur 24.3 FALSE
# 5  Fri 25.0  TRUE

desc.temp = order(-df['temp'])
desc.temp # 5 4 3 1 2
df[desc.temp,]

### 3.3. Creating dataframes
empty = data.frame()

c1 = 1:10
c2 = letters[1:10]
df = data.frame(col.name.1 = c1,
                col.name.2 = c2)

write.csv(df, file='saved_df.csv')
d2 = read.csv('saved_df.csv')

### 3.4. Getting information about dataframes
nrow(df)
ncol(df)
colnames(df)
rownames(df)
str(df)
summary(df)

### 3.5. Referencing cells/rows
df[[5,2]]
df[[5,'col.name.2']]
df[[2,'col.name.1']] = 9999
df

df[1,]

head(mtcars)

# Get vector of column values
mtcars$mpg
mtcars[,'mpg']
mtcars[,1]
mtcars[['mpg']]

# Different from
mtcars['mpg']

# Multiple columns
mtcars[c('mpg','cyl')]
#mtcars[['mpg','cyl']]  unlike Python this doesn't work

### 3.6. Bidding dataframes
df2 = data.frame(col.name.1 = 2000, col.name.2 = 'Falout: New Vegas')
dfnew = rbind(df, df2)
dfnew

df$newcol = 2 * df$col.name.1

df$newcol.copy = df$newcol
df[,'new.copy2'] = df$newcol # Same

### 3.7 Setting column names
colnames(df)
colnames(df) =  c('Apocalypse Now','Fight Club','A Serious Man',
                  'Blade Runner', 'Oldboy')

colnames(df)[1] = '2001: A Space Odyssey'
df

### 3.8. Selecting multiple rows/columns
# Rows
df[1:3,]
df[,-1] # first column gone (different from Python)

mtcars[mtcars$mpg > 20, c('mpg','wt','carb')]

mtcars[(mtcars$mpg>20) & (mtcars$cyl==6), c('mpg','cyl','hp')]
subset(mtcars, (mpg>20) & (cyl==6)) # same

# Columns
mtcars[,c('mpg','wt','hp')]
mtcars[,c(1,6,4)]

### 3.9. Dealing with missing data
is.na(mtcars)
any(is.na(df)) # Nice shortcut to check if there are NaN anywhere
any(is.na(mtcars$mpg))
any(is.na(mtcars))

df[is.na(df)] = 0.0
mtcars$mpg[is.na(mtcars$mpg)] = mean(mtcars$mpg)


###### EXERCICE ######

# 1
c1 = c(22, 25, 26)
c2 = c(150, 165, 120)
c3 = c('M', 'M', 'F')
df = data.frame(c1,c2,c3)

features = c('Age', 'Weight', 'Sex')
names = c('Sam', 'Frank', 'Amy')

colnames(df) = features
rownames(df) = names
df

# 2
is.data.frame(mtcars)

# 3
mat = matrix(1:25, nrow=5)
matdf = as.data.frame(mat)
matdf

# 4 - 5 - 6 - 7
df = mtcars
head(df, 6)
mean(df$mpg)
subset(df, cyl==6)

# 8
df[c('am','gear','carb')]

# 9
df$performance = df$hp / df$wt
df

# 10
df$performance = round(df$performance,2)
df

# 11
df1 = subset(df, (hp>100) & (wt>2.5))
mean(df1$mpg)

# 12
df['Hornet Sportabout','mpg']


### BONUS: Lists (data structure with [[1]], [[2]], [[3]])
v = c(1,2,3)
m = matrix(1:10, nrow=2)
df = mtcars
my.list = list(v, m, df)
my.list[[1]] # 1 2 3
my.named.list = list(my.vector = v,
                     my.matrix = m,
                     my.dataframe = df)
