
-- ============================================================
-- BANK LOAN ANALYSIS
-- Tool: SQL Server
-- Dataset: Bank Loan Data (2021)
-- Objective: Analyze loan applications, funded amounts,
-- repayments, loan quality, and borrower characteristics.
-- ============================================================


-- ============================================================
-- 1. DATA EXPLORATION
-- ============================================================

-- Retrieve all records to inspect the bank loan dataset.
-- The dataset contains loan records through December 2021.

SELECT *
FROM bank_loan_data;


-- ============================================================
-- 2. TOTAL LOAN APPLICATION ANALYSIS
-- ============================================================

-- Calculate the total number of loan applications
-- received throughout the reporting period.

SELECT
    COUNT(id) AS Total_Application
FROM bank_loan_data;


-- Calculate Month-to-Date (MTD) loan applications.
-- MTD represents the total applications received in December 2021.

SELECT
    COUNT(id) AS MTD_Total_Loan_Application
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021;


-- Calculate Previous Month-to-Date (PMTD) loan applications.
-- This measures applications received in November 2021.
-- Used to compare current-month and previous-month performance.

SELECT
    COUNT(id) AS PMTD_Total_Loan_Application
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = 2021;


-- MoM Growth Formula:
-- (Current Month - Previous Month) / Previous Month


-- ============================================================
-- 3. TOTAL FUNDED AMOUNT ANALYSIS
-- ============================================================

-- Calculate the total amount of money funded across all loans.

SELECT
    SUM(loan_amount) AS Total_Funded_Amount
FROM bank_loan_data;


-- Calculate the total amount funded in December 2021 (MTD).

SELECT
    SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021;


-- Calculate the total amount funded in November 2021 (PMTD).
-- Used to compare funding performance against December.

SELECT
    SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM bank_loan_data
WHERE MONTH(issue_date) = 11
  AND YEAR(issue_date) = 2021;


-- ============================================================
-- 4. TOTAL AMOUNT RECEIVED ANALYSIS
-- ============================================================

-- Calculate the total repayments received from borrowers
-- across all loan applications.

SELECT
    SUM(total_payment) AS Total_Amount_Received
FROM bank_loan_data;


-- Calculate the total repayments received in December 2021 (MTD).

SELECT
    SUM(total_payment) AS MTD_Total_Amount_Received
FROM bank_loan_data
WHERE YEAR(issue_date) = 2021
  AND MONTH(issue_date) = 12;


-- Calculate the total repayments received in November 2021 (PMTD).

SELECT
    SUM(total_payment) AS PMTD_Total_Amount_Received
FROM bank_loan_data
WHERE YEAR(issue_date) = 2021
  AND MONTH(issue_date) = 11;


-- ============================================================
-- 5. AVERAGE INTEREST RATE ANALYSIS
-- ============================================================

-- Calculate the overall average interest rate across all loans.
-- Multiply by 100 to express the decimal rate as a percentage.

SELECT
    ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_Rate
FROM bank_loan_data;


-- Calculate the average interest rate for December 2021 (MTD).

SELECT
    ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE YEAR(issue_date) = 2021
  AND MONTH(issue_date) = 12;


-- Calculate the average interest rate for November 2021 (PMTD).

SELECT
    ROUND(AVG(int_rate), 4) * 100 AS PMTD_Avg_Interest_Rate
FROM bank_loan_data
WHERE YEAR(issue_date) = 2021
  AND MONTH(issue_date) = 11;


-- ============================================================
-- 6. DEBT-TO-INCOME (DTI) ANALYSIS
-- ============================================================

-- Calculate the overall average debt-to-income ratio.
-- DTI measures the proportion of a borrower's income
-- committed to debt payments.

SELECT
    ROUND(AVG(dti), 4) * 100 AS Avg_DTI
FROM bank_loan_data;


-- Calculate the average DTI for December 2021 (MTD).

SELECT
    ROUND(AVG(dti), 4) * 100 AS MTD_Avg_DTI
FROM bank_loan_data
WHERE YEAR(issue_date) = 2021
  AND MONTH(issue_date) = 12;


-- Calculate the average DTI for November 2021 (PMTD).

SELECT
    ROUND(AVG(dti), 4) * 100 AS PMTD_Avg_DTI
FROM bank_loan_data
WHERE YEAR(issue_date) = 2021
  AND MONTH(issue_date) = 11;


-- ============================================================
-- 7. LOAN STATUS ANALYSIS
-- ============================================================

-- Examine the distribution of loan applications by loan status.
-- This identifies the number of loans in each repayment category.

SELECT
    loan_status,
    COUNT(*) AS Total_Applications
FROM bank_loan_data
GROUP BY loan_status;


-- ============================================================
-- 8. GOOD LOAN ANALYSIS
-- ============================================================

-- Good Loans:
-- Loans classified as Fully Paid or Current.
-- These represent loans that have been fully repaid
-- or are still being repaid according to their status.


-- Calculate the percentage of good loans.
-- CASE WHEN assigns 1 to good loans and 0 to other loans.
-- AVG calculates the proportion of good loans.

SELECT
    AVG(
        CASE
            WHEN loan_status IN ('Current', 'Fully Paid')
            THEN 1.0
            ELSE 0.0
        END
    ) * 100 AS Good_Loan_Percentage
