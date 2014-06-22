

uciHarDataURL     <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
uciHarDataName    <- "Dataset.zip"
#Make sure the required directories are created
dataPath          <- "./data"
tempPath          <- "./tmp"
outputPath        <- "./out"

if (!file.exists(dataPath)) { dir.create(dataPath) }
if (!file.exists(tempPath)) { dir.create(tempPath) }
if (!file.exists(outputPath)) { dir.create(outputPath) }


#where will the data live after the file is downloaded and processed
#This assumes the format of the dataset directory structure does not change
uciHarDataPath      <- paste(dataPath, "UCI HAR Dataset", sep="/")

##Zip file will go on the tmp folder
uciHarZipFilePath <- paste(tempPath,uciHarDataName,sep="/")

# Download the data set if it does not already exist locally
# If you want to refresh the dataset delete the "./data/UCI HAR Dataset" directory
if(!file.exists(uciHarZipFilePath)){
  message( paste("File doesn't exist, retriving from ", uciHarDataURL) )
  download.file(url=uciHarDataURL, destfile=uciHarZipFilePath,method="curl")
}

# Extract files to the data path
unzip(zipfile=uciHarZipFilePath, exdir=dataPath)

# Bind multiple data files together,  every data file in the list should have the
# same row dimension
cbindMultiFile <- function(files,baseFilePath=uciHarDataPath,baseFile=NULL){
  for(file in files){
    fullFilePath <- paste(baseFilePath,file, sep="/")
    newColumn    <- read.table(fullFilePath, header=FALSE)
    baseFile     <- if(is.null(baseFile)){ newColumn } else { cbind(baseFile, newColumn) }
  }
 baseFile
}

#combine each data set and then aggregate in to a single table
trainTable   <- cbindMultiFile( c("train/subject_train.txt","train/Y_train.txt","train/X_train.txt") )
testTable    <- cbindMultiFile( c("test/subject_test.txt","test/Y_test.txt","test/X_test.txt"))
fullDataTable <- rbind(testTable, trainTable)


# Read the names of the features from the features file
#names(xTrain) <- features[,2]
# SubjectID, Class_Label and features
features <- read.table(file=paste(uciHarDataPath,"features.txt",sep="/"),header=FALSE)

#source the activities labels
activities <- read.table(file=paste(uciHardDataPath,"activity_labels.txt", sep="/", header=FALSE) )

#label the full data table appropriately
names(fullDataTable)[1:2]   <- c("Subject ID", "Class")
names(fullDataTable)[3:ncol(fullDataTable)] <- as.vector(features[,"V2"])

#Now we have the full data set combined in to a single data table and labeled appropriately
columnsForSummary <- grep("mean|std|Class|Subject", names(fullDataTable))
dataForSummary    <- fullDataTable[,columnsForSummary]

##Merge in the activity names
names(activityNames) <- c("Class", "Class_Name")
dataForFile <- merge(x=dataForSummary, y=activities, by.x="Class", by.y="Class" )

#Now we have a single tidy data set,  lets write this out to a file.
outputFile        <- paste(outputPath, "avg_std_summary.txt", sep="/")

message("Writing Average and Standard Deviation Summary to ./out/")
write.csv(dataForFile, outputFile)
