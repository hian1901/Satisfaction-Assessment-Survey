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


## 💡 Business Insights & Strategic Recommendations

### 1. Customer Sentiment & Satisfaction Breakdown
Analysis of customer feedback across the user base reveals a distinct distribution:
* **Satisfied Customers (40.82%):** Form the brand’s core advocates with high engagement.
* **Neutral / Average Experience (29.59%):** A swing group with moderate trust but conditional loyalty.
* **Dissatisfied Customers (~29.59%):** Nearly one-third of customers reported sub-par experiences, posing a major churn risk.

---

### 2. Root Cause: Logistics Bottlenecks & Perception Spillover
* **Key Finding:** Qualitative feedback analysis confirms that **delivery delays (late fulfillment)** are the primary driver of dissatisfaction. Crucially, shipping delays triggered a **negative perception bias**—customers who experienced late delivery also downgraded their rating of the actual product quality, despite product specifications remaining constant.
* **Geographic Concentration:** **100% of negative feedback originated from just two regions: `Capital City` and `Shelbyville`**.
* **Strategic Recommendation:**
  * **Logistics Audit:** Re-evaluate distribution routes, courier partner SLAs, and fulfillment center proximity to Capital City and Shelbyville.
  * **Fulfillment Optimization:** Investigate whether these regions suffer from driver shortages, transit bottlenecks, or excessive distance from the primary warehouse.

---

### 3. High-Risk Retention Alert: At-Risk New Subscribers
* **Key Finding:** A segment within the dissatisfied cohort **still enrolled in paid memberships**, but their visit/order frequency is currently **1**. This pattern indicates they are **brand-new subscribers** who suffered a late delivery on their very first interaction.
* **Strategic Recommendation:**
  * **Proactive Outreach:** Prioritize automated, high-touch customer support for new subscribers in this bracket (e.g., proactive apology notifications, partial delivery refunds, or store credits).
  * **Protect Initial Trust:** Because these users have already demonstrated willingness to commit financially, solving their fulfillment friction immediately is critical to prevent day-30 churn.

---

### 4. Referral Propensity: Converting the Skeptical "Neutral" Segment
* **Key Finding:**
  * **High-Satisfaction Group:** Almost universally enrolled as members with a high willingness to refer friends (acting as Net Promoter Promoters).
  * **Neutral Group (29.59%):** Bifurcated into two distinct subgroups: members willing to refer vs. non-members who are hesitant or skeptical about advocating for the platform.
* **Strategic Recommendation:**
  * **Incentivized Advocacy:** Launch targeted **"Refer-a-Friend"** campaigns offering bilateral rewards (discounts for both referrer and referee) specifically tailored to the neutral customer segment.
  * **Trial Perks:** Introduce limited-time membership perks to nurture skeptical non-members into active promoters.

---

### 🎯 Bottom Line (Core Takeaway)
The single highest-leverage growth and retention initiative for the business is **optimizing logistics and shipping speed**. By eliminating delivery delays in Capital City and Shelbyville, the company can simultaneously recover customer sentiment, defend new subscriber lifetime value (LTV), and unlock viral organic growth through word-of-mouth referrals.
