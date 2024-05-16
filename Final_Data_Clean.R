#Final Data Clean

csv3_data <- read.csv(file="D:/Research Work/3-parents&children.csv")
print(csv3_data)

#To Sort the useful Data by Last page Check 
library(dplyr)

filtered_data <- csv3_data %>% 
  filter(Last.page >= "7")

#To create the CSV file of the relevant Data
write.csv(filtered_data, file = "D:/Work/test R/filtered_data.csv", row.names = FALSE)


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


#oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo

filtered_data$permissive<- 0
filtered_data$authoritarian <- 0
filtered_data$authoritative_flexible <- 0


# Define the patterns to be removed
patterns_to_remove <- c("- Strongly disagree", "- Disagree", "- Neither agree nor disagree", "- Agree", "- Strongly Agree")

# Remove the patterns using apply()
filtered_data[, 181:210] <- apply(filtered_data[, 181:210], 2, function(x) gsub(paste(patterns_to_remove, collapse = "|"), "", x))


# Convert columns 181 to 210 from character to numeric using a loop
for (i in 181:210) {
  filtered_data[, i] <- as.numeric(filtered_data[, i])
}


# permissive
# Create a new column 'permissive' and calculate the sum of specified columns
filtered_data$permissive <- rowSums(filtered_data[, c(181, 186, 190, 193, 194, 197, 199, 201, 204, 208)], na.rm = TRUE)


#authoritarian
filtered_data$authoritarian <- rowSums(filtered_data[, c(182,183,187,189,192,196,198,205,206,209)], na.rm = TRUE)



#authoritative_flexible
filtered_data$authoritative_flexible <- rowSums(filtered_data[, c(184,185,188,191,195,200,202,203,207,210)], na.rm = TRUE)


#oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo


filtered_data$Positive_Affect <- 0
filtered_data$Negative_Affect <- 0


#Replacing Charecter to Numeric in the dataset

library(dplyr)

# Define the replacement rules
replace_rules <- list(
  `1 - Very slightly` = 1,
  `2 - A little` = 2,
  `3 - Moderately` = 3,
  `4 - Quite a bit` = 4,
  `5 - Extremely` = 5
)

# Apply the replacement rules to columns 150-179
filtered_data <- filtered_data %>%
  mutate(across(150:179, ~ recode(., !!!replace_rules)))


#Positive_Affect

filtered_data$Positive_Affect  <- rowSums(filtered_data[, c(151,155,158,159,162,164,167,168,169,171,179)], na.rm = TRUE)



#Negative_Affect

filtered_data$Negative_Affect <- rowSums(filtered_data[, c(152,153,156,157,160,161,163,165,166,170,172,173,175,176,178)], na.rm = TRUE)



#oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo


new_data <- filtered_data[, 1:89]


#Part 1

# Assuming 'new_data' is your data set

# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_range <- 62:67

# Create columns for each string count
for (string in strings) {
  count <- rowSums(new_data[, column_range] == string)
  
  new_data[string] <- count[TRUE]
}

new_data$Sum_SelfAwarness <- 0
new_data$SelfAwarness <- 0


# Assuming 'new_data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never" = 1, "Rarely" = 2, "Sometimes" = 3, "Usually" = 4, "Almost always" = 5, "Always" = 6)

