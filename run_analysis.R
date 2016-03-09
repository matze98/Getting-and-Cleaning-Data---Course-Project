# load deplyr-package
library(dplyr)


# 1. merge of training and test data sets to create one data set
# read train-data
xtr <- read.table("./UCI HAR Dataset/train/X_train.txt")
# add subject and activity columns to the left of the train data table
saxtr <- cbind(read.table("./UCI HAR Dataset/train/subject_train.txt") ,read.table("./UCI HAR Dataset/train/y_train.txt") ,xtr)

# read test-data
xts <- read.table("./UCI HAR Dataset/test/X_test.txt")
# add subject and activity columns to the left of the test data table
saxts <- cbind(read.table("./UCI HAR Dataset/test/subject_test.txt") ,read.table("./UCI HAR Dataset/test/y_test.txt") ,xts)

# merge train and test data tables
tdata <- rbind(saxtr,saxts)


# 2. create descriptive variable names / assign column names to dataset
# read column-names from features table and add two names at the begin ("subject" und "activity")
# transform variabe names into easyly readable ones
vns <- read.table("./UCI HAR Dataset/features.txt")
vna <- as.character(vns[,2])
vna2 <- append(vna, c("subject", "activity"), 0)
vna2 <- gsub("Acc", "Accelerometer", vna2)
vna2 <- gsub("Gyro", "Gyroscope", vna2)
vna2 <- gsub("Mag", "Magnitude", vna2)
vna2 <- gsub("meanFreq", "", vna2)
vna2 <- gsub("[-]", ".", vna2)
vna2 <- gsub("[()]", "", vna2)

# add column names to combined data set ("tdata")
colnames(tdata) <- vna2


# 3. assign descriptive activity names to the activities codes in the dataset
# transform column "activity" into factors and replace numeric code with descriptive code
tdata$activity <- factor(tdata$activity)
levels(tdata$activity) <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")


# 4. extract the measurements on the mean and standard deviation for each measurement
# removal of "duplicate" columns (variable names)
tdata.c <- tdata[, !duplicated(colnames(tdata))]

# selecting variables/columns containing mean and std data
tdata.c <- select(tdata.c, subject, activity, contains(".Mean"), contains(".Std"))
# making names all lowercase
names(tdata.c) <- tolower(names(tdata.c))


# 5. create an independent data set from the data of step 4 with the average of each variable for each activity and each subject

tds <- tdata.c %>%
       group_by(subject, activity) %>%
       summarise_each(funs(mean)) %>%
       arrange(subject)

write.table(tds, file = "./tidydataset.txt", row.name = FALSE)


