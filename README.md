# Getting and Cleaning Data Course Project

This repository houses the course project for Getting and Cleaning Data.

The run_analysis.R script contains the R code for taking the raw data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and producing the tidy data set found in output.txt. To use the script, ensure that the Samsung data is in your working directory, call source('run_analysis.R') (referencing the run_analysis.R file in this repository), and then call run_analysis(). The function will complete and write output.txt to the working directory.

In this repository you will also find CodeBook.md, which describes the variables, data, and transformations to clean up the data.