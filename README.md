
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

