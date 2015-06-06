<<<<<<< HEAD

# run_analysis.R

In my script, the main dataset is 'xdata'. 

Initially, the dataset 'xdata' holds the x_test and x_train values.

Then, step by step it merges all the datas, which is then formed into a tidy data. 

First, the script assigns the features as column names.

Then, it merges the Subjects (Volunteers 1- 30  for the experiments) who performed different activities.

To get to know what are the activities the volunteers performed, it reads two files y_test and y_train, binds the two and holds it in the dataset 'ydata'.This dataset holds the numbers assigned for each activity.

To know what number denotes what activity, the script reads 'activity_labels.txt' file and replaces the activity number in the above dataset 'ydata' with the name of the activity.

Now, its ready to bind the dataset 'ydata' with the main dataset 'xdata'. 

Tidying the dataset :

 It converts all the features as column names to a single column under the column 'Features' and another column for Value, by the gather function.

Then, after grouping it by columns 'Subjects' (Volunteers), 'ActivityName' and 'features' it summarizes to give just the mean value of each feature under every subject and activity.

Then, the formed tidy dataset is written into a .txt file 'TidyDataset.txt'. 
=======
## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:
