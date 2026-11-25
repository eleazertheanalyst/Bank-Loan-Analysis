# End-to-End Bank Loan Analysis (SQL, Power BI)

## Project Overview

This project analyzes bank loan data to evaluate lending performance, repayment trends, loan quality, and borrower characteristics. The objective was to monitor key lending KPIs, identify patterns in loan defaults, and provide insights into the bank's overall loan portfolio performance.

SQL Server was used for data exploration and analysis, including loan application metrics, funded amounts, repayments, interest rates, and debt-to-income ratios. Power BI was used to develop an interactive three-page dashboard that provides insights into loan performance, borrower characteristics, and lending trends.

The final solution delivers a decision-support dashboard that enables stakeholders to monitor loan performance and assess lending risk.

# Business Objective

The primary objectives of this analysis were to:
- Measure total loan applications and funded amounts.
- Analyze total repayments received by the bank.
- Monitor average interest rates and debt-to-income (DTI) ratios.
- Evaluate good loan vs. bad loan performance.
- Analyze month-to-date (MTD), previous month-to-date (PMTD), and month-over-month (MoM) performance.
- Identify lending trends across states, loan terms, and loan purposes.
- Understand borrower characteristics through employment length and homeownership analysis.

# Steps Followed

#### Phase 1: SQL (Data Exploration & Analysis)

- Imported and explored the bank loan dataset using SQL Server.
- Analyzed total loan applications using COUNT().
- Calculated total funded amounts and repayments using SUM().
- Calculated average interest rates and debt-to-income ratios using AVG().
- Performed MTD and PMTD analysis to compare monthly lending performance.
- Calculated good loan and bad loan percentages using conditional aggregation and CASE WHEN.
- Grouped loans by repayment status to evaluate portfolio performance.
- Conducted monthly loan application and repayment trend analysis.
- Analyzed loan distribution across:
    - State
    - Loan Term
    - Employee Length
    - Loan Purpose
    - Homeownership
    - Loan Grade
- Applied filtering and aggregation to investigate specific loan segments.

#### Phase 2: Power BI (Dashboard Development)

- Imported the bank loan dataset into Power BI.
- Created a date table to support time-based analysis.
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

    - **Good Loan Percentage**
      ```
      Good Loan % =
      DIVIDE(
          CALCULATE(
              [Total Loan Application],
              financial_loan[loan_status (groups)] = "Good Loan"
          ),
          [Total Loan Application]
      )
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
- Implemented interactive slicers for filtering loan data.

### Dashboard Layout Design

The Power BI report consists of three pages:

**1. Summary Dashboard**
- Overall loan application KPIs.
- Total funded and received amounts.
- Average interest rate and DTI.
- Good loan vs. bad loan analysis.
- Loan performance by status.

**2. Overview Dashboard**
- Monthly amount received trends.
- Loan distribution by state.
- Loan term analysis.
- Loan performance by employee length.
- Loan purpose breakdown.
- Homeownership analysis.

**3. Details Dashboard**
- Detailed loan-level records.
- Loan ID and purpose.
- Homeownership and loan grade.
- Issue date.
- Funded amount and interest rate.
- Amount received.
- Search functionality and interactive filters.

The report was published to Power BI Service.

# Snapshot of Dashboard (Power BI)

### Summary Dashboard

<img width="100%" alt="Bank Loan Summary Dashboard" src="YOUR_SUMMARY_DASHBOARD_IMAGE_URL" />

### Overview Dashboard

<img width="100%" alt="Bank Loan Overview Dashboard" src="YOUR_OVERVIEW_DASHBOARD_IMAGE_URL" />

### Details Dashboard

<img width="100%" alt="Bank Loan Details Dashboard" src="YOUR_DETAILS_DASHBOARD_IMAGE_URL" />

# Key Insights & Analytical Findings

### Overall Lending Performance
- Total loan applications reached 38,576.
- Total funded amount was approximately $435.8M.
- Total amount received was approximately $473.1M.
- Average interest rate was 12.05%.
- Average DTI ratio was 13.33%.

**Insight:** The bank generated approximately $473.1M in repayments against $435.8M in funded loans.

### Good Loan Performance
- Good loans represented approximately 86.2% of applications.
- 32,145 loans were fully paid.
- 1,098 loans were current.
- Good loans accounted for approximately $370.2M in funded amounts.

**Insight:** The majority of loan applications fell into the good loan category, indicating strong overall portfolio performance by application count.

### Bad Loan Performance
- Bad loans represented approximately 13.8% of applications.
- 5,333 loans were charged off.
- Approximately $65.5M was funded toward charged-off loans.
- Approximately $37.3M was received from charged-off loans.

**Insight:** Charged-off loans represent a significant lending risk and highlight the importance of monitoring loan quality.

### Loan Purpose Analysis
- Debt consolidation was the leading loan purpose by funded amount in the overview analysis.
- Other purposes included credit cards, home improvement, small business, and major purchases.

**Insight:** Understanding loan purposes helps the bank identify major sources of lending demand.

### Regional & Borrower Analysis
- Loan performance varied across states.
- Loan terms, employment length, and homeownership provided additional dimensions for evaluating lending patterns.

**Insight:** Segmenting loan performance by geographic and borrower characteristics helps identify differences across the loan portfolio.

# Technical Skills Demonstrated

- **SQL Server:** Data exploration, aggregation, filtering, conditional logic, and financial analysis.
- **Power BI:** Interactive dashboard development and data visualization.
- **DAX:** KPI development, CALCULATE, DIVIDE, and time intelligence functions.
- **Data Modeling:** Date table creation and time-based analysis.
- **Financial Analytics:** Loan performance, repayment analysis, and risk assessment.
- **Data Storytelling:** Translating financial data into meaningful business insights.
