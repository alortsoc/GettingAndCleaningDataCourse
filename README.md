##Study design

The script **run_analysis.R** contained in this distribution provides a function which will take the absolute path of the directory where the original information of the UCI dataset is stored, returning as output a tidy data set containing the mean of every required measurement for every subject & activity. This data set is also stored in a file located in the path of the UCI data set.

#### Prerequirements:

* packages **reshape2** and **data.table** must be installed.
* The original raw UCI HAR distribution must be unzipped in some directory of the machine where the script will be run 

#### Script main function:
This script exposes the function **processUCIDataset** which will process the the original data set. 

###### Input parameter:
* *(optional) datapath*: the absolute path of the directory which contains original files to process. If the parameter is not provided, it will be guessed that the current working directory is the top-level directory of the UCI HAR distribution

###### Output:
* *Returned value*: A data.table R object which contains a tidy data set with a single observation per subject and activity.
* Besides, a file called **output.txt** will be generated containing this data set, placed on the directory specified bu the input parameter *datapath* 

#### Running script:
In an R session (assuming that raw files are located in the directory *./UCI HAR Dataset*:
```
source("run_analysis.R")
setwd("./UCI HAR Dataset")
result <- processUCIDataset()
```
Or:
```
source("run_analysis.R")
result <- processUCIDataset("./UCI HAR Dataset")
```


## Code book

#### General considerations:
1. Every row in the result data set will contain the aggregated mean of all the measurements of the variables specified below, provided by the original data set; grouped by *subject* and *activity*.

2. Variable values (except *subject* & *activity*) are normalized and bounded within [-1,1]

3. More information about this data in files *README* (it also has links and e-mail adddresses of studio authors) and *features_info.txt* of the distribution


#### Variables contained
* *subject*: Number (from 1 to 30) identifying the volunteer who participated in the experiment
* *activity*: Activity performed by the subject when being studies. Possible values: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
* *tBodyAcc-mean()-X*: Mean of the body acceleration time signal in the X direction
* *tBodyAcc-mean()-Y*: Mean of the body acceleration time signal in the Y direction
* *tBodyAcc-mean()-Z*: Mean of the body acceleration time signal in the Z direction
* *tBodyAcc-std()-X*: Standard deviation of the body acceleration time signal in the X direction
* *tBodyAcc-std()-Y*: Standard deviation of the body acceleration time signal in the Y direction
* *tBodyAcc-std()-Z*: Standard deviation of the body acceleration time signal in the Z direction
* *tGravityAcc-mean()-X*: Mean of the gravity acceleration time signal in the X direction
* *tGravityAcc-mean()-Y*: Mean of the gravity acceleration time signal in the Y direction
* *tGravityAcc-mean()-Z*: Mean of the gravity acceleration time signal in the Z direction
* *tGravityAcc-std()-X*: Standard deviation of the gravity acceleration time signal in the X direction
* *tGravityAcc-std()-Y*: Standard deviation of the gravity acceleration time signal in the Y direction
* *tGravityAcc-std()-Z*: Standard deviation of the gravity acceleration time signal in the Z direction
* *tBodyAccJerk-mean()-X*: Mean of the Jerk body acceleration time signal in the X direction
* *tBodyAccJerk-mean()-Y*: Mean of the Jerk body acceleration time signal in the Y direction
* *tBodyAccJerk-mean()-Z*: Mean of the Jerk body acceleration time signal in the Z direction
* *tBodyAccJerk-std()-X*: Standard deviation of the Jerk body acceleration time signal in the X direction
* *tBodyAccJerk-std()-Y*: Standard deviation of the Jerk body acceleration time signal in the Y direction
* *tBodyAccJerk-std()-Z*: Standard deviation of the Jerk body acceleration time signal in the Z direction
* *tBodyGyro-mean()-X*: Mean of the body gyroscope time signal in the X direction
* *tBodyGyro-mean()-Y*: Mean of the body gyroscope time signal in the Y direction
* *tBodyGyro-mean()-Z*: Mean of the body gyroscope time signal in the Z direction
* *tBodyGyro-std()-X*: Standard deviation of the body gyroscope time signal in the X direction
* *tBodyGyro-std()-Y*: Standard deviation of the body gyroscope time signal in the Y direction
* *tBodyGyro-std()-Z*: Standard deviation of the body gyroscope time signal in the Z direction
* *tBodyGyroJerk-mean()-X*: Mean of the Jerk body gyroscope time signal in the X direction
* *tBodyGyroJerk-mean()-Y*: Mean of the Jerk body gyroscope time signal in the Y direction
* *tBodyGyroJerk-mean()-Z*: Mean of the Jerk body gyroscope time signal in the Z direction
* *tBodyGyroJerk-std()-X*: Standard deviation of the body gyroscope time signal in the X direction
* *tBodyGyroJerk-std()-Y*: Standard deviation of the body gyroscope time signal in the Y direction
* *tBodyGyroJerk-std()-Z*: Standard deviation of the body gyroscope time signal in the Z direction
* *tBodyAccMag-mean()*: Mean of Euclidean norm magnitude for the body acceleration time signal
* *tBodyAccMag-std()*: Standard deviation of Euclidean norm magnitude for the body acceleration time signal
* *tGravityAccMag-mean()*: Mean of Euclidean norm magnitude for the gravity acceleration time signal              
* *tGravityAccMag-std()*: Standard deviation of Euclidean norm magnitude for the gravity acceleration time signal 
* *tBodyAccJerkMag-mean()*: Mean of Euclidean norm magnitude for the Jerk body acceleration time signal              
* *tBodyAccJerkMag-std()*: Standard deviation of Euclidean norm magnitude for the Jerk body acceleration time signal 
* *tBodyGyroMag-mean()*: Mean of Euclidean norm magnitude for the body gyroscope time signal             
* *tBodyGyroMag-std()*: Standard deviation of Euclidean norm magnitude for the body gyroscope time signal
* *tBodyGyroJerkMag-mean()*: Mean of Euclidean norm magnitude for the Jerk body gyroscope time signal             
* *tBodyGyroJerkMag-std()*: Standard deviation of Euclidean norm magnitude for the Jerk body gyroscope time signal
* *fBodyAcc-mean()-X*: Mean of the body acceleration frequency signal in the X direction
* *fBodyAcc-mean()-Y*: Mean of the body acceleration frequency signal in the Y direction
* *fBodyAcc-mean()-Z*: Mean of the body acceleration frequency signal in the Z direction
* *fBodyAcc-std()-X*: Standard deviation of the body acceleration frequency signal in the X direction
* *fBodyAcc-std()-Y*: Standard deviation of the body acceleration frequency signal in the Y direction
* *fBodyAcc-std()-Z*: Standard deviation of the body acceleration frequency signal in the Z direction                                          
* *fBodyAccJerk-mean()-X*: Mean of the Jerk body acceleration frequency signal in the X direction
* *fBodyAccJerk-mean()-Y*: Mean of the Jerk body acceleration frequency signal in the Y direction
* *fBodyAccJerk-mean()-Z*: Mean of the Jerk body acceleration frequency signal in the Z direction
* *fBodyAccJerk-std()-X*: Standard deviation of the Jerk body acceleration frequency signal in the X direction
* *fBodyAccJerk-std()-Y*: Standard deviation of the Jerk body acceleration frequency signal in the Y direction
* *fBodyAccJerk-std()-Z*: Standard deviation of the Jerk body acceleration frequency signal in the Z direction
* *fBodyGyro-mean()-X*: Mean of the body gyroscope frequency signal in the X direction
* *fBodyGyro-mean()-Y*: Mean of the body gyroscope frequency signal in the Y direction
* *fBodyGyro-mean()-Z*: Mean of the body gyroscope frequency signal in the Z direction
* *fBodyGyro-std()-X*: Standard deviation of the body gyroscope frequency signal in the X direction
* *fBodyGyro-std()-Y*: Standard deviation of the body gyroscope frequency signal in the Y direction
* *fBodyGyro-std()-Z*: Standard deviation of the body gyroscope frequency signal in the Z direction
* *fBodyAccMag-mean()*: Mean of Euclidean norm magnitude for the body acceleration frequency signal
* *fBodyAccMag-std()*: Standard deviation of Euclidean norm magnitude for the body acceleration frequency signal
* *fBodyBodyAccJerkMag-mean()*: Mean of Euclidean norm magnitude for the Jerk body acceleration frequency signal
* *fBodyBodyAccJerkMag-std()*: Standard deviation of Euclidean norm magnitude for the Jerk body acceleration frequency signal
* *fBodyBodyGyroMag-mean()*: Mean of Euclidean norm magnitude for the body gyroscope frequency signal
* *fBodyBodyGyroMag-std()*: Standard deviation of Euclidean norm magnitude for the body gyroscope frequency signal
* *fBodyBodyGyroJerkMag-mean()*: Mean of Euclidean norm magnitude for the Jerk body gyroscope frequency signal
* *fBodyBodyGyroJerkMag-std()*: Standard deviation of Euclidean norm magnitude for the Jerk body gyroscope frequency signal  
