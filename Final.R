#Final_data.csv


# Read the CSV files
data1 <- read.csv("D:/Work/test R/BigFiveCompute.csv")
data2 <- read.csv("D:/Work/test R/Emotional_Intelligence.csv")
data3 <- read.csv("D:/Work/test R/PANAS_C.csv")
data4 <- read.csv("D:/Work/test R/Parental_Authority_Questionnaire.csv")

# Extract the desired columns
columns_to_extract_1 <- c("Extraversion", "Agreeableness", "Conscientiousness","Neuroticism", "Openness")
columns_to_extract_2 <- c("RELATIONSHIP_MANAGEMENT", "SOCIAL_AWARENESS", "Self_Management","SelfAwarness")
columns_to_extract_3 <- c("Positive_Affect", "Negative_Affect")
columns_to_extract_4 <- c("permissive", "authoritarian", "authoritative_flexible")




# Create a new data set of needed columns extracted from their respective meta_datasets
BigFiveCompute_data <- data1[, columns_to_extract_1]
Emotional_Intelligence_data <- data2[, columns_to_extract_2]
PANAS_C_data <- data3[, columns_to_extract_3]
Parental_Authority_Questionnaire_data <- data4[, columns_to_extract_4]

# Merge the extracted columns
merged_data <- cbind(BigFiveCompute_data, Emotional_Intelligence_data, PANAS_C_data, Parental_Authority_Questionnaire_data)

# Write the merged data to a new CSV file
write.csv(merged_data, "D:/Work/test R/Final_data.csv", row.names = FALSE)


#END
