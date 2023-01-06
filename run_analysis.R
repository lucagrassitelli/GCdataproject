#Initialization
library(dplyr)

# Function returning a combined data-frame of the whole train or test sets with associated subjects and activities. 

return_dataframe_data <- function(name_set = "train"){
  #loads the data based on the set
  features<-as.data.frame(read.table("features.txt",header = FALSE))
  features_train <-as.data.frame(read.table(paste("./",name_set,"/X_",name_set,".txt", sep = ""),header = FALSE))
  activities_train <-as.data.frame(read.table(paste("./",name_set,"/Y_",name_set,".txt", sep = ""),header=FALSE))
  subjects_train <-as.data.frame(read.table(paste("./",name_set,"/subject_",name_set,".txt", sep = ""),header=FALSE))

  #Rename the columns in an understandable/tidy way
  colnames(features_train) <- features$V2 
  colnames(subjects_train) <- "subjects"
  colnames(activities_train) <- "activities"

  #Join subject, activity, and feature   
  collect <- cbind(subjects_train,activities_train,features_train)
  collect
}
#Loads the names of the activities
activities_names <-as.data.frame(read.table("activity_labels.txt", header = FALSE))

#Bind the two datasets together
c1 <- return_dataframe_data(name_set = "test")
c2 <- return_dataframe_data(name_set = "train")
c_total <- rbind(c1,c2)

#Sort the dataset by subject
c_total <- c_total[order(c_total$subjects),]

#Define a vector with the indeces of the names including mean and std, and subsets the dataframe
col_mean_std_set <- grep(x = names(c_total),pattern = "mean()|std()|activities|subject",fixed = F)
col_mean_std <- c_total[,col_mean_std_set]

#Replace the activities' factor for a more descriptive variable
col_mean_std$activities <- factor(col_mean_std$activities, levels=activities_names$V1, labels= activities_names$V2)

#Group the dataframe based on subject and activity, and returns a dataframe with the mean of each remaining column
new_df <- col_mean_std %>% group_by(subjects,activities) %>% summarise_all(mean)
new_df <- as.data.frame(new_df)


