
library(dplyr)

# The X tables are read and combined here
X_train <- read.table ("X_train.txt")
X_test <- read.table ("X_test.txt")
X_complete <- rbind(X_train, X_test)

# Column (measured variable) names provided are afixed, mean and standard deviation columns
# are extracted and a subset of X files is formed.This corresponds to step 2 of the given 
# instruction
features <- read.table ("features.txt")
names(X_complete) <- features$V2
namesWmean <- grep("mean()",names(X_complete), fixed = TRUE, value = TRUE)
namesWstd <- grep("std()",names(X_complete), fixed = TRUE, value = TRUE)
mean <- subset(X_complete, select = c(namesWmean))
std <- subset(X_complete, select = c(namesWstd))
X_subset <- cbind(mean, std)

# Subjects whose activity was measured are read and the column named here
subject_train <- read.table ("subject_train.txt")
subject_test <- read.table ("subject_test.txt")
subject_complete <- rbind(subject_train, subject_test)
names(subject_complete) <- "subject"

# The Y files identifying the activity codes whose measurements are in the X files are read
# and the column named here
y_train <- read.table ("y_train.txt")
y_test <- read.table ("y_test.txt")
y_complete <- rbind(y_train, y_test)
names(y_complete) <- "activityNo"

# The activity codes to activiy name/ description map is loaded and the column named. 
activity_labels <- read.table ("activity_labels.txt")
names(activity_labels) <- c("activityNo", "activity")

# All the pieces of data are assembled here. Along with prior steps, this meets the 
# requirement in step 1 of the instructions.
complete <- cbind (X_subset, subject_complete, y_complete)

# Actitvity labels are applied per step 3 of the given instruction.
complete <- merge (complete, activity_labels, by.x = "activityNo", by.y = "activityNo", all=TRUE)

# The hyphen and parantheses in the measured variable column names prevent easy usage of 
# the dplyr package. So, these characters are stripped out in the column names. This also
# makes the column names relatively easy to read per step 4 of the instructions. I've 
# resisted the temptation to force a change in names just for the sake of doing so, say
# by prefixing "average" to all column names which would make the names even longer and 
# less readable.
names(complete) <- gsub("-","",names(complete))
names(complete) <- gsub("\\(\\)","",names(complete))

# The final data set is being created in two steps. First by grouping by activity and subject.
# Then, by summarizing to obtain the average of each variable for each activity and each 
# subject. Each of the 66 variables is in its own column. The combination of actvity and 
# the subject performing it is an observation and each one is in a separate row.Thus this 
# is tidy data.
grouped <- group_by(complete, activity, subject)
names(grouped)
grouped <- grouped[,-1]

summary <- summarise_each(grouped, funs(mean))
summary

# Lastly, the tidy data is being written out without row names
write.table(summary, file = "tidyData.txt", row.name = FALSE)
