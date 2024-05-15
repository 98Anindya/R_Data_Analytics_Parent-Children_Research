#BigFiveCompute.csv



csv3_data <- read.csv(file="D:/Research Work/3-parents&children.csv")
print(csv3_data)

#To Sort the useful Data by Last page Check 
library(dplyr)

filtered_data <- csv3_data %>% 
  filter(Last.page >= "7")

#To create the CSV file of the relevant Data
write.csv(filtered_data, file = "D:/Work/test R/filtered_data3.csv", row.names = FALSE)



#library(dplyr)
#Code to delete specific columns (if needed to delete the first 17 info rows )
#selected_columns <- select(csv3_data, -1, -2, -3, -4)
#csv3_data$sumtotal <- 0


# To create a subset of the data set and to remove the charecter part to keep only the needed numeric data 

# Select columns 1-61 from the existing data set
new_data <- filtered_data[, 1:61]

# Extract numerical part for columns 18-61
for (col in 18:61) {
  new_data[ , col] <- as.numeric(gsub("\\D", "", new_data[, col]))
}

# Add five new columns to the new data set
new_data$Extraversion <- 0
new_data$Agreeableness <- 0
new_data$Conscientiousness <- 0
new_data$Neuroticism  <- 0
new_data$Openness <- 0


# Extraversion Compute
# Add the values of columns 18, 28, 33, 43, 53
column_sum <- rowSums(new_data[, c(18, 28, 33, 43, 53)])

# Calculate the values of (6 - column 23), (6 - column 38), (6 - column 48)
column_diff <- (6 - new_data[, 23]) + (6 - new_data[, 38]) + (6 - new_data[, 48])

# Calculate the average of the sum for each row
new_data$Extraversion <- (column_sum + column_diff) / 8




# Agreeableness Compute
# Add the values of columns 24, 34, 39, 49, 59
column_sum <- rowSums(new_data[, c(24, 34, 39, 49, 59)])

# Calculate the values of (6 - column 19), (6 - column 29), (6 - column 44), (6 - column 54)
column_diff <- (6 - new_data[, 19]) + (6 - new_data[, 29]) + (6 - new_data[, 44]) + (6 - new_data[, 54])

# Calculate the average of the sum for each row
new_data$Agreeableness <- (column_sum + column_diff) / 9





# Conscientiousness Compute

column_sum <- rowSums(new_data[, c(20, 30, 45, 50, 55)])

column_diff <- (6 - new_data[, 25]) + (6 - new_data[, 35]) + (6 - new_data[, 40]) + (6 - new_data[, 60])

# Calculate the average of the sum for each row
new_data$Conscientiousness <- (column_sum + column_diff) / 9




# Neuroticism Compute

column_sum <- rowSums(new_data[, c(21, 31, 36, 46, 56)])

column_diff <- (6 - new_data[, 26]) + (6 - new_data[, 41]) + (6 - new_data[, 51])

# Calculate the average of the sum for each row
new_data$Neuroticism <- (column_sum + column_diff) / 8



# Openness Compute

column_sum <- rowSums(new_data[, c(22, 27, 32, 37, 42, 47, 57,61)])

column_diff <- (6 - new_data[, 52]) + (6 - new_data[, 58])

# Calculate the average of the sum for each row
new_data$Openness <- (column_sum + column_diff) / 10


write.csv(new_data, file = "D:/Work/test R/BigFiveCompute.csv", row.names = FALSE)






#END
