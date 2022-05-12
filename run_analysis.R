# The current directory should be set to the parent directory of the data set directory ("UCI HAR Dataset")
# It is not totally clear from the assignment specification but it appears that the Inertial Signals data can
# be ignored for this assignment.

library(dplyr)

# Set up the directories that we will read data from.
root_dir <- paste(".", "UCI HAR Dataset", sep=.Platform$file.sep)
test_dir <-  paste(root_dir, "test", sep=.Platform$file.sep)
test_signals_dir <- paste(test_dir, "Inertial Signals", sep=.Platform$file.sep)
train_dir <-  paste(root_dir, "train", sep=.Platform$file.sep)
train_signals_dir <- paste(train_dir, "Inertial Signals", sep=.Platform$file.sep)

# Note to reviewers
# =================
# The steps below are not carried out in the same step-wise order as listed in the assignment spec
# but IMO (as a professional programmer) the steps below are more appropriate

# Set up some column labels / variable names
subject_names <- c("subject")
activity_names <- c("activity")
feature_names <- read.table(paste(root_dir, "features.txt", sep=.Platform$file.sep), sep="#", header = FALSE, col.names = c("feature"))
# Turn it into a vector
original_feature_names <- feature_names$feature
feature_names <- original_feature_names
# Clean up the names so they only have lower case characters
feature_names <- gsub("[^a-zA-Z]", "", feature_names)

# Load all files that we need and assign variable names at the same time
subject_train <- read.table(paste(train_dir, "subject_train.txt", sep=.Platform$file.sep), header = FALSE, col.names = subject_names)
subject_test <- read.table(paste(test_dir, "subject_test.txt", sep=.Platform$file.sep), header = FALSE, col.names = subject_names)
activity_train <- read.table(paste(train_dir, "y_train.txt", sep=.Platform$file.sep), header = FALSE, col.names = activity_names)
activity_test <- read.table(paste(test_dir, "y_test.txt", sep=.Platform$file.sep), header = FALSE, col.names = activity_names)
features_train <- read.table(paste(train_dir, "X_train.txt", sep=.Platform$file.sep), header = FALSE, col.names = feature_names)
features_test <- read.table(paste(test_dir, "X_test.txt", sep=.Platform$file.sep), header = FALSE, col.names = feature_names)

# Merge training and test data for subject, activity, and features separately
subject <- rbind(subject_train, subject_test)
activity <- rbind(activity_train, activity_test)
features <- rbind(features_train, features_test)

# Get the column indices for the features for mean and standard deviation
feature_indices <- c(which(grepl("mean()", original_feature_names, fixed = TRUE)), which(grepl("std()", original_feature_names, fixed = TRUE)))
feature_indices <- sort(feature_indices)
feature_names <-feature_names[feature_indices]

# Merged subjects, activities, and selected features into a single dataframe
tidy_data_set = cbind(subject, activity, features[, feature_indices])

# Replace the integers indicating activity with a factor
activity_names <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")
tidy_data_set[, "activity"] <- factor(tidy_data_set[, "activity"], levels = 1:6, labels = activity_names)

# Note to reviewers
# =================
# At this point tidy_data_set is the result for steps 1-4 in the assignment

# Group over activities and summarize
grouped_data_set <- group_by(tidy_data_set, activity, subject)
summary <- summarise_at(grouped_data_set, feature_names, mean)

# Write the required datasets to file.
write.csv(tidy_data_set, file = "tidy.csv")
write.csv(summary, file = "summary.csv")

