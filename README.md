#GetAndCleanData\_Assignment\_UCR\_HAR

Coursera Course Project: <br \>Data Science: Getting And Cleaning Data<br \>
Author : Dylan Tweed<br />Date   : 05/03/2016

## Assignment

###Objectives

1. The submitted data set is tidy.
1. The Github repo contains the required scripts.
1. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
1. The README that explains the analysis files is clear and understandable.
1. The work submitted for this project is the work of the student who submitted it.

###Method

I should have created one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
###Content
This repository contains:

1. A tidy data set as described below, written as 2 files:  
	* `subject_activity.txt`: Contains the subject and activity entries as integer
	* `mean_X_table_per_subject_activity.txt`: Contains the mean of each processed data per subject and activity
	* `assignment_output.txt`: Combines both previous outputs
2. A script for performing the analysis: `run_analysis.R`
3. A code book that describes the variables, the data, and any transformations or work performed to clean up the data called `CodeBook.md`

Remark: the tidy data set provided here is separate in two file, since (1) one file should contain only the mean of each variable, (2) we stick to the organisation of the  original data, the subject id and Activity written as id should be kept separate as integers.

## Script `run_analysis.R`

###Description

1. Reads the tidy original data set from directory: <br />`UCI HAR Dataset/`.<br />
1. Computes the mean of selected variables per subject and activity form both original sample: <br /> `UCI HAR Dataset/test/` and `UCI HAR Dataset/train/`<br />
1. Outputs result as ASCII files, row names are omitted, columns names are included within a 1 line header. The two files are the folling: 
	* `subject_activity.txt`: Contains the subject and activity entries as integer
	* `mean_X_table_per_subject_activity.txt`: Contains the mean of each processed data per subject and activity
	* `assignment_output.txt`: Combines both previous outputs
1. Prints the combined `data.frame`

###Requirement

* package `dplyr` is loaded by the script, so it has to be installed before running the script
* The working directory must contain the original data directory: <br />`UCI HAR Dataset/`
* Script was tested with `R version 3.2.4 (2016-03-10) -- "Very Secure Dishes"` on `Mac OS X version 10.11.4`

###Usage

If the working directory does not contains the script, (1) defining the variable `script_dir` corresponding to the path to the directory containing the script, either from the working directory or the root directory `/`, (2) source the script as follows:<br />
`source(paste0(script_dir,"/run_analysis.R"))`<br />
If the working directory contains the script simply use:<br />
`source("run_analysis.R")`<br \>
Obtaining in the `R` console:

