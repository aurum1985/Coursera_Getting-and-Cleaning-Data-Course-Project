Shows information about the variables used on "cleandata.txt" file -  
independent tidy data set with the average of each variable for each activity and each subject.

The list of variables include:
"Subject" - the number of participants (from 1 to 30).
 "Activity" -  the activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) performed by each of 30 persons 
wearing a smartphone (Samsung Galaxy S II) on the waist. The class of the variable was changed to factors with 6 levels.
Variables from time domain start from "time_", from frequency domain - "frequency_". 
These variables present sensor signals from accelerometer (includes "Acc") and gyroscope (includes "Gyro").
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter 
into body acceleration (includes "Body") and gravity (includes "Gravity"). 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (including "Jerk"). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (including "Mag"). 

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

All variables were averaged for each activity and each subject. 