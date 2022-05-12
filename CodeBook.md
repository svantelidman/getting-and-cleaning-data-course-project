# Description of datasets in this directory

## Original data
The directory _UCI HAR Dataset_ contains the original dataset downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
The only modification done is that the subdirectories "Inertial Signals" have 
been removed in the test and train directories to make the repository smaller
(this data is not needed for the assignment).

## Tidy data
The file _tidy.csv_ contains the tidy data set as specified in the assignment
where the variables/columns are as follows:

* subject - The identifying number of the observed person.
* activity - The activity performed by the subject
* other columns - These are selected features (as set out in the assignment, i.e.
only the standard deviations and averages are included) from
the original data. The meaning of these are described in feature_info.txt in the
"UCI HAR Dataset" directory. Note that the names are somewhat different as
special characters have been stripped from the original names to make them more
legible.

## Summary data
The file _summary.csv_ contains the summary of the tidy data as specified in
the assignment. The column names are the same as in _tidy.csv_. The difference is
that instead of listing all individual observations the mean value for each
observation is calculated and listed per activity and subject. 