```{r}
Importing data from: UCI HAR Dataset
Number of entries to be extracted data set 66
Reading train data set
Reading test data set
Merging data sets
Factoring per subject and activity
Computing means per subject and activity
Outputting data.frames containing the means of each variable per subject and activity
Printing combined data frame
Source: local data frame [180 x 68]

    subject activity     mean.tBAcc.mean.X     mean.tBAcc.mean.Y     mean.tBAcc.mean.Z      mean.tBAcc.std.X
      (dbl)    (dbl)                 (dbl)                 (dbl)                 (dbl)                 (dbl)
1         1        1             0.2773308          -0.017383819            -0.1111481           -0.28374026
2         1        2             0.2554617          -0.023953149            -0.0973020           -0.35470803
3         1        3             0.2891883          -0.009918505            -0.1075662            0.03003534
4         1        4             0.2612376          -0.001308288            -0.1045442           -0.97722901
5         1        5             0.2789176          -0.016137590            -0.1106018           -0.99575990
6         1        6             0.2215982          -0.040513953            -0.1132036           -0.92805647
7         2        1             0.2764266          -0.018594920            -0.1055004           -0.42364284
8         2        2             0.2471648          -0.021412113            -0.1525139           -0.30437641
9         2        3             0.2776153          -0.022661416            -0.1168129            0.04636668
10        2        4             0.2770874          -0.015687994            -0.1092183           -0.98682228
..      ...      ...                   ...                   ...                   ...                   ...
Variables not shown: mean.tBAcc.std.Y (dbl), mean.tBAcc.std.Z (dbl), mean.tGravAcc.mean.X (dbl), mean.tGravAcc.mean.Y
  (dbl), mean.tGravAcc.mean.Z (dbl), mean.tGravAcc.std.X (dbl), mean.tGravAcc.std.Y (dbl), mean.tGravAcc.std.Z (dbl),
  mean.tBAccJk.mean.X (dbl), mean.tBAccJk.mean.Y (dbl), mean.tBAccJk.mean.Z (dbl), mean.tBAccJk.std.X (dbl),
  mean.tBAccJk.std.Y (dbl), mean.tBAccJk.std.Z (dbl), mean.tBGy.mean.X (dbl), mean.tBGy.mean.Y (dbl), mean.tBGy.mean.Z
  (dbl), mean.tBGy.std.X (dbl), mean.tBGy.std.Y (dbl), mean.tBGy.std.Z (dbl), mean.tBGyJk.mean.X (dbl), mean.tBGyJk.mean.Y
  (dbl), mean.tBGyJk.mean.Z (dbl), mean.tBGyJk.std.X (dbl), mean.tBGyJk.std.Y (dbl), mean.tBGyJk.std.Z (dbl),
  mean.tBAccMag.mean (dbl), mean.tBAccMag.std (dbl), mean.tGravAccMag.mean (dbl), mean.tGravAccMag.std (dbl),
  mean.tBAccJkMag.mean (dbl), mean.tBAccJkMag.std (dbl), mean.tBGyMag.mean (dbl), mean.tBGyMag.std (dbl),
  mean.tBGyJkMag.mean (dbl), mean.tBGyJkMag.std (dbl), mean.fBAcc.mean.X (dbl), mean.fBAcc.mean.Y (dbl), mean.fBAcc.mean.Z
  (dbl), mean.fBAcc.std.X (dbl), mean.fBAcc.std.Y (dbl), mean.fBAcc.std.Z (dbl), mean.fBAccJk.mean.X (dbl),
  mean.fBAccJk.mean.Y (dbl), mean.fBAccJk.mean.Z (dbl), mean.fBAccJk.std.X (dbl), mean.fBAccJk.std.Y (dbl),
  mean.fBAccJk.std.Z (dbl), mean.fBGy.mean.X (dbl), mean.fBGy.mean.Y (dbl), mean.fBGy.mean.Z (dbl), mean.fBGy.std.X (dbl),
  mean.fBGy.std.Y (dbl), mean.fBGy.std.Z (dbl), mean.fBAccMag.mean (dbl), mean.fBAccMag.std (dbl), mean.fBAccJkMag.mean
  (dbl), mean.fBAccJkMag.std (dbl), mean.fBGyMag.mean (dbl), mean.fBGyMag.std (dbl), mean.fBGyJkMag.mean (dbl),
  mean.fBGyJkMag.std (dbl)
Outputting the combined data from data.frame
```

Output can be red as follows:

```{r}
##Reading each files as separate frames
subject_activity <- read.table("subject_activity.txt",header=TRUE)
stats_mean <-read.table("mean_X_table_per_subject_activity.txt",header=TRUE)
```
Or alternativelly:

```{r}
##Reading both files into a single frames.
stats_mean <- read.table("subject_activity.txt",header=TRUE) %>% 
    bind_cols(read.table("mean_X_table_per_subject_activity.txt",header=TRUE))
##Print the result
tbl_df(stats_mean)
```
Or even with the additionnal combined output:

```{r}
tbl_df(read.table("assignment_output.txt",header=TRUE))
```

