# read data files from train & test directories (samples, labels & subjects).
# Parameters:
#   datapath: absoulte path to the directory which contains files
#   suffix: suffix for filenames (train or test)
# Return: a data table containing the content of the 3 files
readData <- function(datapath, suffix) {
    
    samplesfilename <- sprintf("%s%sX_%s.txt", datapath, .Platform$file.sep, suffix)
    samplesData <- data.table(read.table(samplesfilename, header = FALSE))
    labelFilename <- sprintf("%s%sy_%s.txt", datapath, .Platform$file.sep, suffix)
    labelData <- fread(labelFilename, header = FALSE)
    samplesData[,label:=labelData[, 1,with = FALSE]]
    subjectFilename <- sprintf("%s%ssubject_%s.txt", datapath, .Platform$file.sep, suffix)
    subjectData <- fread(subjectFilename, header = FALSE)
    samplesData[,subject:=subjectData[, 1, with = FALSE]] 
}

# Read train & test data, merging them to one data table putting test data table rows after train data table rows
# Parameters:
#   datapath: absoulte path to the directory which contains train & test directories
# Return: a data table containing training & test data
mergeDataSets <- function(datapath) {
    
    trainingData <- readData(paste0(datapath, .Platform$file.sep,"train"),"train")
    testData <- readData(paste0(datapath, .Platform$file.sep,"test"),"test")
    sourceData <- rbind(trainingData, testData)
    sourceData
}

# Change activity numbers (from 1 to 6) to the related activity name as mapped in the activity labels file
# Parameters:
#   datapath: absoulte path to the directory which contains the activity label file
#   sourceData: the data table to modify
# Return: the input data table with the label column updated with activity names

setActivityNames <- function(datapath, sourceData) {
    
    activityLabelData <- fread(sprintf("%s%sactivity_labels.txt", datapath, .Platform$file.sep), header = FALSE)
    sourceData$label <- factor(sourceData$label, levels = seq_along(activityLabelData$V2), labels = activityLabelData$V2)
    sourceData
}

# Extracts subject, activity, mean & std measurements to a new data table. Column names & location in the input data table is taken from the
# features file.
# Parameters:
#   datapath: absoulte path to the directory which contains the features file
#   sourceData: the data table from mean & std measurements will be extracted
# Return: A new data table containing the specified measurements
extractMeanStd <- function(datapath, sourceData) {

    featuresData <- fread(sprintf("%s%sfeatures.txt", datapath, .Platform$file.sep),  header = FALSE)
    featuresFiltered <- featuresData[V2 %like% "mean\\(\\)|std\\(\\)",]
    
    targetData <- data.table(subject = sourceData$subject, activity = sourceData$label)
    
    for (index in 1:nrow(featuresFiltered)) {
        targetData[,(featuresFiltered$V2[index]):=sourceData[,featuresFiltered$V1[index],with = FALSE]]
    }
    targetData
}

# Generate a tidy data set grouping by subject & activity and calculating the mean for every group. It also writes the tidy data
# set to a file called output.txt
# Parameters:
#   datapath: absoulte path to the directory where output file will be written
#   targetData: the data set to tidy up
# Return: The tidy data set

createTidyDataSet <-  function(datapath, targetData) {

    meltedData <- melt(targetData, id.vars = c("subject","activity"))
    tidyData <- dcast.data.table(meltedData, subject+activity ~ variable, mean)
    write.table(tidyData,paste0(datapath, .Platform$file.sep,"output.txt"),row.names = FALSE )
    tidyData
}
    
# Process the dataset as defined in the code book
# Parameters:
#   datapath: absoulte path to the directory which contains original files
# Return: the desired tidy data set
processUCIDataset <- function(datapath = getwd()) {
    
    library(reshape2)
    library(data.table)
    sourceData <- mergeDataSets(datapath)
    sourceData <- setActivityNames(datapath, sourceData)
    targetData <- extractMeanStd(datapath, sourceData)
    createTidyDataSet(datapath, targetData)
} 
    