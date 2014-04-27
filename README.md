Mean and Std dataset
====================
This dataset is a subset of the orginal Human Activity Recognition Using Smartphones Data Set. 

This new dataset only includes some of the variables originally taken into account: those ones related to mean and standard deviation measurements.

The script "run_analysis.R" takes care of all the steps needed to transform the original full dataset into the subset:

1) Read the features table (features.txt)
1.1) Grep only those ones wth std and mean related measurements.
1.2) Get and save the feature ID and name for each of the features found by grep.

2) Load original datasets
2.1) Load test dataset (X_test.txt)
2.2) Load train dataset (X(train.txt)

3) Subset original datasets
3.1) With the results of 1.2), save just the information related to the features we want to use.

4) Activities work
4.1) Read activity files (y_train.txt and y_test.txt),containing which activity is measured in each entry.
4.2) Read activity labels file (activity_labels.txt)
4.3) Merge results from 4.1 and 4.2, obtaining the activity label for each entry.
4.4) Sort the result from 4.3.

5) Final dataset
5.1) Lable the columns of the datasets (result can be seen in file featuresStdMean.txt)
5.2) Add a new column to train and tes datasets, with the activity mesured.
5.3) Add a new column to test and train datasets, with the subject who was measured.
5.4) Merge both datasets, getting the final and tidy result.
 
 Result can be found in file tidydata.txt
 
 