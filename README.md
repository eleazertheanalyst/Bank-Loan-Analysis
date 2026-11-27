# End-to-End Bank Loan Analysis (SQL, Power BI)
[Live Dashboard](https://app.fabric.microsoft.com/view?r=eyJrIjoiMTY0MjVjZmUtNzllZS00MjU3LWE2ZDgtYjZlNDM3NjZlMDNkIiwidCI6ImViOGQyOTdiLTQyNWYtNDcyNy05N2QzLTkzNWE3NjlkNDhmOCJ9)

## Project Overview

This project analyzes bank loan data to evaluate lending performance, repayment trends, and loan portfolio quality. The objective was to identify key lending patterns, monitor financial KPIs, and assess the performance of good and bad loans.

SQL Server was used for data exploration and analysis, including loan applications, funded amounts, repayments, interest rates, and debt-to-income ratios. Power BI was used to develop an interactive three-page dashboard featuring financial KPIs, loan performance metrics, geographical analysis, and borrower segmentation.

The final solution provides a comprehensive view of the bank's lending activities and supports data-driven financial decision-making.

# Business Objective

The primary objectives of this analysis were to:
- Measure total loan applications and funded amounts.
- Analyze total repayments received.
- Monitor average interest rates and debt-to-income (DTI) ratios.
- Evaluate good loan vs. bad loan performance.
- Track MTD, PMTD, and MoM performance.
- Identify geographical lending patterns across states.
- Analyze loan distribution by term, employee length, purpose, and homeownership.

# Steps Followed

#### Phase 1: SQL (Data Exploration & Analysis)

- Imported and explored the bank loan dataset using SQL Server.
- Calculated total loan applications using COUNT().
- Analyzed funded amounts and repayments using SUM().
- Calculated average interest rates and DTI ratios using AVG().
- Performed MTD and PMTD comparisons.
- Analyzed good and bad loan percentages using CASE WHEN.
- Evaluated loan performance by repayment status.
- Conducted monthly loan application and repayment trend analysis.
- Analyzed loan distribution by:
    - State
    - Loan Term
    - Employee Length
    - Loan Purpose
    - Homeownership
    - Loan Grade

#### Phase 2: Power BI (Dashboard Development)

- Imported the bank loan dataset into Power BI.
- Created a date table for time-based analysis.
- Developed key performance indicators (KPIs):

    - **Total Loan Applications**
      ```
      Total Loan Application = COUNT(financial_loan[id])
      ```

    - **Total Funded Amount**
      ```
      Total Funded Amount = SUM(financial_loan[loan_amount])
      ```

    - **Total Amount Received**
      ```
      Total Amount Received = SUM(financial_loan[total_payment])
      ```

    - **Average Interest Rate**
      ```
      Avg Interest Rate = AVERAGE(financial_loan[int_rate])
      ```

    - **Average DTI**
      ```
      Avg DTI = AVERAGE(financial_loan[dti])
      ```

    - **Bad Loan Percentage**
      ```
      Bad Loan % =
      DIVIDE(
          CALCULATE(
              [Total Loan Application],
              financial_loan[loan_status (groups)] = "Bad Loan"
          ),
          [Total Loan Application]
      )
      ```

- Developed time intelligence measures:
    - Month-to-Date (MTD).
    - Previous Month-to-Date (PMTD).
    - Month-over-Month (MoM) growth.
- Created dynamic chart titles and report tooltips.
- Implemented interactive slicers for dynamic filtering.

### Dashboard Layout Design

The Power BI report consists of three interactive pages:

**1. Summary Dashboard**
- Overall loan application KPIs.
- Total funded and received amounts.
- Average interest rate and DTI.
- Good loan vs. bad loan percentages.
- Good and bad loan funded and received amounts.
- Loan status breakdown by applications, funded amounts, repayments, interest rates, and DTI.
- State, grade, and purpose filters.

**2. Overview Dashboard**
- Monthly repayment trends using a line chart.
- Geographical loan distribution using a US state map.
- State-level comparison of total amounts received using a ranked bar chart.
- Loan performance by employee length.
- Loan distribution by term (36 months vs. 60 months).
- Loan purpose breakdown by total amount received.
- Dynamic measure selection and interactive filters for Home Ownership, grade, and good vs. bad loans.

**3. Details Dashboard**
- Detailed loan-level records.
- Loan ID search functionality.
- Loan purpose and homeownership.
- Loan grade and issue date.
- Total funded amount, interest rate, and amount received.
- Interactive filters for measure selection, state, grade, and loan quality.

The report was published to Power BI Service.

# Snapshot of Dashboard (Power BI)

### Summary Dashboard
<img width="1432" height="807" alt="Summary" src="https://github.com/user-attachments/assets/c7a6075b-11d1-467d-82b4-355a8d21fb5c" />

### Overview Dashboard
<img width="1429" height="804" alt="Overview" src="https://github.com/user-attachments/assets/0740b71b-7ccf-4fbd-9899-38d21f023aa2" />

### Details Dashboard
<img width="1436" height="806" alt="Details" src="https://github.com/user-attachments/assets/195c3d57-08a6-4cae-b7e2-6a7a6c425235" />

# Key Insights & Analytical Findings

### Overall Lending Performance
- 38,576 total loan applications.
- Approximately $435.8M in funded loans.
- Approximately $473.1M in repayments received.
- Average interest rate of 12.05%.
- Average DTI ratio of 13.33%.

**Insight:** The bank received approximately $473.1M in repayments against $435.8M in funded loans.

### Good Loan Performance
- 86.2% of applications were classified as good loans.
- 32,145 loans were fully paid.
- 1,098 loans were current.
- Approximately $370.2M in good loan funded amounts.

**Insight:** The majority of loan applications fell into the good loan category.

### Bad Loan Performance
- 13.8% of applications were classified as bad loans.
- 5,333 loans were charged off.
- Approximately $65.5M was funded toward charged-off loans.
- Approximately $37.3M was received from charged-off loans.

**Insight:** Charged-off loans represent a significant lending risk and highlight the importance of monitoring loan quality.

### Geographical Analysis
- California recorded the highest total amount received at approximately $84M.
- New York followed with approximately $46M.
- Texas recorded approximately $34M.

**Insight:** Lending repayments are concentrated in certain states, making geographical segmentation useful for monitoring regional portfolio performance.

### Loan Purpose Analysis
- Debt consolidation generated the highest amount received at approximately $253.8M.
- Credit card loans accounted for approximately $65.2M.
- Home improvement loans accounted for approximately $36.4M.

**Insight:** Debt consolidation represents the largest loan purpose by repayment amount in the portfolio.

### Borrower & Loan Term Analysis
- Borrowers with 10+ years of employment accounted for approximately $126M in repayments.
- 36-month loans accounted for approximately $294.7M (62.3%) of total repayments.
- 60-month loans accounted for approximately $178.4M (37.7%).

**Insight:** Loan performance varies across employment experience and repayment terms, providing useful dimensions for evaluating borrower segments.

# Technical Skills Demonstrated

- **SQL Server:** Data exploration, aggregation, filtering, conditional logic, and financial analysis.
- **Power BI:** Interactive dashboard development and data visualization.
- **DAX:** KPI development, CALCULATE, DIVIDE, and time intelligence.
- **Data Modeling:** Date table creation and time-based analysis.
- **Financial Analytics:** Loan performance, repayment analysis, and portfolio risk assessment.
- **Data Storytelling:** Translating financial data into meaningful business insights.
