# create sub folders
dir.create("raw_data")
dir.create("clean_data")
dir.create("scripts")
dir.create("results")
dir.create("plots")

# import data set
patient_info <- read.csv(file.choose())
View(patient_info)
str(patient_info)

# convert gender variable into factor
patient_info$gender <- as.factor(patient_info$gender)
str(patient_info)

# convert diagnosis variable into factor
patient_info$diagnosis <- as.factor(patient_info$diagnosis)
str(patient_info)

# convert smoker variable into factor
patient_info$smoker <- as.factor(patient_info$smoker)
str(patient_info)

# convert smoker variable factor into numeric
patient_info$smoker_num <- ifelse(patient_info$smoker == "Yes", 1, 0)
str(patient_info)

# save file as csv format
write.csv(patient_info, file = "clean_data/patient_info_clean.csv")

# save R work space
save.image(file = "ChaminiWijethunga_Class_Ib_Assignment.RData")
