## Run Simple analysis of Human Activity Recognition Using Smartphones Dataset

The data is currently found here:
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
 this url is hard coded in to the run_analysis script.

### Usage
All of the code is currently contained in the run_analysis.R file. When you run the file it will do the following:

* The run_analysis.R file is completely self contained and assumes the running user has directory creation rights
* The script will sure the required directorires are created( ./tmp, ./data, ./out) (note taht ./tmp and ./data are not in the repository)
* Check if you have already downloaded the required data, if not it it will place the data Zip file in ./tmp
* Assuming the data file is in place it will unzip the files in to the ./data directory (Alternatively you can download the files yourself and unzip them to ./data)
* Once the data is present it will combine the files from the test and train directories in to a single data set
* Then the average, Standard devaition, Class Lable and Subject Id related headers will be inspected and used to create a new table
* The new table will be written out to a file called avg_std_summary.txt in the ./out directory

There are several ways to run the file. I have only tested this from the command line but three available methonds are.

Run directly from the command line via the R interpreter
```bash
  R < run_analysis.R --no-save
```

Run the `R` command from the root directory of this project to go in to the R console and source the file
```bash
  $ R

  ...
  Type 'q()' to quit R.
  > source('run_analysis.R')
```

Alternatively you an also source the file from inside of RStudio similar by setting your workind directory to this project and running
```bash
  source('run_analysis.R')
```

I have only tested this on Mac OS so these instructions will be specific to that platform but should also work fine on linux.