# Compute the sum of multiplied values
new_data$Sum_SelfAwarness <- apply(new_data[, c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")], 1, function(x) sum(x * sapply(names(x), function(y) column_values[y])))




# Assuming 'new_data' is your data set
# Assuming 'columnA' is the column where you want to check and replace values

# Create a lookup table or named vector for mapping
mapping <- c("6" = 10,  "7"=10, "8" = 14, "9" = 21, "10" = 26, "11" = 33, "12" = 39, "13" = 46, "14" = 52, "15" = 58, "16" = 61, "17" = 64, "18" = 67, "19" = 70, "20" = 72, "21" = 73, "22" = 74, "23" = 76, "24" = 77, "25" = 79, "26" = 82, "27" = 83, "28" = 85, "29" = 86, "30" = 89, "31" = 90, "32" = 92, "33" = 94, "34" = 96, "35" = 98, "36" = 100)

# Create a new column 'columnB' with the mapped values
new_data$SelfAwarness <- mapping[as.character(new_data$Sum_SelfAwarness)]

#======================================================================================

#Part 2

# Assuming 'new_data' is your data set

# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_range <- 68:74

# Create columns for each string count
for (string in strings) {
  count <- rowSums(new_data[, column_range] == string)
  
  new_col_name <- paste0(string, "_1")
  new_data[new_col_name] <- count[TRUE]
}

# Assuming 'new_data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never_1" = 1, "Rarely_1" = 2, "Sometimes_1" = 3, "Usually_1" = 4, "Almost always_1" = 5, "Always_1" = 6)

# Compute the sum of multiplied values
new_data$SumA <- apply(new_data[, c("Never_1", "Rarely_1", "Sometimes_1", "Usually_1", "Almost always_1", "Always_1")], 1, function(x) sum(x * sapply(names(x), function(y) column_values[y])))



# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_range <- 75:76

# Create columns for each string count
for (string in strings) {
  count <- rowSums(new_data[, column_range] == string)
  
  new_col_name <- paste0(string, "_2")
  new_data[new_col_name] <- count[TRUE]
}

# Assuming 'data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never_2" = 6, "Rarely_2" = 5, "Sometimes_2" = 4, "Usually_2" = 3, "Almost always_2" = 2, "Always_2" = 1)

# Compute the sum of multiplied values
new_data$SumB <- apply( new_data[, c("Never_2", "Rarely_2", "Sometimes_2", "Usually_2", "Almost always_2", "Always_2")],1, function(x) sum(x * sapply(names(x), function(y) column_values[y])))

#Adding the sum of the two Columns SumA and SumB to get the Sum_Self-Management Score

new_data$Sum_Self_Management <- new_data$SumA + new_data$SumB


# Assuming 'columnA' is the column where you want to check and replace values

# Create a lookup table or named vector for mapping
mapping <- c("9" = 10, "10" = 10, "11" = 13, "12" = 15, "13" = 16, "14" = 18, "15" = 20, "16" = 21, "17" = 23, "18" = 26, "19" = 28, "20" = 31, "21" = 33, "22" = 34, "23" = 36, "24" = 37, "25" = 39, "26" = 40, "27" = 45, "28" = 49, "29" = 52, "30" = 55, "31" = 58, "32" = 62, "33" = 65, "34" = 68, "35" = 71, "36" = 73, "37" = 74, "38" = 75, "39" = 76, "40" = 78, "41" = 80, "42" = 82, "43" = 85, "44" = 87, "45" = 91, "46" = 92, "47" = 93, "48" = 94, "49" = 95, "50" = 96, "51" = 97, "52" = 98, "53" = 99, "54" = 100)


# Create a new column 'columnB' with the mapped values
new_data$Self_Management <- mapping[as.character(new_data$Sum_Self_Management)]



#======================================================================================

#Part 3


# Assuming 'new_data' is your data set

# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_range <- 77:80

# Create columns for each string count
for (string in strings) {
  count <- rowSums(new_data[, column_range] == string)
  
  new_col_name <- paste0(string, "_3")
  new_data[new_col_name] <- count[TRUE]
}

# Assuming 'new_data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never_3" = 1, "Rarely_3" = 2, "Sometimes_3" = 3, "Usually_3" = 4, "Almost always_3" = 5, "Always_3" = 6)

# Compute the sum of multiplied values
new_data$SumC <- apply(new_data[, c("Never_3", "Rarely_3", "Sometimes_3", "Usually_3", "Almost always_3", "Always_3")], 1, function(x) sum(x * sapply(names(x), function(y) column_values[y])))




# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_index <- 81

# Create columns for each string count
for (string in strings) {
  existence <- as.numeric(new_data[, column_index] == string)
  #count <- new_data[, column_index] == string
  new_col_name <- paste0(string, "_4")
  new_data[new_col_name] <- existence
}

# Assuming 'new_data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never_4" = 6, "Rarely_4" = 5, "Sometimes_4" = 4, "Usually_4" = 3, "Almost always_4" = 2, "Always_4" = 1)

# Compute the sum of multiplied values
new_data$SumD <- rowSums(new_data[, paste0(strings, "_4")] * sapply(names(new_data[, paste0(strings, "_4")]), function(y) column_values[y]))


#Adding the sum of the two Columns SumC and SumD to get the Sum_Self-Management Score

new_data$Sum_SOCIAL_AWARENESS <- new_data$SumC + new_data$SumD


# Assuming 'columnA' is the column where you want to check and replace values

# Create a lookup table or named vector for mapping
mapping <- c("5" = 10, "6" = 15, "7" = 20, "8" = 25, "9" = 32, "10" = 40, "11" = 47, "12" = 54, "13" = 58, "14" = 62, "15" = 64, "16" = 65, "17" = 68, "18" = 70, "19" = 72, "20" = 74, "21" = 76, "22" = 77, "23" = 79, "24" = 81, "25" = 88, "26" = 90, "27" = 92, "28" = 93, "29" = 96, "30" = 100)


# Create a new column 'columnB' with the mapped values
new_data$SOCIAL_AWARENESS <- mapping[as.character(new_data$Sum_SOCIAL_AWARENESS)]





#======================================================================================

#Part 4

# Assuming 'new_data' is your data set

# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_range <- 82:88

# Create columns for each string count
for (string in strings) {
  count <- rowSums(new_data[, column_range] == string)
  
  new_col_name <- paste0(string, "_5")
  new_data[new_col_name] <- count[TRUE]
}

# Assuming 'new_data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never_5" = 1, "Rarely_5" = 2, "Sometimes_5" = 3, "Usually_5" = 4, "Almost always_5" = 5, "Always_5" = 6)

# Compute the sum of multiplied values
new_data$SumE <- apply(new_data[, c("Never_5", "Rarely_5", "Sometimes_5", "Usually_5", "Almost always_5", "Always_5")], 1, function(x) sum(x * sapply(names(x), function(y) column_values[y])))




# Specify the strings to count
strings <- c("Never", "Rarely", "Sometimes", "Usually", "Almost always", "Always")

column_index <- 89

# Create columns for each string count
for (string in strings) {
  count <- as.numeric(new_data[, column_index] == string)
  
  new_col_name <- paste0(string, "_6")
  new_data[new_col_name] <- count
}

# Assuming 'new_data' is your data set

# Specify the column names and their corresponding integer values
column_values <- c("Never_6" = 6, "Rarely_6" = 5, "Sometimes_6" = 4, "Usually_6" = 3, "Almost always_6" = 2, "Always_6" = 1)

# Compute the sum of multiplied values
new_data$SumF <- rowSums(new_data[, paste0(strings, "_6")] * sapply(names(new_data[, paste0(strings, "_6")]), function(y) column_values[y]))




#Adding the sum of the two Columns SumE and SumF to get the Sum_Self-Management Score

new_data$Sum_RELATIONSHIP_MANAGEMENT <- new_data$SumE + new_data$SumF


# Assuming 'columnA' is the column where you want to check and replace values

# Create a lookup table or named vector for mapping
mapping <- c("8" = 10, "9" = 13, "10" = 17, "11" = 19, "12" = 21, "13" = 22, "14" = 25, "15" = 27, "16" = 29, "17" = 30, "18" = 32, "19" = 36, "20" = 39, "21" = 43, "22" = 45, "23"= 48 , "24" = 50, "25" = 53, "26" = 56, "27" = 57, "28" = 59, "29" = 61, "30" = 65, "31" = 67, "32" = 70, "33" = 71, "34" = 73, "35" = 75, "36" = 77, "37" = 78, "38" = 80, "39" = 83, "40" = 84, "41" = 86, "42" = 87, "43" = 89, "44" = 91, "45" = 93, "46" = 95, "47" = 96, "48" = 100)


# Create a new column 'columnB' with the mapped values
new_data$RELATIONSHIP_MANAGEMENT <- mapping[as.character(new_data$Sum_RELATIONSHIP_MANAGEMENT)]


#======================================================================================

#Final Calculations 

new_data$Emotional_Intelligence_Skills <- new_data$RELATIONSHIP_MANAGEMENT + new_data$SOCIAL_AWARENESS + new_data$Self_Management + new_data$SelfAwarness



# Define the ranges and their corresponding values
ranges <- c(40, 48, 49, 68, 69, 88, 89, 108, 109, 128, 129, 148, 149, 167, 168, 187, 188, 203, 204, 211, 212, 219, 220, 227, 228, 238, 239, 242, 243, 246, 247, 250, 251, 254, 255, 258, 259, 262, 263, 266, 267, 270, 271, 273, 274, 277, 278, 281, 282, 285, 286, 289, 290, 293, 294, 297, 298, 301, 302, 305, 306, 309, 310, 313, 314, 318, 309, 323, 324, 326, 327, 330, 331, 334, 335, 337, 338, 341, 342, 344, 345, 348, 349, 352, 353, 356, 357, 360, 361, 364, 365, 368, 369, 372, 373, 376, 377, 380, 381, 385, 386, 389, 390, 393, 394, 396, 397, 400)
values <- c(10, 15, 20, 25, 30, 35, 40, 45, 50, 52, 54, 56, 58, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100)

# Create a new column to store the assigned values
new_data$Overall_EQ <- NA

# Check and assign values based on the ranges
for (i in seq(1, length(ranges), 2)) {
  lower <- ranges[i]
  upper <- ranges[i + 1]
  value <- values[(i + 1) / 2]
  
  new_data$Overall_EQ <- ifelse(new_data$Emotional_Intelligence_Skills >= lower & new_data$Emotional_Intelligence_Skills <= upper, value, new_data$Overall_EQ)
}

#To create the CSV file of the relevant Data
write.csv(filtered_data, file = "D:/Work/test R/Data_Clean_Final.csv", row.names = FALSE)









