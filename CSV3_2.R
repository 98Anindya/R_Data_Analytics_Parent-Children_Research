#Parental_Authority_Questionnaire.csv



csv3_data <- read.csv(file="D:/Research Work/3-parents&children.csv")
print(csv3_data)

#To Sort the useful Data by Last page Check 
library(dplyr)

filtered_data2 <- csv3_data %>% 
  filter(Last.page >= "7")

#To create the CSV file of the relevant Data
write.csv(filtered_data2, file = "D:/Work/test R/filtered_data2.csv", row.names = FALSE)

filtered_data2$permissive<- 0
filtered_data2$authoritarian <- 0
filtered_data2$authoritative_flexible <- 0


# Define the patterns to be removed
patterns_to_remove <- c("- Strongly disagree", "- Disagree", "- Neither agree nor disagree", "- Agree", "- Strongly Agree")

# Remove the patterns using apply()
filtered_data2[, 181:210] <- apply(filtered_data2[, 181:210], 2, function(x) gsub(paste(patterns_to_remove, collapse = "|"), "", x))


# Convert columns 181 to 210 from character to numeric using a loop
for (i in 181:210) {
  filtered_data2[, i] <- as.numeric(filtered_data2[, i])
}


# permissive
# Create a new column 'permissive' and calculate the sum of specified columns
filtered_data2$permissive <- rowSums(filtered_data2[, c(181, 186, 190, 193, 194, 197, 199, 201, 204, 208)], na.rm = TRUE)


#authoritarian
filtered_data2$authoritarian <- rowSums(filtered_data2[, c(182,183,187,189,192,196,198,205,206,209)], na.rm = TRUE)



#authoritative_flexible
filtered_data2$authoritative_flexible <- rowSums(filtered_data2[, c(184,185,188,191,195,200,202,203,207,210)], na.rm = TRUE)



write.csv(filtered_data2, file = "D:/Work/test R/Parental_Authority_Questionnaire.csv", row.names = FALSE)


#END