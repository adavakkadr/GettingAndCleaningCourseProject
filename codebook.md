The run\_analysis.R script is used to prepare the data and process few steps to generate summarydata . detail steps are described below
---------------------------------------------------------------------------------------------------------------------------------------

1  Download the dataset and load dplyr library.
-----------------------------------------------
using Download.R script to download dataset locally


2 prepare data frames
----------------------

-   The features selected for this database come from the accelerometer
    and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
-   List of activities performed when the corresponding measurements
    were taken and its codes (labels)
-   subject\_test contains test data of 9/30 volunteer test subjects
    being observed
-   x\_test contains recorded features test data
-   y\_test contains test data of activities’code labels
-   subject\_train contains train data of 21/30 volunteer subjects being
    observed
-   x\_train contains recorded features train data
-   y\_train contains train data of activities’code labels

| data frame     | sourced from            | rows | columns |
|----------------|-------------------------|------|---------|
| features       | features.txt            | 561  | 2       |
| activities     | activity\_labels.txt    | 6    | 2       |
| subject\_test  | test/subject\_test.txt  | 2947 | 1       |
| x\_test        | test/X\_test.txt        | 2947 | 561     |
| y\_test        | test/y\_test.txt        | 2947 | 1       |
| subject\_train | test/subject\_train.txt | 7352 | 1       |
| x\_test        | test/X\_test.txt        | 7352 | 561     |
| y\_test        | test/y\_test.txt        | 7352 | 1       |

3 Merges the training and the test sets to create one data set
---------------------------------------------------------------

-   Using *rbind()* function to combine for the following train and test
    data sets

| train dataset  | Test Datset   | combined    |
|----------------|---------------|-------------|
| x\_train       | x\_test       | X           |
| y\_train       | y\_test       | y           |
| subject\_train | subject\_test | subject\_XY |

-   Using *cbind()* function to merge all the combined data frames
    mentioned above (x , y and subject\_xy) anmed merged\_xy

4 Extracts only the measurements on the mean and standard deviation for each measurement
----------------------------------------------------------------------------------------

MeanandStd dataset created from merged\_xy selecting only mean and
median related variables of the subject and label

5 Uses descriptive activity names to name the activities in the data set
------------------------------------------------------------------------

Activity label on the MeanandStd data frame updated from the Activities
data frame

6 Appropriately labels the data set with descriptive variable names
-------------------------------------------------------------------

-   code column in MeanandStd renamed into activities
-   All Acc in column’s name replaced by Accelerometer
-   All Gyro in column’s name replaced by Gyroscope
-   All Mag in column’s name replaced by Magnitude
-   All start with character f in column’s name replaced by Frequency
-   All start with character t in column’s name replaced by Time

7 From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
------------------------------------------------------------------------------------------------------------------------------------------------

-   SummaryData (180 rows, 88 columns) is created by sumarizing
    MeanandStd taking the means of each variable for each activity and
    each subject, after groupped by subject and activity.
-   Write SummaryData into SummaryData.txt file.
