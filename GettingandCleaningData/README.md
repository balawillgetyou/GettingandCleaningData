# GettingandCleaningData

This is the explanation for the code written for the project in the "Getting and Cleaning Data" course on Coursera. 

This is how the R script is organized,

1. The X files are read and combined.
2. Column (measured variable) names provided are afixed to the X tables, mean and standard deviation columns are extracted and a subset of X files is formed.This corresponds to step 2 of the given instruction.
3. Subjects whose activity was measured, are listed in the subject files. These are read, combined and the column named.
4. The Y files identifying the activity codes whose measurements are in the X files are read, combined and the column named.
5. The activity codes to activiy name/ description map is loaded and the column named. 
6. All the pieces of data are assembled. Along with prior steps, this meets the requirement in step 1 of the instructions.
7. Actitvity labels are applied per step 3 of the given instruction.
8. The hyphen and parantheses in the measured variable column names prevent easy usage of the dplyr package. So, these characters are stripped out in the column names. This also makes the column names relatively easy to read per step 4 of the instructions. The temptation to force a change in names just for the sake of doing so has been resisted. "average" could have been prefixed to all column names but this would make the names even longer and less readable.
9. The final data set is being created in two steps. First by grouping, by activity and subject. Then, by summarizing, to obtain the average of each variable for each activity and each subject. Each of the variables is in its own column. The combination of actvity and the subject performing it is an observation and each one is in a separate row.Thus this is tidy data.

IMPORTANT: The project instruction states "The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory." There is no requirement to creating sub directories/ read files from sub- directories. So, the script has been written assuming all the files to be read are in the working directory itself and not in any sub- directories.

Apart from the instructions provided with the project, the following inputs were particularly helpful in putting this response together,

* The image showing how all the different data sets are to be assembled together at https://class.coursera.org/getdata-015/forum/thread?thread_id=112

* Nearly all the specific points within David Hoods' guidance at  https://class.coursera.org/getdata-015/forum/thread?thread_id=26

* Clarifications for what is/ is not tidy data for this specific project at https://class.coursera.org/getdata-015/forum/thread?thread_id=27

* General tidy data concepts in Hadley's white paper at vita.had.co.nz/papers/tidy-data.pdf 
