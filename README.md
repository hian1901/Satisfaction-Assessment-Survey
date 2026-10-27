# Satisfaction-Assessment-Survey
# 🧼 Advanced SQL Data Cleaning & String Transformation Project
## 📌 Project Overview
This project focuses on transforming messy, unstructured operational data into an analysis-ready dataset using **MySQL**. The pipeline addresses critical data quality issues: redundant duplicates, trailing whitespaces, unstandardized text casing, missing values, and concatenated fields that require advanced string parsing.
---
## 🛠 Core SQL Toolkit Applied
* **Schema Management:** `ALTER TABLE` (`ADD COLUMN`, `MODIFY COLUMN`, `DROP COLUMN`)
* **Window Functions:** `ROW_NUMBER() OVER (PARTITION BY ...)` for deduplication
* **Advanced String Parsing:** `SUBSTRING_INDEX()`, `SUBSTRING()`
* **String Standardization:** `TRIM()`, `UPPER()`, `CONCAT()`
* **Null Imputation:** `COALESCE()`
