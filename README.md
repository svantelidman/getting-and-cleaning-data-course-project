# Coursera Getting and Cleaning Data - Course project

## About this repository
This repository contains the work of Svante Lidman for the course project of the
Coursera course _Getting and Cleaning Data_.

As set out in the assignment the repo contains an R-script, _run_analysis.R_,
which creates the following two data sets (data frame variables) as required in the assignment:

* tidy_data_set - The merged dataset fulfilling steps 1-4 of the assignment.
* summary - The summary fulfilling step 5 of the assignment.

The details of the data in these two datasets are described in the file
CodeBook.md

The two datasets are also available as the files tidy.csv and summary.csv in
this repository.

## Running the R-script
1. Clone this repository
2. Open your R-environment, e.g., R-studio
3. Make sure that the R-package dplyr is installed
4. Set your working directory to the root directory of the cloned repository.
5. From the R-console enter _source("run_analysis.R")_
6. You can now view the results with _View(tidy_data_set)_ or _View(summary)_
   or alternatively look at the generated csv-files (they will be overwritten if
   they already exist.)
