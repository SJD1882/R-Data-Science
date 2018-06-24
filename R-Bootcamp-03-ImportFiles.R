### R DATA SCIENCE AND MACHINE LEARNING BOOTCAMP
### UDEMY MOOC
### R PROGRAMMING - READING EXTERNAL FILES

setwd(dir = 'C:/Users/Sebastien David/R-Data-Science')


###### 4. EXPORT/IMPORT FILES ######

# 4.1. CSV Files
write.csv(mtcars, file='my.exemple.csv')
df = read.csv('my.exemple.csv')
head(df)
class(df)

# 4.2. Excel Files (1 sheet)
install.packages('readxl')
library(readxl)
excel_sheets('Sample-Sales-Data.xlsx')  # Sheet1
df = read_excel('Sample-Sales-Data.xlsx', sheet='Sheet1')
head(df)
sum(df$Value)
summary(df)

# 4.3. Excel files (entire workbook)
entire.workbook = lapply(excel_sheets('Sample-Sales-Data.xlsx'),
                         read_excel, path='Sample-Sales-Data.xlsx')

entire.workbook

# 4.4. Write to Excel files
install.packages('xlsx')
library(xlsx)
write.xlsx(mtcars, 'output.xlsx')

# 4.5 SQL with R
install.packages("RODBC")
#install.packages('RMySQL')
#install.packages('ROracle')
#install.packages('RJDBC')

# RODBC Example of syntax
library(RODBC)
myconn = odbcConnect("Database_Name", uid="User_ID", pwd="password")
dat = sqlFetch(myconn, "Table_Name")
querydat = sqlQuery(myconn, "SELECT * FROM table")
close(myconn)

# 4.6. Web Scraping with R
install.packages('rvest')
library(rvest)

demo(package='rvest')
# Demos in package 'rvest':
# tripadvisor             Scrape review data from tripadvisor
# united                  Scrape mileage details from united.com
# zillow                  Scrape housing info from tripadvisor

demo(package='rvest', topic='tripadvisor')

apocalypse_now = read_html('https://www.imdb.com/title/tt0078788/')

# Rating: 8.5/10
apocalypse_now %>%
  html_node('strong span') %>%
  html_text() %>%
  as.numeric()

# Actors
apocalypse_now %>%
  html_nodes('#titleCast .itemprop span') %>%
  html_text()

# [1] "Marlon Brando"      "Martin Sheen"       "Robert Duvall"     
# [4] "Frederic Forrest"   "Sam Bottoms"        "Laurence Fishburne"
# [7] "Albert Hall"        "Harrison Ford"      "Dennis Hopper"     
# [10] "G.D. Spradlin"      "Jerry Ziesmer"      "Scott Glenn"       
# [13] "Bo Byers"           "James Keane"        "Kerry Rossall"

apocalypse_now %>%
  html_nodes('table') %>%
  .[[1]] %>%
  html_table()