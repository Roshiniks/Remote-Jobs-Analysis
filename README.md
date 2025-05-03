# Remote Jobs Data Analysis Project

In this project, I scraped data from [remoteok.com](https://remoteok.com) and performed Exploratory Data Analysis (EDA) using Python. I also used SQL to extract meaningful insights.  
From the analysis, I identified **Contra** as one of the most frequently hiring and highest-paying companies.

---

## 📁 Project Files

- `Remote_Jobs_Scrape.ipynb`  
  Jupyter Notebook to scrape job listings from the remote job board and save them as a CSV file.

- `EDA_and_Visualization.ipynb`  
  Notebook for cleaning the data, performing EDA, and creating visualizations to understand trends.

- `SQL_Insights.sql`  
  Contains SQL queries used to derive insights from the cleaned data stored in a MySQL database.

- `Remote_Jobs.csv`  
  The original raw dataset obtained through web scraping.

- `Remote_Jobs_Cleaned_data.csv`  
  The cleaned and preprocessed version of the dataset used for analysis.

- `Remote_Jobs_Presentation.pptx`  
  Final PowerPoint presentation summarizing methodology, insights, and conclusions.

---

## 📄 Extracted Columns

- **Job Title** – Title of the job position.  
- **Company** – Name of the company offering the job.  
- **Location** – Job location (or marked as 'NA' if not provided).  
- **Minimum Salary (Rupees)** – Minimum salary offered (or 'NA' if missing).  
- **Maximum Salary (Rupees)** – Maximum salary offered (or 'NA' if missing).  
- **Date Posted** – Cleaned and formatted job post date.  

---

## Technologies Used

- **Python** – For web scraping, data analysis, and visualization  
  - Libraries: `requests`, `pandas`, `matplotlib`, `seaborn`
- **MySQL** – To perform data queries and extract insights
- **Jupyter Notebook** – For development and analysis
- **MySQL Workbench** – To run SQL scripts and test queries

---

## Insights

- Most common job locations
- Most in-demand job titles
- Top companies hiring for remote roles
- Salary trends and ranges
- Frequently required skills for remote jobs

---

## Author

**K S Roshini**  
Aspiring Data Analyst | Learner at Masai School  
GitHub: [Roshiniks](https://github.com/Roshiniks)
