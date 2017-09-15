
#R as simple calculator

7 + sqrt(144)

#Object oriented programming
#everything we create in R is an object. Let's look at some of the main object types

x = 7 + sqrt(144)
x

ls() #lists all of the objects in your current R session; can also use 'objects()'

#VECTORS
myv = c ( 10 , 2.5 , 38 , 4.6 , 51 , 16 , 27)
sqrt (myv) #the function sqrt, is applied to each element in the vector

#we can easily find the mean and stardard deviation of our newly created vector
mean(myv)
sd(myv)

#If for some reason we wanted to save the mean of myv to be used in later calculations
#we can do the following

mean.myv=mean(myv)
mean.myv

#We can access different elements of the object, the exact manner of access depends on
#the type of object you are working with

myv[2]#returns the second element in the vector

#MATRICES
x=rnorm(16)
mat1=matrix(x, nrow=4)

mat1#here is the result, as with vectors we can call specific items

mat1[1,2]#the first number is for the row, the second is for the column

mat1[,3]#here I call for all the rows, but only the third column

mat1[1:2,]#here all the columns, but just for the first 2 rows


#DATAFRAMES
#create some variables
x1=c(11,22,33,44,55,66,77)
x2=c(71,52,62,31,22,16,17)
y=2*x1+-5*x2

xdat=data.frame(x1,x2, y)
class(xdat)

#can work with it like a matrix
b=xdat[,1]#get just the first column

xdat$x1#can also call columns by their names

#create new variables and add them as an additional column in the dataframe
xdat$x3=log(xdat$x1)
xdat

summary(xdat$x3)#get summary statistics on the variables

#apply family allows you to pass functions across columns or rows

apply(xdat, MARGIN=2, FUN=mean)#margin 2 means columns, 1 would indicate rows

#let's save our dataframe

save(xdat, file="xdat.RData")#to save it as an R dataframe

write.csv(xdat, file="xdat.csv",sep=",",row.names=F)#create csv file 

#if at a later point you wanted to read in your dataframe you would...

load("xdat.RData") #to read in a saved R datafile

read.csv(file="xdat.csv") #you will want to assign a name to this though...such as

xdat2 = read.csv(file="xdat.csv")


#-----Classes and modes of objects (From Bill Venables Post)

# 'mode' is a mutually exclusive classification of objects according to
# their basic structure.  The 'atomic' modes are numeric, complex,
# character and logical.  An object has one and only one mode.
# 
# 'class' is a property assigned to an object that determines how generic
# functions operate with it.  It is not a mutually exclusive
# classification.  If an object has no specific class assigned to it, such
# as a simple numeric vector, it's class is usually the same as its mode,
# by convention.
# 
# Changing the mode of an object is often called 'coercion'.  The mode of
# an object can change without necessarily changing the class.  e.g.

x <- 1:16
mode(x)
#[1] "numeric"
dim(x) <- c(4,4)
mode(x)
#[1] "numeric"
class(x)
#[1] "matrix"
is.numeric(x)
#[1] TRUE
mode(x) <- "character"
mode(x)
#[1] "character"
class(x)
#[1] "matrix"

#However:
  
x <- factor(x)
class(x)
#[1] "factor"
> mode(x)
#[1] "numeric"
>
  
# At this stage, even though x has mode numeric again, its new class,
# 'factor', inhibits it being used in arithmetic operations.
# 
# In practice, mode is not used very much, other than to define a class
# implicitly when no explicit class has been assigned. 


charvec=c("Abc", "dog", "cat")
class(charvec)

myv = c ( 10 , 2.5 , 38 , 4.6 , 51 , 16 , 27)
class(myv)

#Look at the class of our dataframe and of the variables in our dataframe
class(xdat)

class(xdat$y)


#----Random Variables
#create random variables from a bunch of distributions

rnorm(10, mean=2, sd=5)
rpois(10, lambda=1.2)
rbinom(10, size=100, prob=.2)#note that size is the number of trials
x=runif(10, min=25, max=50)

myv*rnorm(7)#again, vectorized, so it multiplies the random variable by the corresponding
#value in the vector

#------------Logical statements

xdat$x1>20

which(xdat$x1>20)

#ifelse statements
ifelse (xdat$x1>20, xdat$x1*2, xdat$x1)

#for loops
poisdist=vector()
for (i in 1:1000) poisdist[i]= mean(rpois(100, 1.5))



#-----Statistical Models

#Even output of other functions are objects
#here a linear regression
crime=USArrests #build in dataset in R

head(crime)
str(crime)

m1=lm(Murder~UrbanPop, data=crime)#so m1 is an object...it is the results of the lm call
class(m1)
names(m1)

m1$coef
m1$residuals
m1$df.residual

summary(m1)#what you are used to seeing



#--------------------Packages in R----------------------

#In R you develop a library and your library has packages.
#Think about packages as books.  You may have installed a package
#in your library, but it is not active until you actually check it
#it out (i.e., call it into your current sessions using the library function)

#if you don't have the following package, let's install it, or in other words,
#let's place this book in your library for future reference.

install.packages("lme4")

#Load a package that is already installed, e.g. \lme4"
library(lme4)

#Review the list of functions in that package
library (help=lme4 )
#Read the vignettes listed.
#Read the help on the important functions
?lmer
#Run the examples on the important functions
example (lmer)


#----------------Looking for help
help(mean)
?mean

#if we only know part of the function we can use
apropos("mea")

#some other useful resources
#http://www.rseek.org/ 
#stack exchange
