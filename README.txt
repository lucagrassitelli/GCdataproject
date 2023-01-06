# GCdataproject

Files in this repo
------------------


README.md -- you are reading it right now
CodeBook.md -- codebook describing variables, the data and transformations
run_analysis.R -- actual R code


Description of abbreviations of measurements:
------------------


*Leading t or f is based on time or frequency measurements. *Body = related to body movement. *Gravity = acceleration of gravity *Acc = accelerometer measurement *Gyro = gyroscopic measurements *Jerk = sudden movement acceleration *Mag = magnitude of movement *mean and SD are calculated for each subject for each activity for each mean and SD measurements.

The units given are g’s for the accelerometer and rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector for each pattern: ‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions. They total 33 measurements including the 3 dimensions - the X,Y, and Z axes.


Information about the R scripts used for the data cleaning project
------------------

# Run_analysis.R

This is the main script that is called to performed the cleaning and tidying of the dataset as described in the excercise and listed below.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


It includes a function "return_dataframe_data" returning a combined data-frame of the whole train or test sets with associated subjects and activities. 
It binds the two datasets together, sort the dataset by subject, define a vector with the indeces of the names including mean and std, and subsets the dataframe,Replace the activities' factor for a more descriptive variable.
It group the dataframe based on subject and activity, and returns a dataframe with the mean of each remaining column listed in the Codebook.txt attached. See the script itself for further informations
