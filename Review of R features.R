# Arithmetics calculations
2+3

# Assigning Variables
x <- 3
y <- 4

# plotting in R
x <- c(1,2,3)
y <- c(3,4,1)
plot(x,y)

# class variables
class(x)
class(y)
length(x)
length(y)

# Strings
str <- "This is my first script"
"This is my first script" -> str2
str
class(str)

# Clear my history
rm(list = ls())
ls()

# Functions
?mean
?sd
?max

# Total Function
# name of the function
# function statement
# some argument
# body
# return statement (#optional)

my_sum <- function(input_1, input_2) {
  tot = input_1 + input_2
  #return(tot) # return is optional
  tot
}

# Calling a function:
my_sum(input_1 = 3, input_2 = 6)
my_sum(3,4)
#OR, can use named variables as inputs:
bob <- 10
larry <- 15
my_sum(bob, larry)

# native function in R
sum(bob, larry)

# How about converting fahrenheit to kelvin
F_to_K <- function(tempF) {
  kelvin <- ((tempF- 32) * (5/9)) + 273.15 #need parentheses because R can't do order of operations
  return(kelvin)
}

F_to_K(32)
# to run function on more than one temperature, need to enter a single list of temperatures:
F_to_K(TempF = c(32, 65, 100, 212, 0))

# How about converting Kelvin to Celsius?
K_to_C <- function(tempK) {
  celsius <- tempK - 273.15
  return(celsius)
}

K_to_C(0)

# Exercise: Converting Fahrenheit to Celsius
F_to_C <- function(temp) {
  C <- ((temp - 32) * (5/9))
  return(C)
}


F_to_C(32)
F_to_C(c(32, 70, 100, 212))

# Saved F_to_C, F_to_K, and K_to_C as a separate R Script (i.e. another tab)
# Now call F_to_C_functions.R script to convert F_to_C
source("F_to_C_functions.R")

F_to_K(32)
K_to_C(0)
F_to_C(0)


# Exersise 2
best_practice <- c("write", "programs", "for", "people", "not", "computers")
asterix <- "****"

# Write a function called "fence" that takes two arguments and returns a new vector 
# with asterix at the beginning and at the end

fence <- function(input_1, input_2) {
  output <- c(input_1, input_2, input_1)
  return(output)
}

output <-fence(asterix, best_practice)
output

# Now doing something with a real dataset
# create a file for data to go in
dir.create("data.csv")
# download data into file from the internet
download.file("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv", destfile = "data.csv")

dat <- read.csv("data.csv", header = TRUE)
?read.csv

head(dat)
summary(dat)
str(dat)

# Write a function called analyze that takes country as argumenta nd displays mean, 
# min and mx lifeExp of that country subsetting the df

# Subsetting the dataframe into just the data from Uganda:
country_name <- subset(dat, dat$country == "Uganda")
head(country_name)
summary(country_name)

# Calculating mean, min, and max of lifeExp (a column 5 in the data)
mean(country_name[,5])
min(country_name[,5])
max(country_name[,5])

# Making a function to do this:
analyze <- function(country) {
  country_name <- subset(dat, dat$country == country)
  #print(mean(country_name[,5]))
  #print(min(country_name[,5]))
  #print(max(country_name[,5]))
  out <- c("Mean_le" = mean(country_name$lifeExp), "Min_le" = min(country_name$lifeExp), "Max_le" = max(country_name$lifeExp))
  print(out)
}

analyze("Albania")

# Modify the analyze function to generate a plot with "year" on x-axis and "lifeExp" on y-axis

analyze <- function(countr) {
  country_name <- subset(dat, dat$country == countr)
  #print(mean(country_name[,5]))
  #print(min(country_name[,5]))
  #print(max(country_name[,5]))
  #out <- c("Mean_le" = mean(country_name$lifeExp), "Min_le" = min(country_name$lifeExp), "Max_le" = max(country_name$lifeExp))
  #print(out)
  plot(country_name$year, country_name$lifeEx, xlab = "Year", ylab = "Life Expectancy", main = countr)
}


# Loops
best_practice_fun(best_practice)

# Doint things without a loop - long and annoying to type out
best_practice_fun <- function(some_argument) {
  print(some_argument[1])
  print(some_argument[2])
  print(some_argument[3])
  print(some_argument[4])
  print(some_argument[5])
  print(some_argument[6])
}

# For Loop
best_practice_fun2 <- function(some_argument) {
  for (w in best_practice) {
    print(w)
  }
}

best_practice_fun2(best_practice)

# Generate a file that contains years "1952" and "1997" and name it as gapminder_52_97 
# and another file that contains years "1967" and "2007" and name it as gapminder_67_07

gapminder_52_97 <- subset(dat, dat$year == 1952 | dat$year == 1997)
head(gapminder_52_97)

gapminder_67_07 <- subset(dat, dat$year == 1967 | dat$year == 2007)
head(gapminder_67_07)

# Writing a dataset into a folder
write.csv(file = "Population_data/gapminder_52_97.csv", gapminder_52_97, row.names = FALSE)
write.csv(file = "Population_data/gapminder_67_07.csv", gapminder_67_07, row.names = FALSE)

# List the files with a pattern in a directory
list.files(path = "Population_data", pattern = ".csv", full.names = TRUE)


# Exercise: write a for loop to plrint each file name on a different line
  # make list.files thing into a list
filenames <- list.files(path = "Population_data", pattern = ".csv", full.names = TRUE)
  # write the forloop
for(f in filenames) {
  print(f)
}

# Combining the list.files function with that analize function from above
analyze_data <- (fule, new) {
  file_out <- read.csv(file, header = TRUE)
  country_name <- subset(file_out, file_out$country == new)
  out2 <- c("Mean_le" = mean(country_name$lifeExp), 
            "Min_le" = min(country_name$lifeExp), 
            "Max_le" = max(country_name$lifeExp))
}

analyze_all <- function(countr) {
  filenames <- list.files(path = "Population_data", pattern = ".csv", full.names = TRUE)
  for (f in filenames) {
    year_dat <- read.csv(f, header = TRUE)
    print(mean(year_dat))
    print(year_dat)
  }
}

analyze("Uganda")
?read.csv



