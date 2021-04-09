pollutantmean <- function(directory, pollutant, id = 1:332){
  file_list <- list.files(directory, full.names = TRUE)
  dataset <- data.frame()
  for (i in id){
    temp_dataset <- read.csv(file_list[i], sep=",")
    dataset <- rbind(dataset, temp_dataset)
  }
  mean_pollutant <- mean(dataset[ ,pollutant], na.rm = TRUE)
  mean_pollutant
}

complete <- function(directory, id = 1:322) {
  file_list <- list.files(directory, full.names = TRUE)
  nobs <- data.frame()
  for (i in id){
    temp_dataset <- read.csv(file_list[i], sep=",")
    temp_nobs <- temp_dataset[complete.cases(temp_dataset), ]
    nobs <- rbind(nobs, temp_nobs)
  }
  ##result <- aggregate(id ~ brand, data = DF, paste, collapse = ",")
  result <- aggregate("sulfate" ~ "nitrate ID", data = nobs, paste, collapse = ",")
  result
}

weightmedian <- function(directory, day)  {
  files_list <- list.files(directory, full.names=TRUE)   #creates a list of files
  dat <- data.frame()                             #creates an empty data frame
  for (i in 1:length(files_list)) {                                
    #loops through the files, rbinding them together 
    dat <- rbind(dat, read.csv(files_list[i]))
  }
  dat_subset <- dat[which(dat[, "Day"] == day),]  #subsets the rows that match the 'day' argument
  median(dat_subset[, "Weight"], na.rm=TRUE)      #identifies the median weight 
  #while stripping out the NAs
}

colnameToNumber <- function(colname){
  colname <- tolower(colname)
  az <- letters  # c("a", ... , "z")
  aaz <- paste("a", az, sep = "")  
  # c("aa", "ab", ... , "az")
  # additional column names
  baz <- paste("b", az, sep = "")
  caz <- paste("c", az, sep = "")
  daz <- paste("d", az, sep = "")
  
  # concatenate the column names
  colnames <- c(az, aaz, baz, caz, daz)
  
  # get the number corresponding to the input column name
  # using the which function
  colnumber <- which(colnames == colname)
  # test for having found a (unique) match
  if(length(colnumber) != 1) stop("no match to colname")
  return(colnumber)
}

colnameToLetter <- function(letter){
  
  
}
