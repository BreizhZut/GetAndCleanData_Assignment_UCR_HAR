library(dplyr)

datadir <-  "UCI HAR Dataset"
## I renamed the data directory since I don't like spaces in directories
## The next line is commented for the online GitHub repo
## datadir <- gsub(" ","_",datadir)
message(paste("Importing data from:",datadir))
if (!dir.exists("UCI_HAR_Dataset")){
	stop("Data set Directory missing from current Working directory")
} 
## for windows might need sep ="\"
filefeat  <- paste(datadir,"features.txt",sep="/")
if(!file.exists(filefeat)){
	stop("'features.txt' file missing form Data set Directory")	
}
featlabel <- read.table(filefeat,col.names=c("colid","collabel"))	
## Let's reassign it as character vector
featlabel <- as.character(featlabel$collabel)
## Since we are at it might as well rename the labels we need
## create character arrays of patterns an replacements
patarr <- c("()","-","Body","Gravity","Gyro","Jerk")
reparr <- c(""  ,".","B"   ,"Grav"   ,"Gy","Jk")
## We use sub here to replace only the first "-" and keep the -X as is
for(i in 1:length(patarr)){
    ## fixed =TRUE s so that R do not thing that '(',')' are metacharacters
    ## should have been able to do that with mapply but I didn't manage to make it work.
    featlabel <- gsub(patarr[i],reparr[i],featlabel,fixed=TRUE)
}
## Create our selection
labselect <- grep("\\.mean\\.[XYZ]|.mean$|\\.std\\.[XYZ]|.std",featlabel)
message(paste("Number of entries to be extracted data set",length(labselect)))

## Create file names for the train data set
filetrain    <- paste(datadir,"train","X_train.txt",sep="/")
filetrainid  <- paste(datadir,"train","subject_train.txt",sep="/")
filetrainact <- paste(datadir,"train","y_train.txt",sep="/")
## Combine the files into one data frame
message("Reading train data set")
traindata <- tbl_df(read.table(filetrainid,col.names="subject")) %>%
    bind_cols(read.table(filetrainact,col.names="activity")) %>%
    ## we select the columns we want here instead of doing it later to save memory                
    bind_cols(select(tbl_df(read.table(filetrain,col.names=featlabel)),labselect))

## Create file names for the test data set
filetest    <- paste(datadir,"test","X_test.txt",sep="/")
filetestid  <- paste(datadir,"test","subject_test.txt",sep="/")
filetestact <- paste(datadir,"test","y_test.txt",sep="/")
## Combine the files into one data frame
message("Reading test data set")
testdata <- tbl_df(read.table(filetestid,col.names="subject")) %>%
    bind_cols(read.table(filetestact,col.names="activity")) %>%
    ## we select the columns we want here instead of doing it later to save memory                
    bind_cols(select(tbl_df(read.table(filetest,col.names=featlabel)),labselect))

## a message just in case
message("Merging data sets")
fulldata <- bind_rows(testdata,traindata) %>%
    ## since we're at it might as well sort by subject id then activity
    arrange(subject,activity)
### Print size for testing
#message("final check numbers should check out")
#message(paste("test  vs merge(test,full)  nrow ",nrow(merge(testdata,fulldata)),nrow(testdata)))
#message(paste("train vs merge(train,full) nrow ",nrow(merge(traindata,fulldata)),nrow(traindata)))
#message(paste("test  vs merge(test,full)  ncol ",ncol(merge(testdata,fulldata)),ncol(testdata)))
#message(paste("train vs merge(train,full) ncol ",ncol(merge(traindata,fulldata)),ncol(testdata)))
## Delete temporary data
rm(testdata)
rm(traindata)
rm(filetrain);rm(filetrainid);rm(filetrainact)
rm(filetest);rm(filetestid);rm(filetestact)

message("Factoring per subject and activity")
maxAct <- max(fulldata$activity)
## We use the fact that the subject and activity are number to combine them to create levels
fsel <- as.factor((fulldata$subject-1)*maxAct+fulldata$activity)
## We can now use tapply on the full data set
## Start by creating a data frame with tow cols subject and activity
meanfull <- data.frame(
    subject=as.numeric(tapply(fulldata$subject,fsel,unique)),
    activity=as.numeric(tapply(fulldata$activity,fsel,unique)))

message("Computing means per subject and activity")
## use lapply combine with split to compute the means
meanstoend <-
    lapply(split(fulldata[,3:ncol(fulldata)],fsel),function(x) {colMeans(x) %>% signif(digits=10)}) %>% 
           ## Problem is we obtain a list that we need to convert to a data.frame
           ## that needs to be transposed, before reconverted as a dataframe
           as.data.frame() %>% t() %>% as.data.frame()

## Outputting clean tables
## Compute label length for formatting 
labformat <- max(nchar(featlabel[labselect])) + 5
saformat  <- max(nchar(names(meanfull)))

## creating and formating formatting col.names
names(meanfull) <- format(
    names(meanfull),width=saformat,justify ="right")
names(meanstoend) <- format(
    sapply(featlabel[labselect],function(x) {paste0("mean.",x)}),
    width=labformat,justify ="right")

message("Outputting data.frames containing the means of each variable per subject and activity")

## since we write text in the end, we use option quote=FALSE
write.table(format(meanstoend,digits=10,width=labformat),
            file="mean_X_table_per_subject_activity.txt",
            row.names=FALSE,quote=FALSE)

write.table(format(meanfull,width=saformat),
            file="subject_activity.txt",
            row.names=FALSE,quote=FALSE)

meanfull <- bind_cols(meanfull,meanstoend)
rm(meanstoend)
message("Printing combined data frame")
print(meanfull)
