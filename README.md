# Getting and Cleaning Data Course Project

## Purpose
The purpose of this repository is to convert raw data into a tidy dataset to make it usable for analysis.

## The Raw Data
The raw data is entitled "Human Activity Recognition Using Smartphones Data Set" and full information about it can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.

In short, 30 subjects have performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist.  The data captured via the accelerometer and gyroscope is gathered into one file for each the training portion of the experiment and the text portion.  The files are named X_training.txt and X_test.txt respectively. 

Each dataset all contains a file containing a list of subjects’ numbers that corresponded to each experiment performed (subject_*.txt) and a list of activity numbers that correspond to each activity performed.

In addition, there is a features.txt file that maps each captured variable with each column in X_*.txt and a activity_labels.txt file that maps each activity number with a description.

## The Tidy Dataset
1. First, I read in each dataset (X_train.txt and X_test.txt) and append their subject and activity columns to each dataset.
1. Then, I combine both sets into one.
1. Next, I remove all columns that don't apply to either the mean or standard deviation of the captured data.
1. Then, I apply the activity labels to the column headers.
1. Then, I reshape the data into a dataset representing the average of all the data elements and save it to tidy.txt.
