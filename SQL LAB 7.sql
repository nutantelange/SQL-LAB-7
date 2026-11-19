create database banks;

use banks;

create table customer(
CustomerID int,
FirstName varchar(50),
LastName varchar(50),
Email varchar(100),
Phone varchar(15)); 

alter table customer add column dateOfBirth date;
alter table customer modify phone varchar(20);


create table Accounts(
AccountID int,
AccountType varchar(20),
Balance decimal(10,2));


create table Transactions(
TransectionID int,
TransectionDate date, 
Amount decimal(10,2),
TransectionType varchar(20));

create table Branches(
BranchId int,
BranchName varchar(100),
BranchAddress varchar(200),
BranchPhone varchar(15));


create table Loans(
LoanID int primary key,
LoanAmount decimal(10,2),
interestRate decimal(5,2),
StartDate Date,
EndDate date);

alter table Branches add constraint primary key(BranchID);
alter table Transactions add constraint primary key (TransectionID);
alter table Accounts add constraint primary key (AccountID);
alter table customer add constraint primary key (CustomerID);


alter table accounts add column customer_id int;
alter table accounts add constraint foreign key(customer_id) references customer(CustomerID);

alter table loans add column customer_id int;
alter table loans add constraint foreign key(customer_id) references customer(CustomerID);


alter table branches add column account_id int;
alter table branches add constraint foreign key(account_id) references accounts(AccountID);

alter table transactions add column account_id int;
alter table transactions add constraint foreign key(account_id) references accounts(AccountID);

insert into customer value(101,"Rahul","Sharma","rahul.sharma@gmail.com",9999999999,19980415);
insert into customer value(102,"Priya1","Patil","priya@gmail.com",9988776655,20000820),
(103,"Amit","Patel","amit.patel@gmail.com",9876500001,19950618),
(104,"sneha","joshi","sneha.joshi@gmail.com",9876500002,19970912),
(105,"Rohan","Kulkarni","rohan.k@gmail.com",9876500003,19931125);
select * from customer;

select * from Loans;
insert into Loans value(301,500000.00,8.50,20250115,20300115,101);
insert into Loans value(302,300000.00,9.25,20250110,20280210,102),
(303,750000.00,8.75,20250320,20230320,103),
(304,250000.00,10.00,20250405,20290405,104),
(305,1000000.00,7.95,20250512,20350512,105);

insert into Accounts value(201,"savings",25000.00,101),(202,"current",40000.00,102),(203,"savings",35000.00,103),(204,"current",60000.00,104),(205,"savings",45000.00,105);

insert into Branches value(1,"Mumbai Branch","Andheri Mumbai",0221111111,default),
(2,"Pune Branch","Shivaji nagar Pune",0202222222,default),
(3,"Nashik Branch","College Road Nashik",0253222222,default),
(4,"Nagpur Branch","Sitabuldi Nagpur",0712333333,default),
(5,"Navi Mumbail Branch","VashiNavi Mumbai",0224444444,default);
select * from Branches;

insert into Transactions value(301,20250510,5000.00,"deposit",201),
(302,20250511,2500.00,"withdraw",202),
(303,20250512,10000.00,"deposit",203),
(304,20250513,3000.00,"withdraw",204),
(305,20250514,7000.00,"deposit",205);

select * from Transactions;

-- Modify the balance of AccountID 201 to 30000 
update accounts set balance= 30000 where AccountID=201;
-- 1 Retrieve only the following details from the Accounts table: AccountID, AccountType, and Balance.
select AccountID,AccountType,Balance from Accounts;

-- 2 Retrieve Customers with Savings Accounts
select * from Accounts
 where AccountType="Savings";

-- 3 Retrieve Accounts with Balance Greater Than 25000
select * from Accounts
where Balance>25000;

-- 4 Retrieve Transactions Between Specific Amounts 5000 -20000
select * from Accounts
where Balance>5000 and Balance<20000;

-- 5 Retrieve Records for Selected Customers 101,102,103,104
select * from customer
where CustomerID in (101,102,103,104);

-- 6 This displays customers whose names start with the letter R.
select * from customer
where FirstName like "R%";

-- 1 Retrieve all current account records
select * from Accounts
where AccountType="Current";

-- 2 Find accounts with balance less than 15000
select * from Accounts
where Balance<15000;