FROM bank_loan_data;


-- Alternative approach using SUM and COUNT.
-- Calculates the percentage of good loan applications
-- and rounds the result to two decimal places.

SELECT
    CAST(
        SUM(
            CASE
                WHEN loan_status IN ('Fully Paid', 'Current')
                THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*) AS DECIMAL(10,2)
    ) AS Good_Loan_Percentage
FROM bank_loan_data;


-- Calculate the total number of good loan applications.

SELECT
    COUNT(*) AS Good_Loan_Application
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');


-- Calculate the total amount funded toward good loans.

SELECT
    SUM(loan_amount) AS Good_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');


-- Calculate the total repayments received from good loans.

SELECT
    SUM(total_payment) AS Good_Loan_Received_Amount
FROM bank_loan_data
WHERE loan_status IN ('Fully Paid', 'Current');


-- ============================================================
-- 9. BAD LOAN ANALYSIS
-- ============================================================

-- Bad Loans:
-- Loans classified as Charged Off.
-- These represent loans that have been written off
-- due to unsuccessful repayment.


-- Calculate the percentage of bad loans across all applications.

SELECT
    AVG(
        CASE
            WHEN loan_status = 'Charged Off'
            THEN 1.0
            ELSE 0.0
        END
    ) * 100 AS Bad_Loan_Percentage
FROM bank_loan_data;


-- Calculate the total number of charged-off loan applications.

SELECT
    COUNT(*) AS Bad_Loan_Application
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- Calculate the total amount funded toward charged-off loans.

SELECT
    SUM(loan_amount) AS Bad_Loan_Funded_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- Calculate the total repayments received from charged-off loans.

SELECT
    SUM(total_payment) AS Bad_Loan_Received_Amount
FROM bank_loan_data
WHERE loan_status = 'Charged Off';


-- ============================================================
-- 10. LOAN STATUS SUMMARY
-- ============================================================

-- Consolidate key financial metrics by loan status.
-- This allows comparison of applications, funded amounts,
-- repayments, interest rates, and DTI across loan categories.

SELECT
    loan_status,
    COUNT(id) AS Total_Loan_Application,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank_loan_data
GROUP BY loan_status;


-- MTD Loan Status Analysis:
-- Evaluate loan performance by status for December 2021.

SELECT
    loan_status,
    COUNT(id) AS Total_Loan_Application,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM bank_loan_data
WHERE MONTH(issue_date) = 12
  AND YEAR(issue_date) = 2021
GROUP BY loan_status;


-- ============================================================
-- 11. MONTHLY LOAN ANALYSIS
-- ============================================================

-- Analyze loan applications, funded amounts, and repayments
-- by month to identify trends in lending activities.
-- DATENAME returns the month name for reporting purposes.

SELECT
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY
    MONTH(issue_date),
    DATENAME(MONTH, issue_date)
ORDER BY
    MONTH(issue_date);


-- ============================================================
-- 12. REGIONAL ANALYSIS BY STATE
-- ============================================================

-- Analyze loan applications, funded amounts, and repayments
-- across different states.
-- Results are sorted by funded amount in descending order
-- to identify states with the highest lending activity.

SELECT
    address_state,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY address_state
ORDER BY SUM(loan_amount) DESC;


-- ============================================================
-- 13. LOAN TERM ANALYSIS
-- ============================================================

-- Analyze lending activity based on loan repayment terms.
-- Compare the number of applications, funded amounts,
-- and repayments across different loan durations.

SELECT
    term,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY term
ORDER BY SUM(loan_amount) DESC;


-- ============================================================
-- 14. EMPLOYEE LENGTH ANALYSIS
-- ============================================================

-- Examine loan applications based on borrowers' employment length.
-- Compare application volume, funded amounts, and repayments
-- across different employment experience categories.

SELECT
    emp_length,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY emp_length
ORDER BY emp_length;


-- ============================================================
-- 15. LOAN PURPOSE ANALYSIS
-- ============================================================

-- Analyze why borrowers are applying for loans.
-- Compare the number of applications, funded amounts,
-- and repayments across different loan purposes.
-- Results are ordered by application volume.

SELECT
    purpose,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY purpose
ORDER BY Total_Loan_Applications;


-- ============================================================
-- 16. HOMEOWNERSHIP ANALYSIS
-- ============================================================

-- Analyze loan applications by borrowers' homeownership status.
-- Compare application volume, funded amounts, and repayments
-- across different homeownership categories.

SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
GROUP BY home_ownership
ORDER BY Total_Loan_Applications;


-- ============================================================
-- 17. COMBINED SEGMENT ANALYSIS
-- ============================================================

-- Analyze homeownership categories for Grade A loans
-- issued to borrowers in California (CA).
-- This filters the dataset by loan grade and state
-- before comparing applications, funded amounts,
-- and repayments by homeownership.

SELECT
    home_ownership,
    COUNT(id) AS Total_Loan_Applications,
    SUM(loan_amount) AS Total_Funded_Amount,
    SUM(total_payment) AS Total_Received_Amount
FROM bank_loan_data
WHERE grade = 'A'
  AND address_state = 'CA'
GROUP BY home_ownership
ORDER BY Total_Loan_Applications;


-- ============================================================
-- END OF BANK LOAN ANALYSIS
-- ============================================================
