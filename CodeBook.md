# Code Book

This file describes the data, variables and transformations performed to create a tidy dataset.



### Original Data

The data were generated within the scope of an experiment to recognize Human activity patterns by data collected from sensors commonly found in modern smartphones. A description of the experimental setup can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#).

Each of 30 volunteers performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone. Using the embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity data were captured.
All measurements are normalized and bounded within -1 and 1.

The original dataset was downloaded [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) on March 01, 2016. The archive contained the following directory structure and files:

```sh
.
└── UCI\ HAR\ Dataset 
    ├── activity_labels.txt
    ├── features_info.txt
    ├── features.txt
    ├── README.txt
    ├── test
    │   ├── Inertial\ Signals
    |   |   ├── body_acc_x_test.txt
    |   |   ├── body_acc_y_test.txt
    |   |   ├── body_acc_z_test.txt
    |   |   ├── body_gyro_x_test.txt
    |   |   ├── body_gyro_y_test.txt
    |   |   ├── body_gyro_z_test.txt
    |   |   ├── total_acc_x_test.txt
    |   |   ├── total_acc_y_test.txt
    |   |   └── total_acc_z_test.txt
    │   ├── subject_test.txt
    │   ├── X_test.txt
    │   └── y_test.txt
    └── train
        ├── Inertial\ Signals
        |   ├── body_acc_x_train.txt
        |   ├── body_acc_y_train.txt
        |   ├── body_acc_z_train.txt
        |   ├── body_gyro_x_train.txt
        |   ├── body_gyro_y_train.txt
        |   ├── body_gyro_z_train.txt
        |   ├── total_acc_x_train.txt
        |   ├── total_acc_y_train.txt
        |   └── total_acc_z_train.txt
        ├── subject_train.txt
        ├── X_train.txt
        └── y_train.txt
```


### Data transformation – script: `run_analysis.R`

1.  Merging training and test datasets
    
    The information for the training and test datasets to be merged are contained in the following files:
    
    - `X_test.txt` - test dataset - 2947 x 561 observations
    - `y_test.txt` - activity IDs for test dataset - #1-6
    - `subject_test.txt` - subject IDs for test dataset - #1-30
    
    - `X_train.txt` - training dataset - 7352 x 561 observations
    - `y_train.txt` - activity IDs for training dataset - #1-6
    - `subject_train.txt` - subject IDs for training dataset - #1-30
    
    The merged dataset has 10299 rows and 563 columns (561 columns with parameters and 2 columns with subject and activity ID).


2.  Creating descriptive variable names / assigning column names to dataset
    
    The list of column names is contained in the following file:
    
    - `features.txt` - list variable/column names for test & training datasets - 561 elements  
    
    Column names are read from the features file and complemented by the elements subject and activity. Abbreviations, brackets and dashes in the column names are eliminated. Assign column names to dataset from step 1.


3.  Assigning descriptive activity names to the activity codes of the dataset from step 1.
    
    The list of activities is encoded in the following file:
    
    - `activity_lables.txt` - labels for activity IDs - 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
                                                        STANDING, LAYING)  


4.  Eliminating columns with duplicate names and extracting the measurements on the mean and standard deviation for each measurement. Changing column names to lowercase (tidy data).


5.  Processing dataset from step 4 to create independent tidy dataset with the average (mean) of each variable for each activity and each subject. The result is stored in the file `tidydataset.txt`. The resulting file contains in each row the mean values for each of the 66 variables associated with a subject/activity pair.  
      
     


### Naming convention for the variables in the tidy dataset
  
#### Variable prefixes:
- t - time domain signal
- f - frequency (result of a Fast Fourier Transformation)
  
#### Variable Substrings:
- accelerometer - measurement of the accelerometer
- body - body acceleration signal
- gravity - gravity acceleration signal
- gyroscope - measurement of the gyroscope
- jerk – derived measurement of linear body acceleration and angular velocity 
  
#### Variable suffixes:
- mean - arithmetic mean
- std - standard deviation
- x/y/z -  x, y, or x axis (spacial component)
  



### Variables and Identifiers in the tidy dataset

```sh
subject
activity
tbodyaccelerometer.mean.x
tbodyaccelerometer.mean.y
tbodyaccelerometer.mean.z
tgravityaccelerometer.mean.x
tgravityaccelerometer.mean.y
tgravityaccelerometer.mean.z
tbodyaccelerometerjerk.mean.x
tbodyaccelerometerjerk.mean.y
tbodyaccelerometerjerk.mean.z
tbodygyroscope.mean.x
tbodygyroscope.mean.y
tbodygyroscope.mean.z
tbodygyroscopejerk.mean.x
tbodygyroscopejerk.mean.y
tbodygyroscopejerk.mean.z
tbodyaccelerometermagnitude.mean
tgravityaccelerometermagnitude.mean
tbodyaccelerometerjerkmagnitude.mean
tbodygyroscopemagnitude.mean
tbodygyroscopejerkmagnitude.mean
fbodyaccelerometer.mean.x
fbodyaccelerometer.mean.y
fbodyaccelerometer.mean.z
fbodyaccelerometerjerk.mean.x
fbodyaccelerometerjerk.mean.y
fbodyaccelerometerjerk.mean.z
fbodygyroscope.mean.x
fbodygyroscope.mean.y
fbodygyroscope.mean.z
fbodyaccelerometermagnitude.mean
fbodybodyaccelerometerjerkmagnitude.mean
fbodybodygyroscopemagnitude.mean
fbodybodygyroscopejerkmagnitude.mean
tbodyaccelerometer.std.x
tbodyaccelerometer.std.y
tbodyaccelerometer.std.z
tgravityaccelerometer.std.x
tgravityaccelerometer.std.y
tgravityaccelerometer.std.z
tbodyaccelerometerjerk.std.x
tbodyaccelerometerjerk.std.y
tbodyaccelerometerjerk.std.z
tbodygyroscope.std.x
tbodygyroscope.std.y
tbodygyroscope.std.z
tbodygyroscopejerk.std.x
tbodygyroscopejerk.std.y
tbodygyroscopejerk.std.z
tbodyaccelerometermagnitude.std
tgravityaccelerometermagnitude.std
tbodyaccelerometerjerkmagnitude.std
tbodygyroscopemagnitude.std
tbodygyroscopejerkmagnitude.std
fbodyaccelerometer.std.x
fbodyaccelerometer.std.y
fbodyaccelerometer.std.z
fbodyaccelerometerjerk.std.x
fbodyaccelerometerjerk.std.y
fbodyaccelerometerjerk.std.z
fbodygyroscope.std.x
fbodygyroscope.std.y
fbodygyroscope.std.z
fbodyaccelerometermagnitude.std
fbodybodyaccelerometerjerkmagnitude.std
fbodybodygyroscopemagnitude.std
fbodybodygyroscopejerkmagnitude.std
```


