# Human Activity Analysis Dataset

NOTE: Much content from here was taken from the sources at [1] and [2]

## Experiment & Data Set

The source data set was collected from the accelerometers of Samsung Galaxy S smartphones during a range of experiments.

The data set is available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data is proivded by Reyes-Ortiz, Anguita, Ghio, and Oneto from the Smartlab Non Linear Complex Systems Laboratory in Genoa, Italy.


The following acknowledgement is required to use this data:.

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L.  Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012



For more information please visit http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Source Data

The source files used to create the tidy data set are as follows

* `activity_labels.txt`: The activity labels file
* `features.txt`:   All activity features.
* `train/X_train.txt`: Training data set.
* `train/y_train.txt`: Training labels.
* `test/X_test.txt`: Test data set.
* `test/y_test.txt`: Test labels.

NOTE: We do not use the Inertial Signals for this tidy data set.

### Variables

For each measurement the mean, stddev, and mean frequency were calculated and we provided these in final output file

SubjectID: The subject in the experiement
Activity Name: The activty labels provided by the experimentors (WALKING WALKING_UPSTAIRS WALKING_DOWNSTAIRS SITTING STANDING LAYING )

The Rest of the document is defined as follows and is in accordance with the reference provided at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
These variables are defined there and in the features_info.txt provided with the data set

 tBodyAcc_mean_X, tBodyAcc_mean_Y, tBodyAcc_mean_Z, tBodyAcc_std_X, tBodyAcc_std_Y, tBodyAcc_std_Z, tGravityAcc_mean_X, tGravityAcc_mean_Y, tGravityAcc_mean_Z, tGravityAcc_std_X, tGravityAcc_std_Y, tGravityAcc_std_Z, tBodyAccJerk_mean_X, tBodyAccJerk_mean_Y, tBodyAccJerk_mean_Z, tBodyAccJerk_std_X, tBodyAccJerk_std_Y, tBodyAccJerk_std_Z, tBodyGyro_mean_X, tBodyGyro_mean_Y, tBodyGyro_mean_Z, tBodyGyro_std_X, tBodyGyro_std_Y, tBodyGyro_std_Z, tBodyGyroJerk_mean_X, tBodyGyroJerk_mean_Y, tBodyGyroJerk_mean_Z, tBodyGyroJerk_std_X, tBodyGyroJerk_std_Y, tBodyGyroJerk_std_Z, tBodyAccMag_mean, tBodyAccMag_std, tGravityAccMag_mean, tGravityAccMag_std, tBodyAccJerkMag_mean, tBodyAccJerkMag_std, tBodyGyroMag_mean, tBodyGyroMag_std, tBodyGyroJerkMag_mean, tBodyGyroJerkMag_std, fBodyAcc_mean_X, fBodyAcc_mean_Y, fBodyAcc_mean_Z, fBodyAcc_std_X, fBodyAcc_std_Y, fBodyAcc_std_Z, fBodyAcc_meanFreq_X, fBodyAcc_meanFreq_Y, fBodyAcc_meanFreq_Z, fBodyAccJerk_mean_X, fBodyAccJerk_mean_Y, fBodyAccJerk_mean_Z, fBodyAccJerk_std_X, fBodyAccJerk_std_Y, fBodyAccJerk_std_Z, fBodyAccJerk_meanFreq_X, fBodyAccJerk_meanFreq_Y, fBodyAccJerk_meanFreq_Z, fBodyGyro_mean_X, fBodyGyro_mean_Y, fBodyGyro_mean_Z, fBodyGyro_std_X, fBodyGyro_std_Y, fBodyGyro_std_Z, fBodyGyro_meanFreq_X, fBodyGyro_meanFreq_Y, fBodyGyro_meanFreq_Z, fBodyAccMag_mean, fBodyAccMag_std, fBodyAccMag_meanFreq, fBodyBodyAccJerkMag_mean, fBodyBodyAccJerkMag_std, fBodyBodyAccJerkMag_meanFreq, fBodyBodyGyroMag_mean, fBodyBodyGyroMag_std, fBodyBodyGyroMag_meanFreq, fBodyBodyGyroJerkMag_mean, fBodyBodyGyroJerkMag_std, fBodyBodyGyroJerkMag_meanFreq

### Transformations

Training and Test data sets were  merged columnwise and  than the measurements were extracted for mean, standard deviation for each measurement. The headers/Variables were labeled with descriptive names and results were output as an indepenent tidy data set in the ./out directory

