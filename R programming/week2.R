pollutantmean <- function(directory, pollutant, id = 1:332){

  mean <- mean(directory[id], na.rm = TRUE)
}

complete <- function(directory, id = 1:322) {
  file_list <- list.files(directory)
  dataset <- data.frame()
  
  for (i in length(file_list)){
    temp_dataset <- read.csv(file_list[i], sep=",")
    dataset <- rbind(dataset, temp_dataset)
  }
  

}