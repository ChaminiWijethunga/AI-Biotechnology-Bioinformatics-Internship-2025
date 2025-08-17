# class_1c
# Practice Exercises 

# ----------------------------------------------------------------------------------------------------------------

# 1. Check Cholesterol level (using if) 
# Write an If statement to check cholesterol level is greater than 240, 
# if true, it will prints “High Cholesterol”

cholesterol <- 230

if(cholesterol > 240) {
  print("High Cholesterol")
}

# ----------------------------------------------------------------------------------------------------------------

# 2. Blood Pressure Status (using if...else)
# Write an if…else statement to check if blood pressure is normal.
# If it’s less than 120, print: “Blood Pressure is normal”
# If false then print: “Blood Pressure is high”

Systolic_bp <- 130

if(Systolic_bp < 120) {
  print("Blood Pressure is normal")
} else {
  print("Blood Pressure is high")
}

# ----------------------------------------------------------------------------------------------------------------

# 3. Automating Data Type Conversion with for loop

# Use patient_info.csv data and metadata.csv
# Perform the following steps separately on each dataset (patient_info.csv data and metadata.csv)
# Create a copy of the dataset to work on.
# Identify all columns that should be converted to factor type.
# Store their names in a variable (factor_cols).

# Example: factor_cols <- c("gender", "smoking_status")

# Use a for loop to convert all the columns in factor_cols to factor type.
# Pass factor_cols to the loop as a vector.

# Hint:
# for (col in factor_cols) {
#   data[[col]] <- as.factor(data[[col]])  # Replace 'data' with the name of your dataset
# }

# Automating data type conversion

# patient_info.csv

# import data from csv
patient_info <- read.csv(file.choose())
# view data in spreadsheet format
View(patient_info)
# check structure of the dataset
str(patient_info)

# create a copy to avoid modifying original data
patient_info_clean <- patient_info

# cols to be converted to factor type
factor_cols <- c("gender", "diagnosis", "smoker")

# convert all the columns in factor_cols to factor type
for (col in factor_cols) {
  patient_info_clean[[col]] <- as.factor(patient_info_clean[[col]])
}
str(patient_info_clean)

# metadata.csv

# import data from csv
metadata <- read.csv(file.choose())
# view data in spreadsheet format
View(metadata)
# check structure of the dataset
str(metadata)

# create a copy to avoid modifying original data
metadata_clean <- metadata

# cols to be converted to factor type
factor_cols <- c("height", "gender")

# convert all the columns in factor_cols to factor type
for (col in factor_cols) {
  metadata_clean[[col]] <- as.factor(metadata_clean[[col]])
}

str(metadata_clean)

# ----------------------------------------------------------------------------------------------------------------

# 4. Converting Factors to Numeric Codes

# Choose one or more factor columns (e.g., smoking_status).
# Convert "Yes" to 1 and "No" to 0 using a for loop.

# Hint:
# binary_cols <- c("smoking_status")   # store column names in a vector
# use ifelse() condition inside the loop to replace Yes with 1 and No with 0
# for (col in binary_cols) {
#   data[[col]] <- # insert your ifelse() code here
# }

# Converting Factors to Numeric Codes

# patient_info.csv

# store column names in a vector
binary_cols_1 <- c("smoker")

# convert factors to numeric
for (col in binary_cols_1) {
    patient_info_clean[[col]] <- ifelse(patient_info_clean$smoker == "Yes", 1, 0)
  }

binary_cols_2 <- c("gender")

for (col in binary_cols_2) {
  patient_info_clean[[col]] <- ifelse(patient_info_clean$gender == "Female", 1, 0)
}

binary_cols_3 <- c("diagnosis")

for (col in binary_cols_3) {
  patient_info_clean[[col]] <- ifelse(patient_info_clean$diagnosis == "Cancer", 1, 0)
}


# Converting Factors to Numeric Codes

# metadata.csv

# store column names in a vector
#metadata_clean$gender_meta <- metadata_clean$gender
binary_cols_4 <- c("gender")

# convert factors to numeric
for (col in binary_cols_4) {
  metadata_clean[[col]] <- ifelse(metadata_clean$gender == "Female", 1, 0)
}

str(metadata_clean)

# ----------------------------------------------------------------------------------------------------------------

#  Verification:
#    Compare the original and modified datasets to confirm changes.
#    str(original_data)
#    str(data)

# patient_info.csv

# original data
str(patient_info)
# modified data
str(patient_info_clean)

# metadata.csv

# original data
str(metadata)
# modified data
str(metadata_clean)

# ----------------------------------------------------------------------------------------------------------------

# Final Note:
# All instructions are written as comments.
# For actual code execution, remove the # symbol from each line you want to run.