-- 3 Display transactions between 1000 and 10000
select * from Transaction
where Amount>1000 and Amount<10000;

-- 4 Retrieve customer records for CustomerID 104 and 105
select * from customer
where CustomerID in (104,105);

-- 5 Display customers whose last name starts with S
select * from customer 
where LastName like "S%";

select * from customer where LastName like "S%" ;

select * from customer where LastName like "%a" ;

select * from customer where LastName like "%e%";

select * from customer where FirstName like "A___";

select * from customer where FirstName regexp "^A";

select * from customer where FirstName regexp "t$";

select * from customer where FirstName regexp "amit|rahul";

-- Display Customer in Alphabetical Order
select * from customer 
order by FirstName asc;

-- Display Accounts with Highest Balance First
select * from Accounts
order by balance desc
limit 1;

-- Retrive unique Account Types
select distinct(AccountType) unique_account from Accounts;

-- Display Top 3 Highest Balance Accounts
select * from Accounts
order by balance desc 
limit 3;

-- Skip Initial Records While viewing Transactions
select * from Transactions
order by Amount
limit 4 offset 2;

-- display customer sorted by lastName
select * from customer
order by LastName asc;

-- retrieve top 5 transections with highest amount
select * from Transactions
order by amount
limit 5;

-- display unique transactions type
select distinct(transectiontype) from Transactions;

-- skip the frist 3 transactions records and display the next 4 records
select * from Transactions
order by amount
limit 4 offset 3;

-- Find Customers Without Phone Numbers
select * from customer where phone is null;

-- Find Customers Having Email Addresses
select * from customer where email is not null;
 
-- Find customers without email addresses
select * from customer where email is null;

-- Display all accounts where balance information is available
select * from Acounts
 where balance is not null;

-- Display customers whose first name starts with R
 select * from customer where firstName like "R%";
 
-- Search Customers Whose Email Contains “gmail"
 select * from customer where email like "%gmail%";
 
 -- Search Customers Whose Last Name Ends with “kar”
 select * from customer where lastName like "%kar";
 
 -- Find customers whose email contains yahoo
select * from customer where email like "%yahoo%";

-- Display customers whose last name starts with P
select * from customer where lastName like "p%";

-- Search customers whose phone number ends with 99
select * from customer where Phone like "%99";

 -- Display Savings Account Customers Sorted by Balance Categorize Accounts Using Balance Balance >50000 then premium account Balance >2500 then standard account
select balance, 
case 
when balance>50000 then "premium account"
when balance>2500 then "standar_account"
else "normal_account"
end
as category
from Accounts;


-- select Amount,-- High Transaction>1000 Medium Transaction>500 Low Transaction based on transaction amount. 
select amount, case 
when amount>5000 then "High Transactions"
when amount>2000 then "medium Transactions"
else "low transactions"
end 
from Transactions;

-- The finance team wants to review only Savings and Current account holders.
select * from Accounts where AccountType="Savings" or AccountType="Current";

-- The audit department wants to investigate only Deposit and Withdrawal transactions.
select * from Transactions
where TransectionType in ("Deposit","Withdraw");

-- The customer relationship team wants to review records for a specific set of customers. 101,102,105
select * from customer 
where CustomerID in(101,102,105);
 
-- 1. Display accounts belonging to Salary and Savings account types
select * from Accounts 
where AccountType in("Salary","Savings"); 

-- 2. Retrieve transactions for Payment and Deposit categories
select * from Transactions
 where TransectionType in("Payment","Deposit");

-- 3. Display customer records for CustomerID 103 and 104
select * from customer 
where CustomerID in("103","104");

-- 4. Retrieve selected account records using AccountID values
select * from Accounts 
where AccountID=201;

-- Display Customers in Ascending Order of Last Name
select * from customer
order by LastName asc ;

-- Display Accounts with Highest Balance First
select * from Accounts
order by Balance desc limit 1;

-- Display Transactions Sorted by Transaction Date
select * from Transactions
order by TransectionDate;
  
-- 1. Display customers sorted by FirstName
select * from customer
order by FirstName;

-- 2. Display accounts sorted by AccountType
select * from Accounts
order by AccountType;

-- 3. Display transactions sorted by Amount in descending order
select * from Transactions
order by Amount desc;

-- 4. Display customers sorted by DateOfBirth
select * from customer
order by DateofBirth;
 
