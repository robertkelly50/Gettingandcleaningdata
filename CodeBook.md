This CodeBook describes the variables, the data, and transformations and work performed to clean up the data

Variables and data
-The final table gathers data regarding the average measures of 6 activities undertaken by 30 individuals
- The measures all relate to the mean and standard deviations of the tasks undertaken

Transformations and work
- Firstly, the required datasets are read into R, and rbind is used to join them together
- Grep is then used to select the necessary columns to look at 
- ddply is finally used to create a final 'tidy' table 


