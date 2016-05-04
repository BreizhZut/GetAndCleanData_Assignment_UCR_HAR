#Code Book

Coursera Course Project: <br \>Data Science: Getting And Cleaning Data<br \>
Author : Dylan Tweed<br />Date   : 05/03/2016

## Data sets

### Unprocessed tidy data

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:<br />
[archive.ics.uci.edu:Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)<br />
Here are the data for the project:<br />
[UCI HAR dataset (zip archive)](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The dataset was published in [^data], the directory we downloaded contains:

1.  code book
	* `activity_labels.txt`: give the code (range 1:6) indexing 	for activity (integer to character)
	* `feature_info.txt`: Describe the measurements, units
	* `feature.txt`: List of feature variables (561 entries)
1. `train/`: Directory containing the training data set, contains
	* `X_train.txt`: nicely formatted ascii file containing a table of values, each columns being a statistical values of a given feature, for a given session. 
	* `y_train.txt`: list of indexes (range 1:6, same number of lines as `X_train.txt`)
	* `subject_train`: list of indexes (same number of lines as `X_train.txt`)
	* `Inertial Signal/`: Directory containing the data as 9 text files
		* Each file correspond to one variable
		* Each file contains the same number of raws as the others
		* These files are the initial measurements, later processed with statistical tool to obtain `X_train.txt`
1. `test/`: Directory containing the test data set. With similar files as the `train` dataset.
  * `X_test.txt`: Same as `X_train.txt`, with different number of rows
  * `y_test.txt`: Same as `y_train.txt`, with different number of rows
  * `subject_test`: Same as `y_train.txt`, with different subject ids and different number of rows
  * `Inertial Signal/`: Directory containing the data as 9 text files same as in `train/`
     

### Processed tidy data

* `subject_activity.txt`: Contains the subject and activity entries as integer
* `mean_X_table_per_subject_activity.txt`: Contains the mean of each processed data per subject and activity
* `assignment_output.txt`: Combines both previous outputs

#### Featured measurments

Each feature  measurement start either with  `t`; denoting the time domain signals or `f`: donoting the Fast Fourier Transform (FFT) of the time domain  signals. Informations regarding these measurements were inferred from the code book provided with the data as files `README.txt` and `feature_info.txt`. We refer to those documents for more detail and more accurate interpretations of the data.<br \>
Additionally, in order to create the files the measurements names were rewritten as following:

1. `tBodyAcc`: `tBAcc` Triaxial acceleration from the accelerometer: estimated body acceleration component. Units: Normalised vector. 
1. `tGravityAcc`: `tGravAcc` Triaxial acceleration from the accelerometer: estimated gravity acceleration component. Units: Normalised vector. 
1. `tBodyAccJerk`: `tBAccJk` Time derivation of `tBodyAcc` Units: Normalised vector. 
1. `tBodyGyro`: `tBGy` Triaxial Angular velocity from the gyroscope. Units: Normalised vector. 
1. `tBodyGyroJerk`: `tBGyJk` Time derivation of `tBodyGyro`. Units: Normalised vector. 
1. `tBodyAccMag`: `tBAccMag`  Euclidean norm magnitude of `tBodyAcc` . Units: gravity units 'g' ( gravity subtracted)
1. `tGravityAccMag`: `tGravAccMag` Euclidean norm magnitude of `tGravAcc`. Units: gravity units 'g' ( gravity subtracted)
1. `tBodyAccJerkMag`: `tBAccJkMag` Euclidean norm magnitude of `tBodyAccJerk` Euclidean norm magnitude of `tBodyAcc` . Units: gravity units 'g'/second
1. `tBodyGyroMag`: `tBGyMag` Euclidean norm magnitude of `tBodyGyro' 
Units:  radians/second. 
1. `tBodyGyroJerkMag`: `tBGyJkMag` Euclidean norm magnitude of `tBodyGyroJerk`. Units:  radians/second/second. 
1. `fBodyAcc`: `fBAcc` FFT of `tBodyAcc`. Units: Normalised vector. 
1. `fBodyAccJerk`: `fBAccJk` FFT of `tBodyAccJerk`. Units: Normalised vector. 
1. `fBodyGyro`: `fBGy` FFT of `tBodyGyro`. Units: Normalised vector. 
1. `fBodyAccMag`: `fBAccMag` FFT of `tBodyAccMag`. 
1. `fBodyBodyAccJerkMag` or `fBodyBodyAccJerkMag`: `fBAccJkMag` FFT of `tBodyAccJerkMag`
1. `fBodyBodyGyroMag` or `fBodyGyroMag`: `fBGyMag` FFT of `tBodyGyroMag`
1. `fBodyBodyGyroJerkMag` or `fBodyGyroJerkMag`: `fBGyJkMag` FFT of `tBodyGyroJerkMag`B

As stated in the README, each features were normalized and bounded within [-1,1]. We interpreted this statement as a renormalization of each vector variable. The units described here are own interpretation of what they ought to be, provided we understood their method and data.

We refer to the code book of the original data set `feature_info.txt`. For each of this measure, multiple statistical operation were performed by the original author. We extract from the relevant files, 
`X_train.txt` and `X_test.txt` only the following: 

1. `.mean.X`Mean[^mean] of the X direction of the vector, taken across time (`t`) of frequencies (`f`) 
1. `.mean.Y`Same as `.mean.X` for the Y direction of the vector
1. `.mean.Z`Same as `.mean.X` for the Z direction of the vector
1. `.std.X`Standard deviation to the mean[^std] of the X direction of the vector, taken across time (`t`) of frequencies (`f`) 
1. `.std.Y` Same as `.std.X` for the Y direction of the vector
1. `.std.Z` Same as `.std.X` for the Z direction of the vector
1. `.mean`Mean of the norm of the vector
1. `.std`Standard deviation to the mean of he norm of the vector

#### `subject_activity.txt`

This file is a table containing two columns, each rows is a different combinaison of subject and activity as found in the initial data sample. The columns correspond to the following:

1. `subject`: id of the subject. integer ranging from 1 to 30, ordered.
1. `activity`: integer ranging from 1 to 6, ordered fir a given subject id. labels correspond to the following activities (see `activity_labels.txt`):
   * `1` WALKING
   * `2` WALKING_UPSTAIRS
   * `3` WALKING_DOWNSTAIRS
   * `4` SITTING
   * `5` STANDING
   * `6` LAYING

#### `mean_X_train_per_subject_activity.txt`

This file is a table containing 66 columns, each rows is a different combinaison of subject and activity as found in the initial data sample. 
Each columns correspond to the mean of a given feature statistical measurement for a given subject and activity. Hence the `mean.`
heading for each column name. <br />
The columns correspond to the following:

1. `    mean.tBAcc.mean.X` 
1. `    mean.tBAcc.mean.Y` 
1. `    mean.tBAcc.mean.Z` 
1. `     mean.tBAcc.std.X` 
1. `     mean.tBAcc.std.Y` 
1. `     mean.tBAcc.std.Z` 
1. ` mean.tGravAcc.mean.X` 
1. ` mean.tGravAcc.mean.Y` 
1. ` mean.tGravAcc.mean.Z` 
1. `  mean.tGravAcc.std.X` 
1. `  mean.tGravAcc.std.Y` 
1. `  mean.tGravAcc.std.Z` 
1. `  mean.tBAccJk.mean.X` 
1. `  mean.tBAccJk.mean.Y` 
1. `  mean.tBAccJk.mean.Z` 
1. `   mean.tBAccJk.std.X` 
1. `   mean.tBAccJk.std.Y` 
1. `   mean.tBAccJk.std.Z` 
1. `     mean.tBGy.mean.X` 
1. `     mean.tBGy.mean.Y` 
1. `     mean.tBGy.mean.Z` 
1. `      mean.tBGy.std.X` 
1. `      mean.tBGy.std.Y` 
1. `      mean.tBGy.std.Z` 
1. `   mean.tBGyJk.mean.X` 
1. `   mean.tBGyJk.mean.Y` 
1. `   mean.tBGyJk.mean.Z` 
1. `    mean.tBGyJk.std.X` 
1. `    mean.tBGyJk.std.Y` 
1. `    mean.tBGyJk.std.Z` 
1. `   mean.tBAccMag.mean` 
1. `    mean.tBAccMag.std` 
1. `mean.tGravAccMag.mean` 
1. ` mean.tGravAccMag.std` 
1. ` mean.tBAccJkMag.mean` 
1. `  mean.tBAccJkMag.std` 
1. `    mean.tBGyMag.mean` 
1. `     mean.tBGyMag.std` 
1. `  mean.tBGyJkMag.mean` 
1. `   mean.tBGyJkMag.std` 
1. `    mean.fBAcc.mean.X` 
1. `    mean.fBAcc.mean.Y` 
1. `    mean.fBAcc.mean.Z` 
1. `     mean.fBAcc.std.X` 
1. `     mean.fBAcc.std.Y` 
1. `     mean.fBAcc.std.Z` 
1. `  mean.fBAccJk.mean.X` 
1. `  mean.fBAccJk.mean.Y` 
1. `  mean.fBAccJk.mean.Z` 
1. `   mean.fBAccJk.std.X` 
1. `   mean.fBAccJk.std.Y` 
1. `   mean.fBAccJk.std.Z` 
1. `     mean.fBGy.mean.X` 
1. `     mean.fBGy.mean.Y` 
1. `     mean.fBGy.mean.Z` 
1. `      mean.fBGy.std.X` 
1. `      mean.fBGy.std.Y` 
1. `      mean.fBGy.std.Z` 
1. `   mean.fBAccMag.mean` 
1. `    mean.fBAccMag.std` 
1. `mean.fBAccJkMag.mean` 
1. ` mean.fBAccJkMag.std` 
1. `   mean.fBGyMag.mean` 
1. `    mean.fBGyMag.std` 
1. ` mean.fBGyJkMag.mean` 
1. `  mean.fBGyJkMag.std` 

#### `assignment_output.txt`

This is an additional output for the project submission.<br />
It is similar to `mean_X_train_per_subject_activity.txt` with the `subject` and `activity` variables added as the first two rows. 

## Implementation

As we could see the data itself is clean and well organised. For this assignment we don't have to deal with messy data or Weird data.frames.

### Organising each sample into data.frame

We simply have to: 
1. Read the relevant files to get the labels. Might as well rename them.
1. Read extra column from extra files (those with integers that could not be put as a table). 
1. Read the relevant table, and combine 
1. Combine all into a nice and clean data.frame

### Reading the labels, and create label selection

Columns names are written in `feature.txt`

```{r}
## Create labels variables
featlabel <- read.table("feature.txt",col.names=c("colid","collabel"))	
## Let's reassign it as character vector
featlabel <- as.character(featlabel$collabel)

## Since we are at it might as well rename the labels we need
## create character arrays of patterns an replacements
patarr <- c("()","-","BodyBody","Body","Gravity","Gyro","Jerk")
reparr <- c(""  ,".","B","B"   ,"Grav"   ,"Gy","Jk")

## We use sub here to replace only the first "-" and keep the -X as is
for(i in 1:length(patarr)){
    ## fixed =TRUE s so that R do not thing that '(',')' are metacharacters
    ## should have been able to do that with mapply but I didn't manage to make it work.
    featlabel <- gsub(patarr[i],reparr[i],featlabel,fixed=TRUE)
}

## Create our selection
labselect <- grep("\\.mean\\.[XYZ]|.mean$|\\.std\\.[XYZ]|.std",featlabel)
```

### For each data set combine table into one data.frame 

```{r}
## We use bind_cols to add columns one after the other
traindata <- tbl_df(read.table("train/subject_train.txt",col.names="subject")) %>%
    bind_cols(read.table("train/y_train.txt",col.names="activity")) %>%
    ## we select the columns we want here instead of doing it later to save memory                
    bind_cols(select(tbl_df(read.table("train/y_train.txt",col.names=featlabel)),labselect))
```

```{r}
## We use bind_cols to add columns one after the other
testdata <- tbl_df(read.table("test/subject_test.txt",col.names="subject")) %>%
    bind_cols(read.table("test/y_test.txt",col.names="activity")) %>%
    ## We select the columns we want here instead of doing it later to save memory                
    bind_cols(select(tbl_df(read.table("test/y_test.txt",col.names=featlabel)),labselect))
```

### Merge the two sets.

<p>Initialy we though that we add to use merge, taking "subject" and "activity" to match rows.
Actually the two data sets contains different subject. Supposedly the data was split into a training set and a test. for machine learning purposes. So the idea there is to combine the two independent data set into a sigle one. Since both data set contains the same number of columns, and that we make sure to get the same one in both sets. It is quite strait-forward.
</p> 

```{r}
## Merge data as one data.frame
fulldata <- bind_rows(testdata,traindata) %>%
    ## since we're at it might as well sort by subject id then activity
    arrange(subject,activity)
```

### Factor as subject then activity

<p>We use the fact that the subject and activity are number to combine them to create levels</p>	

```{r}
## Build factor variable
maxAct <- max(fulldata$activity)
fsel <- as.factor((fulldata$subject-1)*maxAct+fulldata$activity)
```

### Use the factor to compute the means for each variables

<p>We start a data.frame with columns subject and activity. We tapply the function unique using our factor</p>

```{r}
## Create the data.frame with the subject and activity columns
meanfull <- data.frame(
	subject=as.numeric(tapply(fulldata$subject,fsel,unique)),
 	activity=as.numeric(tapply(fulldata$activity,fsel,unique)))
```

<p> We create a second data.frame with the means. We first split the part of the full data.frame containing the variables according to our factor. And use colMeans withlapply. We get a list that once converted into a data.frame needs to be transposed with t(). Once it is reconverted from a matrix to a data.frame(), we use bind_cols to merge it with the first data.frame.</p>

```{r}
## Use lapply combine with split the data 
## and compute the means of each column with colMeans
meanstoend <- lapply(split(fulldata[,3:ncol(fulldata)],fsel),colMeans) %>%
    ## transposing the result into a usable data.frame
    as.data.frame() %>% t() %>% as.data.frame()

## merging with the previous data.frame
meanfull <- bind_cols(meanfull,meanstoend)
```

###Outputs

We produce two output (ASCII files) for completing this project:

1. `subject_activity.txt`: Contains the subject and activity entries as integer
1. `mean_X_table_per_subject_activity.txt`: Contains the mean of each processed data per subject and activity

####Formatting

As we like well formatted output we extensively use the `format` command.

```{r}
## Compute label length for formatting
saformat  <- max(nchar(names(meanfull)))
## We add 5 to the length since we add ".mean" to the label  
labformat <- max(nchar(featlabel[labselect])) + 5

## creating and formatting formatting col.names
names(meanfull) <- format(
    names(meanfull),width=saformat,justify ="right")
names(meanstoend) <- format(
    sapply(featlabel[labselect],function(x) {paste0("mean.",x)}),
    width=labformat,justify ="right")
```

####Outputting

```{r}
## Since we write text in the end, we use option quote=FALSE
write.table(format(meanstoend,digits=10,width=labformat),
            file="mean_X_table_per_subject_activity.txt",
            row.names=FALSE,quote=FALSE)

write.table(format(meanfull,width=saformat),
            file="subject_activity.txt",
            row.names=FALSE,quote=FALSE)
```

####Printing final combined `data.frame`

```{r}
## Combining the cols of the data.frame
meanfull <- bind_cols(meanfull,meanstoend)
## Printing result
print(meanfull)
```

[^data]: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
[^mean]: We measure the mean of means, the value we extracted is probably statistically relevant.
[^std]: We measure the mean of standard deviation, the value we extracted is not statistically relevant. To extract a standard deviation we should use quadratic means

####Reformating and Outputting the final combined `data.frame` for submission
```{r}
names(meanfull) <- format(
    names(meanfull),width=labformat,justify ="right")
write.table(format(meanfull,width=labformat),
            file="assignment_output.txt",
            row.names=FALSE,quote=FALSE)
```

##Acknowledgment

I personally thank Tzu-Ping Chung for creating and sharing the open Source software [MacDown](http://macdown.uranusjr.com/]) for Mac Os X. It greatly simplified and improved the writing of all the Markdown documentation for this assignment.
