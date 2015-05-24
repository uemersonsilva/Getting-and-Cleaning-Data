# CodeBook

This is a code book that describes the variables and the data used to 
Getting and Cleaning Data Course Assignment 

## The data source

Original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Original description of the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Libraries Used

library("data.table")
library("reshape2")

## The data

The dataset includes the following files:
        
- 'README.txt'
- 'features_info.txt'
- 'features.txt'
- 'activity_labels.txt'
- 'train/X_train.txt'
- 'train/y_train.txt'
- 'test/X_test.txt'
- 'test/y_test.txt'
- 'train/subject_train.txt'
- 'train/Inertial Signals/total_acc_x_train.txt'
- 'train/Inertial Signals/body_acc_x_train.txt'
- 'train/Inertial Signals/body_gyro_x_train.txt'

The result of Get and Cleanning data is the file:
        
- 'tidy_dataset.txt'        
