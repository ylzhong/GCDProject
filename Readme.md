#Readme for tidydata 
========================================================

## Part 1 Merges the training and the test sets to create one data set.

First step is to read all the relevant files into R. In order to simplify the code and avoiding confusion. I copied all needed files into the working directory. 


```r
list.files()
```

```
##  [1] "activity_labels.txt" "cache"               "features.txt"       
##  [4] "Readme.html"         "Readme.md"           "Readme.Rmd"         
##  [7] "subject_test.txt"    "subject_train.txt"   "tidydata.txt"       
## [10] "X_test.txt"          "X_train.txt"         "y_test.txt"         
## [13] "y_train.txt"
```

Read relevant txt files into r


```r
ytrain <- read.table("y_train.txt")
xtrain <-read.table("X_train.txt")
subtrain<-read.table("subject_train.txt")

ytest <-read.table("y_test.txt")
xtest <-read.table("X_test.txt")
subtest <-read.table("subject_test.txt")
```

Combine dataframes .I first combine files in test and train separately using  cbind() (resulting dataframe are testall and  trainall . Then I use rbind() to combine testall and trianall to a large dataset(all) containing all the observations of all 561 variables. Hence, the first part is done.


```r
names(subtest) <- "subjectid" 
names(ytest) <- "activity"
testall <-cbind(subtest,ytest,xtest)

names(subtrain) <- "subjectid"
names(ytrain) <-"activity"
trainall <-cbind(subtrain,ytrain,xtrain)
all<-rbind(testall,trainall)
```

To make sure everything looks right, check the dimension of dataset.  


```r
dim(testall)
```

```
## [1] 2947  563
```

```r
dim(trainall)
```

```
## [1] 7352  563
```

```r
dim(all)
```

```
## [1] 10299   563
```
## Part 2 Extracts only the measurements on the mean and standard deviation for each measurement. 

The column names for 561 measured variables are in feature.txt. What I have done for this step were :
1.    Read in feature.txt 
2.	 Use grep function to get all feature names that contain either mean or std. I include columns contain meanfeq as well and I am aware of that. My logical is that it is better to include everything that has something to do with mean and std. I can always drop them if I dont need them. However, adding them back in after I have the tidy dataset is too much work.
3.	Using the return value of grep function (stored in vector sub) to select corresponding columns from dataset all. Since the first two columns of dataset all are subjectid and activity, so I use sub+2 to get correct column index for subseting. 



```r
ft <- read.table("features.txt",stringsAsFactors=F)
# find stirngs in features file that contains mean or std 
head(ft)
```

```
##   V1                V2
## 1  1 tBodyAcc-mean()-X
## 2  2 tBodyAcc-mean()-Y
## 3  3 tBodyAcc-mean()-Z
## 4  4  tBodyAcc-std()-X
## 5  5  tBodyAcc-std()-Y
## 6  6  tBodyAcc-std()-Z
```

```r
sub <- grep("mean|std",ft$V2) # get all feature names that contains mean or std
# use sub to subset dataframe-all. since first two col in "all" are subjectid
# and activity, correposnding col number in all will be sub + 2
sub2 <- sub + 2
allsub <- all[,c(1,2,sub2)] # select columns 
dim(allsub) # check dimension of the new dataframe
```

```
## [1] 10299    81
```

## Part 3 Uses descriptive activity names to name the activities in the data set

For this part what I have done were:
1.    Store activity label into a char vector call actnames
2.	Write a function that takes input from activity column and return the corresponding activity
3.	Applied the function to all rows in activity column using transform function in plyr package.   This step is to transform activity numbers to its corresponding descriptive names. 
4.	Label values in activity columns as factors. 


```r
#step 1
actnames <- c("walking","walkingup","walkingdown","sitting","standing","laying")
#step 2
myfun <- function(x) return(actnames[as.numeric(x)])
#step 3
library(plyr)
allsub <-transform(allsub,activity=myfun(activity))
allsub$activity <- as.factor(allsub$activity)
# display summary of activity column
summary(allsub$activity)
```

```
##      laying     sitting    standing     walking walkingdown   walkingup 
##        1944        1777        1906        1722        1406        1544
```

## part 4 Appropriately labels the data set with descriptive variable names.

For this part, I think the names of variables from the "feature.txt"" were descriptive enough, so I decided to use those as my column names. Then I removed  and () from colnames to make them tidy.


```r
cn <-ft[(sub),2] # extract corresonding col names from feature.txt 
names(allsub)[3:81] <- cn # assign col names to allsub file.
names(allsub) <-gsub("-|\\(|\\)","",names(allsub))# remove - and ( ) from col names
```
## Part 5 create a Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

For this part, I used colwise operation (apply function to all (or selected) columns) in plyr package combined with ddply to get the mean of each variable for each activity and each subject in one dataset. If you are not familiar with those functions, please refer to documentation of the plyr packages.   tf contains 180 rows(30 subjects *  6 activity) and 89 columns ( subjectid/activity + 79 measured variables).  I consider tf as a tidy dataset because each column only contains one variable and column names are descriptive. Then I used wirte.table() function to write the resulting dataset into a txt file. 


```r
tf <-ddply(allsub,.(subjectid,activity),colwise(mean))
#check the dim of tf
dim(tf) 
```

```
## [1] 180  81
```

```r
# write tf into a txt file.
write.table(tf,file="tidydata.txt",sep=" ",row.names=F,col.names=T)
```

## Final part: please use following line to read txt file I submitted through coursera if you want to check the correctness of my submitted file. 


```r
tf2 <-read.table("tidydata.txt",header=T)
dim(tf2)
```

```
## [1] 180  81
```

