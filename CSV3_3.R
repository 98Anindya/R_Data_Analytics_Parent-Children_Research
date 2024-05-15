#PANAS_C.csv


csv3_data <- read.csv(file="D:/Research Work/3-parents&children.csv")
print(csv3_data)

#To Sort the useful Data by Last page Check 
library(dplyr)

filtered_data3 <- csv3_data %>% 
  filter(Last.page >= "7")

#To create the CSV file of the relevant Data
write.csv(filtered_data3, file = "D:/Work/test R/filtered_data3.csv", row.names = FALSE)

filtered_data3$Positive_Affect <- 0
filtered_data3$Negative_Affect <- 0


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
filtered_data3 <- filtered_data3 %>%
  mutate(across(150:179, ~ recode(., !!!replace_rules)))


#Positive_Affect

filtered_data3$Positive_Affect  <- rowSums(filtered_data3[, c(151,155,158,159,162,164,167,168,169,171,179)], na.rm = TRUE)



#Negative_Affect

filtered_data3$Negative_Affect <- rowSums(filtered_data3[, c(152,153,156,157,160,161,163,165,166,170,172,173,175,176,178)], na.rm = TRUE)


write.csv(filtered_data3, file = "D:/Work/test R/PANAS_C.csv", row.names = FALSE)


#END