-- Display Only Top 5 Highest Balance Accounts
select * from Accounts
order by Balance desc limit 5;

-- Display First 3 Customer Records
select * from customer
 limit 3;

-- Skip Initial Transaction Records 3 While Viewing Data record 2
select * from Transactions
 limit 2 offset 3;
 
-- 1. Display top 3 transactions with highest amount
select * from Transactions
order by Amount desc limit 3;

-- 2. Retrieve only 4 customer records
select * from customer
limit 4;

-- 3. Skip first 2 account records and display next 3 records
select * from Accounts
limit 3 offset 2;

-- 4. Display top 5 latest transactions
select * from Transactions
order by TransectionDate asc limit 5;


select TransectionType, sum(Amount) from Transactions
group by TransectionType
order by sum(Amount) desc;

select CustomerID, sum(LoanAmount) from Loan
group by CustomerID
having CustomerID=101;
-- text function 
-- len, trim,upper,lower,left, right, mid 

select length("hello")as length, upper("hello"),lower("HELLO"),left("hello",3),
right("hello",2),mid("hello",2,3);

select length("    hello"),length(trim("    hello"));

select concat("hello","","all");


-- Q1
select * from customer;

-- Q2
select upper(firstname) from customer;

-- Q3
select lower(firstname) from customer;

-- Q5
select left(firstname,3) from customer;

-- Q4
select length(firstname) from customer;

-- Q6
select concat(firstname,lastname) from customer;

-- maths
select round(7.5),round(7.4),abs(-7),ceil(8.9),floor(8.9);

-- date
select current_date(),now(),year(now()),day(now()),month(now());
select datediff("13-11-2026","01-11-2026");
-- Q1
select * from customer;

-- Q2
select current_date();

-- Q3
select now();

-- Q4
select year(dateofbirth) from customer;

-- Q5
select month(dateofbirth) from customer;

-- Q6
select datediff(current_date(),dateofbirth)from customer;

-- Q7
select dateofbirth from customer
order by dateofbirth desc
limit 1;

-- Q8
select dateofbirth from customer
order by dateofbirth
limit 1;

-- Q9 Display 'Not Available' if a phone number is NULL
select *,ifnull(phone,"not avaailable") from customer;
 
-- Q10. Compare two customer names
 select *,nullif(firstname,"rahul") from customer;
 
-- Q11. Calculate the total balance maintained across all customer accounts.
select customer_id,sum(balance) from accounts
group by customer_id;
 
-- Q12. Calculate the average balance maintained across all customer accounts to understand the typical amount held by customers.
select accountType,avg(balance) from accounts
group by accountType;
 
-- Q13. Identify the highest balance maintained in any customer account.
select max(balance) from accounts;

select Customer_id,max(balance) from accounts
group by Customer_id
order by max(balance) desc
limit 1;
 
-- Q14. Identify the lowest balance maintained in any customer account
select min(balance) from accounts;

select Customer_id,min(balance) from accounts
group by Customer_id
order by min(balance) asc
limit 1;
 
-- Q15. Determine the total number of customer accounts available in the system.
select count(*) from accounts;

select  AccountType,count(*) from accounts
group by AccountType;

-- Q16. The bank wants to calculate the total account balance for each AccountType by grouping the records based on AccountType and identify which account type is attracting the highest total deposits from customers.
 select AccountType,sum(balance) from accounts
group by AccountType
order by sum(Balance) desc
limit 1;
 
-- Q17. The bank management wants to identify only those account types whose total customer deposits exceed ₹25,000.
select AccountType,sum(balance) from accounts
group by AccountType
having sum(balance)>=25000;

select * from loans;

select loanID,loanAmount,rank() over(order by loanAmount desc) as LoanRank 
from loans;

select loanID,loanAmount,dense_rank() over(order by loanAmount desc) as DenseRank 
from loans;

select loanID,loanAmount, customer_id , row_number() over(partition by customer_id order by loanAmount desc) as RowNumber 
from loans;

select loanID,loanAmount,sum(loanAmount) over(order by loanAmount desc) as RunningTotal
from loans;

select loanID,loanAmount, customer_id , lag(loanAmount) over(order by loanAmount desc) as previousloanAmount
from loans;

select loanID,loanAmount, customer_id , lead(loanAmount) over(order by loanAmount desc) as NextloanAmount
from loans;




