#### part 1 
##Merges the training and the test sets to create one data set.
# read all relevant txt files into dataframe.

ytrain <- read.table("y_train.txt")
xtrain <-read.table("X_train.txt")
subtrain<-read.table("subject_train.txt")


ytest <-read.table("y_test.txt")
xtest <-read.table("X_test.txt")
subtest <-read.table("subject_test.txt")

# combine dataframe into a large dataset

names(subtest) <- "subjectid" 
names(ytest) <- "activity"
testall <-cbind(subtest,ytest,xtest)

names(subtrain) <- "subjectid"
names(ytrain) <-"activity"
trainall <-cbind(subtrain,ytrain,xtrain)

# dataframe with both files in both test and train folder.
all<-rbind(testall,trainall)

#######################################
#Part 2 Extracts only the measurements on the mean and standard 
#deviation for each measurement. 

ft <- read.table("features.txt",stringsAsFactors=F)
head(ft)
# find stirngs in features file that contains mean or std 

sub <- grep("mean|std",ft$V2) # get all feature names that contains mean or std

# use sub to subset dataframe-all. since first two col in "all" are subjectid
# and activity, correposnding col number in all will be sub + 2
sub2 <- sub + 2
allsub <- all[,c(1,2,sub2)] # select columns 
 # name selected columns 

#################
#Part 3 
#Uses descriptive activity names to name the activities in the data set

actnames <- c("walking","walkingup","walkingdown","sitting","standing","laying")

myfun <- function(x) return(actnames[as.numeric(x)])

library(plyr)
allsub <-transform(allsub,activity=myfun(activity))
allsub$activity <- as.factor(allsub$activity)
summary(allsub$activity)

# part 4 Appropriately labels the data set with descriptive variable names.

cn <-ft[(sub),2] # extract corresonding col names from feature.txt 
names(allsub)[3:81] <- cn # assign col names to allsub file.
names(allsub) <-gsub("-|\\(|\\)","",names(allsub))# remove - and ( ) from col names


#Part 5 create a Creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject.

tf <-ddply(allsub,.(subjectid,activity),colwise(mean))

#tf contains 180 rows(30 subjects times 6 activity) and 89 cols (subjectid/activity + 79 
# means of measured variables)
dim(tf) 

# write tf into a txt file.

write.table(tf,file="tidydata.txt",sep=" ",row.names=F,col.names=T)

# use this line to read txt file back into R.
tf2 <-read.table("tidydata.txt",header=T)
dim(tf2)
