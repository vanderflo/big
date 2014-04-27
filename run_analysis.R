run_analysis <- function(){
  ## Get all features, and subset to keep only those ones including std() or mean() data
  allFeatures = read.table('features.txt')
  meanV = grep('mean()',allFeatures$V2,perl=T)
  stdV = grep('std()',allFeatures$V2,perl=T)
  rowsToUse = c(meanV,stdV)
  rowsToUse=sort(rowsToUse)
  selected_rows = allFeatures[rowsToUse,]
    ## After merging and subsetting, order (just to be clean).
    selected_rows = selected_rows[order(selected_rows$V1),]
  
  ## Load measurements. Big files.
  test = read.table("X_test.txt")
  training = read.table("X_train.txt")
  ## Select just the columns needed (those ones including mean or std information)
  test = test[,rowsToUse]
  training = training[,rowsToUse]
  
  ##Read the activities for these data sets
  activities_test=read.table("y_test.txt")
  activities_training=read.table("y_train.txt")
  
  ##Read the activity labels
  alabel=read.table("activity_labels.txt")
  
  ##Label the columns (important for merging properly)
  colnames(activities_test)[1]='code'
  colnames(activities_training)[1]='code'
  colnames(alabel)[1]='code'
  colnames(alabel)[2]='desc'
  
  
  ##Add a column with the row id, to sort after merging
  activities_test$id  <- 1:nrow(activities_test)
  activities_training$id  <- 1:nrow(activities_training)
  
  ##Merge activities and labels
  r2=merge(alabel,activities_training,by='code',sort='FALSE')
  r1=merge(alabel,activities_test,by='code',sort='FALSE')
  ##Order by id
  r1=r1[order(r1$id),]
  r2=r2[order(r2$id),]
  
  ##Assign the id to each row name
  row.names(r1)=r1$id
  row.names(r2)=r2$id
  ##Assign new names to the columns in the dataset (from 1 to the number of variables selected)
  selected_rows$column=1:nrow(selected_rows)
  colnames(test)=selected_rows$column
  colnames(training)=selected_rows$column
  ##Add column 'activity' to test and training datasets
  test$activity=r1$desc
  training$activity=r2$desc
  
  ##Read subjects files
  subjects_test=read.table('subject_test.txt')
  subjects_train=read.table('subject_train.txt')
  
  ##Add a new column with the subject of the measurement to each dataset
  test$subject=subjects_test$V1
  training$subject=subjects_train$V1 
  
  ##Merge both datasets in a final, tidy one.
  tidyDataset=rbind(test,training)
  
 return (tidyDataset)
  
}