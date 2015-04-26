# Getting-and-cleaning-data

This is a repo with the R-file for the peer assesment of Coursera Getting and cleaning data in the datascience track
In this readme you can find the different steps to execute this assignment. The download of the data and the R-file which is located in this repo as well.


## Step 1: Download
*	Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
*	Rename the folder to "data".

## Step 2: Preparation
*	Make sure the folder "data" and the run_analysis.R script are both in the current working directory.

## Step 3: Execution
* Run R function: source("run_analysis.R") command in RStudio
* You will find two output files are generated in the current working directory:
	* cleaned_data.txt (8.3 Mb): a data frame called cleanedData with 10299*68 dimension.
	* cleaned_mean.txt (225 Kb): a data frame called meanData with 180*68 dimension.

## Step 4: Validation
* use data <- read.table("cleaned_mean.txt") command in RStudio to read the file.
* there are 6 activities in total and 30 subjects in total, we have 180 rows with all combinations for each of the 66 features.
