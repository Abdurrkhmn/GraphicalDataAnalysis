########################################################################
# Course: "Introduction to Graphical Data Analysis"
# Topic 1. == Introduction to R / Rstudio ==
# Lecturer: E.D. Starshov (e.starshov@gsom.spbu.ru)
########################################################################

##################################
### 1.1. R language and syntax ###
##################################

## Operations ##

# Addition
1 + 1 

# subtraction
10 - 2 

# Multiplication
5 * (-3) 

# Exponentiation (squaring)
10 ^ 2 

# Multiple operations
5 + 4 / 3 

# Operations with brackets
(5 + 4) / 3 

# Learn the sequence of operations for a mini-test



###########################################
### 1.2. Types of variables and objects ###
###########################################

## Objects and operations with them ##

# Set x to be a value
x <- 1

# Add 2 to x
x + 2

# Set "y" to be a row of numbers (vector)
y <- 1:600

# Call y
y

y ^ 2

# Set name to be "Ivan"
name <- "Ivan"

# Call Name
Name

# Oops! Something went wrong. R is case-sensitive. This means that "name" 
# and "Name" are considered as two different objects.
# So call the right "name"
name

# Set a to be "13"
a <- "13"

# Now add 2 to it
a + 2

# What's wrong? 13 is an integer (number) and "13" is a string (text).

# Set a to be an integer 13
a <- 13 # We can reset objects

# Add a to x
x + a

# Reset x to be 10
x <- 10

# Again add a to x
x + a

# Divide x by a
x / a

# Set b to be the ratio of x and a
b <- x/a

# Call b
b

# Subtract 2 from x
x - 2

# Recall b
b # it didn't change

# x <- x - 2 changes x
# x -2 doesn't change x, it just prints it out on the screen

## Types of objects ##

# Numeric
x <- 1
class(x)

y <- 1.5
class(y)


# Character
z <- "apple"
class(z)


# Boolean
a <- TRUE
class(a)


# Vector of numbers
set1 <- c(x, y)
class(set1)


# Vector of characters
set2 <- c("apple", "Ivan", "o")
typeof(set2)


######################
### 1.3. Functions ###
######################

# Install necessary packages
install.packages("ggplot2")

# Load necessary packages
library(ggplot2)

## Values ##

# Let's crrate a function that takes a value in centimeters and 
# converts it into meters
meter <- function(cm) {
  m <- cm / 100
  return(m)
} # nothing happens - we just created a function

# Let us call it
meter(195)

##########
## Task ##
##########

# Represent the function from the blackboard in R


# Call it with the given value





## Rows of numbers (vectors) ##

# Let's create the following function
f <- function(x) {
  x ^ 4 - 30
}

# We can set a row of numbers as p
p <- c(2,4,6,8)

# Set q as a function of p
q <- f(p)

# Call  q
q



## Plotting values ##

# Plot p and z
qplot(p,q) # a function from "ggplot2" package

# Plot p and z in form of a line
qplot(p,q, geom = "line")

# Ask for help with qplot
?qplot


##############
## OPTIONAL ##
##############

# We can generate a vector with a specified incremental step
p <- seq(2,100, by = 2) # try various intervals and steps

# Task 1. Try generating various functions
f2 <- function(x) {
  x^1/3+10
}

q <- f2(p)

# Task 2. Try various functions of qplot (color, main, xlab, ylab)
qplot(p,q, color = I("green")) 
qplot(p,q, color = I("blue"), geom = c("point", "line")) 

# For an overview of qplot read http://www.sthda.com/engl








##########################################
### 1.4. Data import and visualization ###
##########################################


## Getting and setting working directory (WD) ##
getwd()

# Set your default WD in the menu
getwd()

# You may change WD for a particular project
setwd("/Users/egorstarshov/Desktop/university/teaching/MA introductory data courses/2023 IGDA/data")



## Data import ##

# Install necessary packages
install.packages("openxlsx")

# Load necessary packages
library(openxlsx)


# Load the data
msc <- read.xlsx("mscSurvey.xlsx")
# Data source: https://www.kaggle.com/datasets/sveneschlbeck/new-york-city-airport-activity



## Descriptive statistics ##

# Look at the data
View(msc)


# Get a particular variable
msc$note


# Calculate the mean of smart mobility score across cities
mean(msc$note)


# Calculate the corresponding median
median(msc$note)


# You can obtain more information with the 'describe' command



## Data visualization ##

## Look at how data are organized
# Comment: there are various packages to plot data

# Histogram
hist(msc$note) # one QUANT variable

# Scatterplot
plot(msc$note, msc$gmat) # two QUANT variables


# Boxplot
ggplot(msc, aes(x = gender, y = note)) +
  geom_boxplot() # one QUANT + one QUAL variables


# Univariate bar chart
ggplot(msc, aes(x = gender, fill = gender)) +
  geom_bar() # one QUAL variable


# Create new variable "tech"
msc$tech <- ifelse(msc$bachelor == "technical", 1, 0)


# Contingency table
table(msc$gender, msc$tech) # gender and technical background

table(msc$gender, msc$prog) # gender and programming background

table(msc$tech, msc$prog) # technical and programming background


# Bivariate bar chart
ggplot(msc, aes(x = bachelor, y = ..count.., fill = gender)) +
  geom_bar() # two QUAL variables


## OPTIONAL HOMETASK: try to copypaste and change the code to build

# 1 Histograms for 'gmat' and 'businessCommunication'


# 2 Scatterplot for 'gmat' and 'businessCommunication'


# 3 Boxplot for 'bachelor' and 'note'


# 4 Contingency table for 'math' and 'prog'

