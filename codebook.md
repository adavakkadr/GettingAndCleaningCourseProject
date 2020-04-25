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
-   Write SummaryData into summarydata.txt file. with the following variables
 [1] "Subject"                                                
 [2] "Activity"                                               
 [3] "TimeBodyAccelerometer.Mean...X"                         
 [4] "TimeBodyAccelerometer.Mean...Y"                         
 [5] "TimeBodyAccelerometer.Mean...Z"                         
 [6] "TimeGravityAccelerometer.Mean...X"                      
 [7] "TimeGravityAccelerometer.Mean...Y"                      
 [8] "TimeGravityAccelerometer.Mean...Z"                      
 [9] "TimeBodyAccelerometerJerk.Mean...X"                     
[10] "TimeBodyAccelerometerJerk.Mean...Y"                     
[11] "TimeBodyAccelerometerJerk.Mean...Z"                     
[12] "TimeBodyGyroscope.Mean...X"                             
[13] "TimeBodyGyroscope.Mean...Y"                             
[14] "TimeBodyGyroscope.Mean...Z"                             
[15] "TimeBodyGyroscopeJerk.Mean...X"                         
[16] "TimeBodyGyroscopeJerk.Mean...Y"                         
[17] "TimeBodyGyroscopeJerk.Mean...Z"                         
[18] "TimeBodyAccelerometerMagnitude.Mean.."                  
[19] "TimeGravityAccelerometerMagnitude.Mean.."               
[20] "TimeBodyAccelerometerJerkMagnitude.Mean.."              
[21] "TimeBodyGyroscopeMagnitude.Mean.."                      
[22] "TimeBodyGyroscopeJerkMagnitude.Mean.."                  
[23] "FrequencyBodyAccelerometer.Mean...X"                    
[24] "FrequencyBodyAccelerometer.Mean...Y"                    
[25] "FrequencyBodyAccelerometer.Mean...Z"                    
[26] "FrequencyBodyAccelerometer.MeanFrequency...X"           
[27] "FrequencyBodyAccelerometer.MeanFrequency...Y"           
[28] "FrequencyBodyAccelerometer.MeanFrequency...Z"           
[29] "FrequencyBodyAccelerometerJerk.Mean...X"                
[30] "FrequencyBodyAccelerometerJerk.Mean...Y"                
[31] "FrequencyBodyAccelerometerJerk.Mean...Z"                
[32] "FrequencyBodyAccelerometerJerk.MeanFrequency...X"       
[33] "FrequencyBodyAccelerometerJerk.MeanFrequency...Y"       
[34] "FrequencyBodyAccelerometerJerk.MeanFrequency...Z"       
[35] "FrequencyBodyGyroscope.Mean...X"                        
[36] "FrequencyBodyGyroscope.Mean...Y"                        
[37] "FrequencyBodyGyroscope.Mean...Z"                        
[38] "FrequencyBodyGyroscope.MeanFrequency...X"               
[39] "FrequencyBodyGyroscope.MeanFrequency...Y"               
[40] "FrequencyBodyGyroscope.MeanFrequency...Z"               
[41] "FrequencyBodyAccelerometerMagnitude.Mean.."             
[42] "FrequencyBodyAccelerometerMagnitude.MeanFrequency.."    
[43] "FrequencyBodyAccelerometerJerkMagnitude.Mean.."         
[44] "FrequencyBodyAccelerometerJerkMagnitude.MeanFrequency.."
[45] "FrequencyBodyGyroscopeMagnitude.Mean.."                 
[46] "FrequencyBodyGyroscopeMagnitude.MeanFrequency.."        
[47] "FrequencyBodyGyroscopeJerkMagnitude.Mean.."             
[48] "FrequencyBodyGyroscopeJerkMagnitude.MeanFrequency.."    
[49] "Angle.TimeBodyAccelerometerMean.Gravity."               
[50] "Angle.TimeBodyAccelerometerJerkMean..GravityMean."      
[51] "Angle.TimeBodyGyroscopeMean.GravityMean."               
[52] "Angle.TimeBodyGyroscopeJerkMean.GravityMean."           
[53] "Angle.X.GravityMean."                                   
[54] "Angle.Y.GravityMean."                                   
[55] "Angle.Z.GravityMean."                                   
[56] "TimeBodyAccelerometer.STD...X"                          
[57] "TimeBodyAccelerometer.STD...Y"                          
[58] "TimeBodyAccelerometer.STD...Z"                          
[59] "TimeGravityAccelerometer.STD...X"                       
[60] "TimeGravityAccelerometer.STD...Y"                       
[61] "TimeGravityAccelerometer.STD...Z"                       
[62] "TimeBodyAccelerometerJerk.STD...X"                      
[63] "TimeBodyAccelerometerJerk.STD...Y"                      
[64] "TimeBodyAccelerometerJerk.STD...Z"                      
[65] "TimeBodyGyroscope.STD...X"                              
[66] "TimeBodyGyroscope.STD...Y"                              
[67] "TimeBodyGyroscope.STD...Z"                              
[68] "TimeBodyGyroscopeJerk.STD...X"                          
[69] "TimeBodyGyroscopeJerk.STD...Y"                          
[70] "TimeBodyGyroscopeJerk.STD...Z"                          
[71] "TimeBodyAccelerometerMagnitude.STD.."                   
[72] "TimeGravityAccelerometerMagnitude.STD.."                
[73] "TimeBodyAccelerometerJerkMagnitude.STD.."               
[74] "TimeBodyGyroscopeMagnitude.STD.."                       
[75] "TimeBodyGyroscopeJerkMagnitude.STD.."                   
[76] "FrequencyBodyAccelerometer.STD...X"                     
[77] "FrequencyBodyAccelerometer.STD...Y"                     
[78] "FrequencyBodyAccelerometer.STD...Z"                     
[79] "FrequencyBodyAccelerometerJerk.STD...X"                 
[80] "FrequencyBodyAccelerometerJerk.STD...Y"                 
[81] "FrequencyBodyAccelerometerJerk.STD...Z"                 
[82] "FrequencyBodyGyroscope.STD...X"                         
[83] "FrequencyBodyGyroscope.STD...Y"                         
[84] "FrequencyBodyGyroscope.STD...Z"                         
[85] "FrequencyBodyAccelerometerMagnitude.STD.."              
[86] "FrequencyBodyAccelerometerJerkMagnitude.STD.."          
[87] "FrequencyBodyGyroscopeMagnitude.STD.."                  
[88] "FrequencyBodyGyroscopeJerkMagnitude.STD.."  
