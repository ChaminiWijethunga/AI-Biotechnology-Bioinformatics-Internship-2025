# Assignment 2
# =============================================================================
# Analyzing the results of differential gene expression

# 1. Define the classify_gene function
classify_gene <- function(logFC, padj){
  ifelse(logFC > 1 & padj < 0.05, "Upregulated",
         ifelse(logFC < -1 & padj < 0.05, "Downregulated", "Not_significant"))
}

# Calculate BMI of two data sets within loop

# 2. Define input and output folders
input_dir <- "raw_data"
output_dir <- "results"

# create output folder if not already exist
if(!dir.exists(output_dir)){
  dir.create(output_dir)
}

# 3. List the files to process
files_to_process <- c("DEGs_Data_1.csv", "DEGs_Data_2.csv")

# 4. Prepare empty list to store results in R
result_list <- list()

# 4. Create loop function
for (file_names in files_to_process) {
  cat("\nProcessing:", file_names, "\n")
  
  # construct input file path
  input_file_path <- file.path(input_dir, file_names)
  
  # import data sets
  data <- read.csv(input_file_path, header = TRUE)
  cat("File imported. Checking for missing values...\n")
  
  # Missing values for logFC - automatically consider as not significant
  # handling missing values - only for padj
  if("padj" %in% names(data)){
    missing_count <- sum(is.na(data$padj))
    # print missing count
    cat("Missing values in 'padj':", missing_count, "\n")
    # replace missing values
    data$padj[is.na(data$padj)] <- 1 # treats as not significant
  }
  
  # apply classify_gene( function)
  data$status <- classify_gene(data$logFC, data$padj) # create a new column for BMI
  cat("Gene classification has been completed successfully.\n")
  
  # print summary counts of classification results
  cat("Summary of classification:\n")
  print(table(data$status))
  
  # save results
  result_list[[file_names]] <- data
  
  # create output file path
  output_file_path <- file.path(output_dir, paste0("Genes_Classified_", file_names))
  
  # save csv files
  write.csv(data, output_file_path, row.names = FALSE)
  cat("Results saved to:", output_file_path, "\n")
}

# access the results
results_1 <- result_list[[1]]
results_2 <- result_list[[2]]

# Save R work space
save.image(file = "ChaminiWijethunga_Class_2_Assignment.RData")
