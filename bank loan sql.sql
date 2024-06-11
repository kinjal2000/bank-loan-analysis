create database Bank_loan;
use Bank_loan;
select * from finance_1;
select * from  finance_2;

##### KPI 1 (YEAR WISE LOAN AMOUNT STATS) #####
select year(issue_d) as year_of_issue_d, sum(loan_amnt) as Total_Loan_amnt 
from finance_1
group by year_of_issue_d;


##### KPI 2 (GRADE AND SUB GRADE WISE REVOL_BAL) #####
select grade, sub_grade,sum(revol_bal) as total_revol_bal
from finance_1 f1 inner join finance_2 f2 
on(f1.id = f2.id) 
group by grade,sub_grade
order by grade,sub_grade;


##### KPI 3 (Total Payment for Verified Status Vs Total Payment for Non Verified Status) #####
select verification_status, 
concat('$',format(round(sum(total_pymnt)/1000000,2),2),"M") as Total_payment
from finance_1 f1 inner join finance_2 f2 
on(f1.id = f2.id) 
group by verification_status;


##### KPI 4 (State wise and last_credit_pull_d wise loan status) #####
select addr_state, last_credit_pull_d ,loan_status
from finance_1 f1 inner join finance_2 f2 
on(f1.id = f2.id) 
group by addr_state, last_credit_pull_d,loan_status
order by addr_state;


##### KPI 5 (Home ownership Vs last payment date stats) #####
select home_ownership, last_pymnt_d, concat('$',format(round(sum(last_pymnt_amnt)/10000,2),2),'K')as Total_payment
from finance_1 f1 inner join finance_2 f2 
on(f1.id = f2.id) 
group by  last_pymnt_d,home_ownership
order by last_pymnt_d desc;