```{r}
Source: local data frame [180 x 68]

   subject activity mean.tBAcc.mean.X mean.tBAcc.mean.Y mean.tBAcc.mean.Z mean.tBAcc.std.X mean.tBAcc.std.Y
     (int)    (int)             (dbl)             (dbl)             (dbl)            (dbl)            (dbl)
1        1        1         0.2773308      -0.017383819        -0.1111481      -0.28374026      0.114461337
2        1        2         0.2554617      -0.023953149        -0.0973020      -0.35470802     -0.002320265
3        1        3         0.2891883      -0.009918505        -0.1075662       0.03003534     -0.031935943
4        1        4         0.2612376      -0.001308288        -0.1045442      -0.97722901     -0.922618642
5        1        5         0.2789176      -0.016137590        -0.1106018      -0.99575990     -0.973190056
6        1        6         0.2215982      -0.040513953        -0.1132036      -0.92805647     -0.836827406
7        2        1         0.2764266      -0.018594920        -0.1055004      -0.42364284     -0.078091253
8        2        2         0.2471648      -0.021412113        -0.1525139      -0.30437641      0.108027280
9        2        3         0.2776153      -0.022661416        -0.1168129       0.04636668      0.262881789
10       2        4         0.2770874      -0.015687994        -0.1092183      -0.98682228     -0.950704499
..     ...      ...               ...               ...               ...              ...              ...
Variables not shown: mean.tBAcc.std.Z (dbl), mean.tGravAcc.mean.X (dbl), mean.tGravAcc.mean.Y (dbl), mean.tGravAcc.mean.Z
  (dbl), mean.tGravAcc.std.X (dbl), mean.tGravAcc.std.Y (dbl), mean.tGravAcc.std.Z (dbl), mean.tBAccJk.mean.X (dbl),
  mean.tBAccJk.mean.Y (dbl), mean.tBAccJk.mean.Z (dbl), mean.tBAccJk.std.X (dbl), mean.tBAccJk.std.Y (dbl),
  mean.tBAccJk.std.Z (dbl), mean.tBGy.mean.X (dbl), mean.tBGy.mean.Y (dbl), mean.tBGy.mean.Z (dbl), mean.tBGy.std.X (dbl),
  mean.tBGy.std.Y (dbl), mean.tBGy.std.Z (dbl), mean.tBGyJk.mean.X (dbl), mean.tBGyJk.mean.Y (dbl), mean.tBGyJk.mean.Z
  (dbl), mean.tBGyJk.std.X (dbl), mean.tBGyJk.std.Y (dbl), mean.tBGyJk.std.Z (dbl), mean.tBAccMag.mean (dbl),
  mean.tBAccMag.std (dbl), mean.tGravAccMag.mean (dbl), mean.tGravAccMag.std (dbl), mean.tBAccJkMag.mean (dbl),
  mean.tBAccJkMag.std (dbl), mean.tBGyMag.mean (dbl), mean.tBGyMag.std (dbl), mean.tBGyJkMag.mean (dbl), mean.tBGyJkMag.std
  (dbl), mean.fBAcc.mean.X (dbl), mean.fBAcc.mean.Y (dbl), mean.fBAcc.mean.Z (dbl), mean.fBAcc.std.X (dbl),
  mean.fBAcc.std.Y (dbl), mean.fBAcc.std.Z (dbl), mean.fBAccJk.mean.X (dbl), mean.fBAccJk.mean.Y (dbl), mean.fBAccJk.mean.Z
  (dbl), mean.fBAccJk.std.X (dbl), mean.fBAccJk.std.Y (dbl), mean.fBAccJk.std.Z (dbl), mean.fBGy.mean.X (dbl),
  mean.fBGy.mean.Y (dbl), mean.fBGy.mean.Z (dbl), mean.fBGy.std.X (dbl), mean.fBGy.std.Y (dbl), mean.fBGy.std.Z (dbl),
  mean.fBAccMag.mean (dbl), mean.fBAccMag.std (dbl), mean.fBAccJkMag.mean (dbl), mean.fBAccJkMag.std (dbl),
  mean.fBGyMag.mean (dbl), mean.fBGyMag.std (dbl), mean.fBGyJkMag.mean (dbl), mean.fBGyJkMag.std (dbl)
```