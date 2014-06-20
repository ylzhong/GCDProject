
Codebook for Tidydata.txt
========================================================

### tidydata.txt contains 180 rows (observations) and 81 columns (2 indentifier colunms and 79 measured variables).


### For rows in this dataset 

Each row is one possible combination of subject id ( value : an integer between 1 and 30 ) and acitivites (value :laying,sitting,standing,walking,walkingdown,walkingup).

### For column (81 in total)

[1] subjectid : subject identifier (type: int)
[2] activity: activity (type : factor)

columns from [3]-[81] are as following 

                  
[3] "tBodyAccmeanX"                "tBodyAccmeanY"               
[5] "tBodyAccmeanZ"                "tBodyAccstdX"                
[7] "tBodyAccstdY"                 "tBodyAccstdZ"                
[9] "tGravityAccmeanX"             "tGravityAccmeanY"            
[11] "tGravityAccmeanZ"             "tGravityAccstdX"             
[13] "tGravityAccstdY"              "tGravityAccstdZ"             
[15] "tBodyAccJerkmeanX"            "tBodyAccJerkmeanY"           
[17] "tBodyAccJerkmeanZ"            "tBodyAccJerkstdX"            
[19] "tBodyAccJerkstdY"             "tBodyAccJerkstdZ"            
[21] "tBodyGyromeanX"               "tBodyGyromeanY"              
[23] "tBodyGyromeanZ"               "tBodyGyrostdX"               
[25] "tBodyGyrostdY"                "tBodyGyrostdZ"               
[27] "tBodyGyroJerkmeanX"           "tBodyGyroJerkmeanY"          
[29] "tBodyGyroJerkmeanZ"           "tBodyGyroJerkstdX"           
[31] "tBodyGyroJerkstdY"            "tBodyGyroJerkstdZ"           
[33] "tBodyAccMagmean"              "tBodyAccMagstd"              
[35] "tGravityAccMagmean"           "tGravityAccMagstd"           
[37] "tBodyAccJerkMagmean"          "tBodyAccJerkMagstd"          
[39] "tBodyGyroMagmean"             "tBodyGyroMagstd"             
[41] "tBodyGyroJerkMagmean"         "tBodyGyroJerkMagstd"         
[43] "fBodyAccmeanX"                "fBodyAccmeanY"               
[45] "fBodyAccmeanZ"                "fBodyAccstdX"                
[47] "fBodyAccstdY"                 "fBodyAccstdZ"                
[49] "fBodyAccmeanFreqX"            "fBodyAccmeanFreqY"           
[51] "fBodyAccmeanFreqZ"            "fBodyAccJerkmeanX"           
[53] "fBodyAccJerkmeanY"            "fBodyAccJerkmeanZ"           
[55] "fBodyAccJerkstdX"             "fBodyAccJerkstdY"            
[57] "fBodyAccJerkstdZ"             "fBodyAccJerkmeanFreqX"       
[59] "fBodyAccJerkmeanFreqY"        "fBodyAccJerkmeanFreqZ"       
[61] "fBodyGyromeanX"               "fBodyGyromeanY"              
[63] "fBodyGyromeanZ"               "fBodyGyrostdX"               
[65] "fBodyGyrostdY"                "fBodyGyrostdZ"               
[67] "fBodyGyromeanFreqX"           "fBodyGyromeanFreqY"          
[69] "fBodyGyromeanFreqZ"           "fBodyAccMagmean"             
[71] "fBodyAccMagstd"               "fBodyAccMagmeanFreq"         
[73] "fBodyBodyAccJerkMagmean"      "fBodyBodyAccJerkMagstd"      
[75] "fBodyBodyAccJerkMagmeanFreq"  "fBodyBodyGyroMagmean"        
[77] "fBodyBodyGyroMagstd"          "fBodyBodyGyroMagmeanFreq"    
[79] "fBodyBodyGyroJerkMagmean"     "fBodyBodyGyroJerkMagstd"     
[81] "fBodyBodyGyroJerkMagmeanFreq"

all of the ([3]-[81]) contain numeric values returned by mean() function with subjectid and acitivty as factors. Correponding code for data processing is in analysis_R.R and ReadMe markdown document. 

