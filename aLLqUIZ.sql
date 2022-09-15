--Exercise 1:

--Select the first 3,000 rows from the Person.Person table. 
--Display only the Title, LastName, and FirstName columns, in that order.

SELECT TOP(3000)
A.Title,A.LastName,A.FirstName
FROM AdventureWorks2019.Person.Person A
--Exercise 2:

--Select the first 500 rows from the Sales.SalesOrderHeader table.
--Display only the OrderDate, DueDate, ShipDate, and TotalDue columns, in that order.
SELECT TOP (500)
A.OrderDate,A.DueDate,A.ShipDate,A.TotalDue
FROM AdventureWorks2019.Sales.SalesOrderHeader A

--Exercise 3:

--Select the first 100 rows from the Sales.SalesPerson table.
--Display only the SalesLastYear and SalesYTD columns, in that order.

SELECT TOP(100)
A.SalesLastYear,A.SalesYTD
FROM AdventureWorks2019.Sales.SalesPerson A


--Exercise 2:
/*
Write a query that outputs the “Name” and “ListPrice” fields from the “Production.Product” table. 
These column names in the query output should read “Product Name” and “List Price $$”, respectively.
*/
SELECT 
[Product Name] = a.Name,
[List Price $$]=a.ListPrice
FROM AdventureWorks2019.Production.Product A

--Exercise 3:
/*
Write a query that outputs the “PurchaseOrderID”, “OrderQty”, and “LineTotal” fields 
from the “Purchasing.PurchaseOrderDetail” table. 
“PurchaseOrderID” should be renamed to “OrderID”, and “OrderQty” to “OrderQuantity”. 
“LineTotal” can remain unchanged.
*/


--Exercise 1
/*
Write a query that selects your first name and age.
Name the columns “First Name”, and “Age”, respectively.
*/
select 
[First Name]='tareq',
[age]= 21
--Exercise 2:
/*
Write a query that outputs:
•	All columns from the Sales.SalesOrderHeader table EXCEPT “rowguid” and “ModifiedDate”.
•	A column called “Query Run By” that outputs your first name. 
    This should be the first column in the query output.
The query should only output the top 5000 rows from the table.
*/


--Exercise 1:
/*
Select any rows from the “Person.Person” table where the value in the “FirstName” column is “Pilar”.
Include all columns EXCEPT “BusinessEntityID”, “rowguid”, AND “ModifiedDate” in your output.
*/
select 
a.FirstName,a.LastName,a.BusinessEntityID
from AdventureWorks2019.person.Person a
where a.FirstName='Pilar'

--Exercise 2:
/*
Select any rows from the “Purchasing.Vendor” table 
where the value in the “Name” column is “Northwind Traders”. 
Include all columns EXCEPT “BusinessEntityID” and “ModifiedDate” in your output.
*/
select 
a.AccountNumber,a.ActiveFlag,a.Name,a.ModifiedDate
from	AdventureWorks2019.Purchasing.Vendor a
where a.Name='Northwind Traders'


--Exercise 3:
/*
Modify your query from Exercise 2 by commenting out the WHERE statement,
and then adding a new criterion that filters for preferred vendors only – 
that is to say, where the value in the “PreferredVendorStatus” column is 1.
*/
select 
a.AccountNumber,a.ActiveFlag,a.Name,a.ModifiedDate,a.PreferredVendorStatus
from	AdventureWorks2019.Purchasing.Vendor a
where a.Name='Northwind Traders' and a.PreferredVendorStatus=1


/*
Exercise 1:
Select any records from the “Person.Person” where the person type is not equal to “IN”.
Do not include the “BusinessEntityID” and “rowguid” fields in your output.
*/

select 
a.FirstName,a.LastName,a.BusinessEntityID,a.PersonType
from AdventureWorks2019.person.Person a
where a.PersonType !='IN'
/*
Exercise 2:
Select all people from the “Person.Person” who have a “Title”.
Do not include the “BusinessEntityID” and “rowguid” fields in your output.
*/

select 
a.FirstName,a.LastName,a.BusinessEntityID,a.PersonType,a.Title
from AdventureWorks2019.person.Person a
where a.Title  is not null
/*
Exercise 3:
Select all people from the “Person.Person” who do NOT have a middle name listed.
Do not include the “BusinessEntityID” and “rowguid” fields in your output.
*/
select 
a.FirstName,a.LastName,a.BusinessEntityID,a.PersonType,a.MiddleName
from AdventureWorks2019.person.Person a
where a.MiddleName is null

/*
BONUS:
Select all people from the “Person.Person” who do NOT have a title of “Mr.”. 
Make sure to include NULL values in your result.
*/
select 
a.FirstName,a.LastName,a.BusinessEntityID,a.PersonType,a.Title
from AdventureWorks2019.person.Person a
where a.Title not like '%Mr.%'
/*
Exercise 1:

Select all people from the “Person.Person” table with a first name of “Laura” 
and a last name of “Norman”. Include only the following columns in your output:

•	PersonType
•	Title
•	FirstName
•	LastName

*/
select 
a.FirstName,a.LastName,a.BusinessEntityID,a.PersonType,a.Title
from AdventureWorks2019.person.Person a
where a.FirstName='Laura' and a.LastName='Norman'
/*
Exercise 2:

Modify your query from Exercise 1 as follows:

Change your criteria to only look for records where the person type is either “SP” OR “EM”.
*/
select 
a.FirstName,a.LastName,a.BusinessEntityID,a.PersonType,a.Title
from AdventureWorks2019.person.Person a
where a.PersonType in('SP','EM')

/*
Exercise 1:

Select all rows from the "HumanResources.Employee" table where gender = "F", 
AND the job title is either "Network Manager" or "Application Specialist". 
Select all columns using the "SELECT *" shortcut.
*/
select
*
from AdventureWorks2019.HumanResources.Employee a
where a.Gender='F'and (a.JobTitle='Network Manager' or a.JobTitle='Application Specialist')

/*
Exercise 2:

Streamline your query from Exercise 1 by using an IN statement to replace the OR. 
Try running the modified query without parentheses to see if it still works.
*/
select
*
from AdventureWorks2019.HumanResources.Employee a
where a.Gender='F'and (a.JobTitle in('Network Manager' ,'Application Specialist'))
/*
Exercise 3:

Select all rows from the "Person.Person" table where person type = "EM", 
AND there is a NULL value in either the "Title" or "MiddleName" fields. 
Include the following fields in your query:
 - PersonType (aliased as "Person Type")
 - Title
 - FirstName (aliased as "First Name")
 - MiddleName (aliased as "Middle Name")
 - LastName (aliased as "Last Name")
 - Suffix
*/
select 
[Person typye]= a.PersonType,
a.Title,
[First Name]= a.FirstName,
[Midlle Name]= a.MiddleName,
[Last Name]= a.LastName,
a.Suffix
from AdventureWorks2019.Person.Person a
where a.PersonType='EM' and (a.MiddleName is null or a.Title is null)


/*
BONUS:

Modify your query from Exercise 3 such that you are now selecting all rows 
where person type is either "EM" or "SP" AND there is a NULL value 
in either the "Title", "MiddleName", or "Suffix" fields.
*/

select 
[Person typye]= a.PersonType,
a.Title,
[First Name]= a.FirstName,
[Midlle Name]= a.MiddleName,
[Last Name]= a.LastName,
a.Suffix
from AdventureWorks2019.Person.Person a
where( a.PersonType='EM' or a.PersonType ='SP') and (a.MiddleName is null or a.Title is null or a.Suffix is null)
/*
Exercise 1:

Select all rows from the "Purchasing.PurchaseOrderHeader" table 
where the total due amount is greater than $50,000 and the freight amount is less than $1,000. 
Include the following columns in your output:

 - OrderDate
 - SubTotal
 - TaxAmt
 - Freight
 - TotalDue
*/
select a.TotalDue
from AdventureWorks2019.Purchasing.PurchaseOrderHeader a
where a.TotalDue > 50000 and a.Freight >1000

/*
Exercise 2:

Using the BETWEEN keyword, modify your query from Exercise 1 such that 
you are now pulling in all rows where the subtotal amount is between $10,000 and $30,000.
*/

select a.TotalDue
from AdventureWorks2019.Purchasing.PurchaseOrderHeader a
where a.SubTotal between 10000 and 30000 
/*
Exercise 3:

Modify your query from Exercise 2 such that you are NOT including $10,000 and $30,000 
in your range of subtotals, but still including all amounts between these numbers. 
In other words, the range should no longer be "inclusive".
*/
select a.TotalDue
from AdventureWorks2019.Purchasing.PurchaseOrderHeader a
where a.SubTotal> 10000 and a.SubTotal< 30000 

/*
Exercise 1:

Select all rows from the Person.Person table where 
the first name is abbreviated with a period/dot at the end - for example, "A.".

Select all columns via the "SELECT *" shortcut.
*/

select * 
from AdventureWorks2019.Person.Person a
where a.FirstName like '%.'
/*
Exercise 2:

Select all people from the Person.Person table with the initials "TLC". 
HINT - you'll have to apply criteria to the FirstName, MiddleName, AND LastName columns. 

You may select all columns via the "SELECT *" shortcut.
*/
select * 
from AdventureWorks2019.Person.Person a
where a.FirstName like 'T%' and a.MiddleName like 'L%'

/*
Exercise 3:

Select all rows from the Person.Person table where the first name 
does NOT include a vowel (a, e, i, o, or u). 
HINT - you do NOT need to use OR to accomplish this; try using a wildcard with brackets ([ ]) instead.

You may select all columns via the "SELECT *" shortcut.
*/
select * 
from AdventureWorks2019.Person.Person a
where a.FirstName not like '%[a,e,i,u,o]%'

/*
Exercise 1:

Select all rows and the following columns from the HumanResources.Employee table:

 - OrganizationLevel (alias as "Organization Level")
 - JobTitle (alias as "Job Title")
 - VacationHours (alias as "Vacation Hours")
 - SickLeaveHours (alias as "Sick Leave Hours")

Sort your output first by OrganizationLevel in ascending order, 
then VacationHours in descending order.
*/

select * from AdventureWorks2019.HumanResources.Employee a
order by a.OrganizationLevel asc,a.VacationHours desc

/*
Exercise 2:

Modify your query from Exercise 1 to use your column aliases, 
rather than the actual column names in the database table, in the ORDER BY.
*/

/*
Exercise 3:

Modify your query from Exercise to use the position of the columns in the query output 
(for example, 1 for the first column) in the ORDER BY as opposed to the column aliases.
*/
SELECT
       [Organization Level] = [OrganizationLevel]
      ,[Job Title] = [JobTitle]
      ,[Vacation Hours] = [VacationHours]
      ,[Sick Leave Hours] = [SickLeaveHours]

FROM [AdventureWorks2019].[HumanResources].[Employee]
order by 1,3 desc
/*
Exercise 1:

Produce a list of the unique person types in the "Person.Person" table, sorted in ascending order.
*/
select DISTINCT a.PersonType
from AdventureWorks2019.Person.Person a
order by a.PersonType asc

/*
Exercise 2:

Produce a list of the unique full names in the "Person.Person" table - 
including first name, middle name, and last name. 
Only include names that have a value for middle name.

The output should be sorted by last name and then by first name, in ascending order.
*/

select DISTINCT [Full Name] = a.FirstName+ ' '+ a.MiddleName + ' ' + a.LastName
from AdventureWorks2019.Person.Person a
where a.MiddleName is not null
order by 1
/*
Exercise 1:

Select a derived column from the "Person.Person" table - aliased as "Person Title" - 
that consists of the person's first name, followed by a space, followed by their last name, 
followed by a hyphen (-), followed by the person type.
*/
select [Person Title]= a.FirstName+ ' '+ a.LastName + '-'+a.PersonType
from AdventureWorks2019.Person.Person a


/*
Exercise 2:

Select all rows from the "HumanResources.Employee" table where "SalariedFlag" = 0. 
Include the following columns in your output:

 - BusinessEntityID
 - VacationHours
 - SickLeaveHours
 - Total Time Off - This is a derived column you will calculate by adding vacation hours and sick leave hours
*/
select a.BusinessEntityID,a.VacationHours,a.SickLeaveHours,
[Total time off]= a.VacationHours+a.SickLeaveHours
from AdventureWorks2019.HumanResources.Employee a
where a.SalariedFlag =0

/*
Exercise 3:

Select all rows from the "HumanResources.EmployeePayHistory" table where "SalariedFlag" = 0. 
Include the following columns in your output:

 - BusinessEntityID
 - Rate
 - Weekly Pay - This is a derived column you will calculate using the employee pay rate from the "Rate" column, and assuming a 40 hour work week.
*/

/*
Bonus:

Modify your query from Exercise 2 by adding a new derived column called "Total Days Off". 
This column should build on our math for "Total Time Off" by factoring in an assumed 8 hour workday. 
HINT - remember how to keep SQL from performing "integer division" by dividing by a decimal!
*/

/*
Exercise 1:

Select the following columns (all rows) from the "Sales.CreditCard" table:

 - CardNumber
 - Last Four Digits - a derived column with just the last four digits of the credit card number
*/
select a.CardNumber,
[last 4] = RIGHT(a.CardNumber,4)
from AdventureWorks2019.Sales.CreditCard a


/*
Exercise 2:

Select the following columns (all rows) from the "Production.ProductReview" table:

 - ReviewerName
 - Comments
 - Cleaned Comments - a derived column in which all commas from the "Comments" field have been replaced with empty strings
*/
select 
a.ReviewerName,a.Comments,
[cleaned comm]=REPLACE(a.Comments,',','')

from AdventureWorks2019.Production.ProductReview a

/*
Exercise 3:

Select the "FirstName" and "LastName" columns from the "Person.Person" table. 
Only include rows where the length of the last name is greater than or equal to 10 characters.
*/
select a.FirstName,a.LastName
from AdventureWorks2019.Person.Person a
where LEN(a.LastName)>=10
/*
Bonus:

Sort the output of Exercise 3 by the length of the last name in descending order. 
HINT - you can re-use the expression in your WHERE clause in your ORDER BY, even though it isn't included in the SELECT list!
*/

/*
Exercise 1

Select the following (not tied to any table in our AdventureWorks database):

 - A field called "Today" showing the current day and time
 - A field called "This Month", showing the number of the current month
 - A field called "This Year", showing the number of the current year.

All fields above should be calculated via SQL functions.
*/

/*
Exercise 2

Select all records from the "Purchasing.PurchaseOrderHeader" table where 
the order date occurred between 1/1/2011 and 7/31/2011 AND 
the total amount due is greater than $10,000. 
Include the following columns:

 - PurchaseOrderID
 - OrderDate
 - TotalDue
*/

select a.PurchaseOrderID,a.OrderDate,a.TotalDue
from AdventureWorks2019.Purchasing.PurchaseOrderHeader a
where a.OrderDate between DATEFROMPARTS(2011,1,1) and DATEFROMPARTS(2011,7,31) 
and a.TotalDue >10000
/*
Exercise 1:

Use date math in conjunction with GETDATE to calculate what date is 100 days from now.
*/
select GETDATE() +100
/*
Exercise 2:

Use DATEADD to calculate what date is 6 months from now.
*/
select DATEADD(month,6,getdate())
/*
Exercise 3:

Use DATEDIFF to select all rows from the "Sales.SalesOrderHeader" table 
where the order date is 7 or less days before 12/25/2013. 
Note that it is possible for DATEDIFF to output a negative number 
if the "end" date is prior to your "start" date, 
so you may want to use BETWEEN instead of <= in your criteria.

You may select all columns via the SELECT * shorthand.
*/
select * from AdventureWorks2019.Sales.SalesOrderHeader a
where DATEDIFF(day,a.OrderDate,datefromparts(2013,12,25) )between 0 and 7

/*
Bonus:

Modify your query from Exercise 3 to work for ANY year, not just 2013. 
HINT - instead of hardcoding the year in your DATEFROMPARTS function, 
you will probably want to calculate the year based on the order date.
*/
select * from AdventureWorks2019.Sales.SalesOrderHeader a
where DATEDIFF(day,a.OrderDate,datefromparts(YEAR(a.OrderDate),12,25)) between 0 and 7

/*
Exercise 1:

Calculate yesterday's date dynamically via GETDATE. 
Convert the value to a DATE datatype, such that it has no timestamp component.
*/
select cast (GETDATE()-1 as date)



/*
Exercise 2:

Calculate the number of days between the current date and the end of the current year via DATEDIFF. 
Use the CAST function to create the end-of-year date.
*/
select DATEDIFF(day,cast(GETDATE() as date),DATEFROMPARTS(2022,12,31))


/*
Exercise 3

Select all rows from the "Person.Person" table where the middle name is not NULL, AND either the title is not NULL OR the suffix is not NULL. Include the following columns:

 - Title
 - FirstName
 - MiddleName
 - LastName
 - Suffix
 - PersonID: a derived column created by combining the person type, a hyphen(-), 
	and the business entity ID, in that order.

HINT - you will need to convert the business entity ID to a VARCHAR 
in order for the concatenation to work. You do not necessarily need to specify the length - 
simply specifying VARCHAR (as opposed to, say, VARCHAR(100)) will work fine.
*/
select 
a.Title,a.MiddleName,a.FirstName,a.LastName,a.Suffix ,
[Person Type]= a.PersonType+'-'+ cast(a.BusinessEntityID as varchar(100))
from AdventureWorks2019.Person.Person a
where a.MiddleName is not null and (a.Title is not null or a.Suffix is not null)



/*
Exercise 1:

Select all rows from the "Production.Product" table where the weight is less than 10 pounds. 
Make sure to include NULL values in your output, and use ISNULL to accomplish this.

Include the following columns in your output:

 - Name
 - Color
*/
select a.Weight,a.Name,a.Color
from AdventureWorks2019.Production.Product a
where isnull(a.Weight,0)<10

/*
Exercise 2:

Modify the "Color" field of your query from Exercise 1 such that 
NULL values are replaced with the word "None".
*/
select a.Weight,a.Name,
isnull(a.Color,'none')
from AdventureWorks2019.Production.Product a
where isnull(a.Weight,0)<10
/*
Exercise 1:

Select a derived column called "Price Category" from the "Production.Product" table such that:

If the list price is greater than $1,000, return "Premium".
If the list price is greater than $100 and less than $1,000, return "Mid-Range".
If the list price is less than $100, return "Value". This should be the default case.

Also include Name and ListPrice as columns in your output.
*/

/*
Exercise 2:

Select a derived column called "Employee Tenure" from the "HumanResources.Employee" table such that:

1.) If an employee is salaried, and has been with the company 10 or more years (calculated as the DATEDIFF in YEARs between the "HireDate" value and the current date), return "Non-Exempt - 10+ Years".
2.) If an employee is salaried, and has been with the company less than 10 years, return "Non-Exempt - < 10 Years".
3.) If an employee is NOT salaried, and has been with the company 10 or more years (calculated as the DATEDIFF in YEARs between the "HireDate" value and the current date), return "Exempt - 10+ Years".
4.) If an employee is NOT salaried, and has been with the company less than 10 years, return "Exempt - < 10 Years". This should be the default case.

Also include BusinessEntityID, HireDate, and SalariedFlag as columns in your output.
*/

select * from AdventureWorks2019.Sales.SalesPerson a
inner join AdventureWorks2019.Person.Person b
on a.BusinessEntityID=b.BusinessEntityID
inner join AdventureWorks2019.Sales.SalesTerritory c
on a.TerritoryID=c.TerritoryID
where c.[Group]='Europe'

/*
Exercise 1:

Write a query that combines the "FirstName" and "LastName" columns from the "Person.Person" table, 
with the "EmailAddress" column from the "Person.EmailAddress" table, 
AND the "PhoneNumber" field from the "Person.PersonPhone" table.

HINT - these tables all have the "BusinessEntityID" field in common.
*/

SELECT 
       A.[FirstName]
      ,A.[LastName]
	  ,B.[EmailAddress]
	  ,C.[PhoneNumber]
FROM [AdventureWorks2019].[Person].[Person] A
JOIN [AdventureWorks2019].[Person].[EmailAddress] B
	ON A.BusinessEntityID = B.BusinessEntityID
JOIN [AdventureWorks2019].[Person].[PersonPhone] C
	ON A.[BusinessEntityID] = C.[BusinessEntityID]


/*
Exercise 2

Modify your query from Exercise 1 such that you now only pull in phone numbers 
with a Seattle area code - that is to say, phone numbers that start with "206". 

HINT - PhoneNumber is a text field, so you will need a text function to accomplish this. 
Either LEFT or a wildcard used in conjunction with LIKE should work.
*/

SELECT 
       A.[FirstName]
      ,A.[LastName]
	  ,B.[EmailAddress]
	  ,C.[PhoneNumber]
FROM [AdventureWorks2019].[Person].[Person] A
JOIN [AdventureWorks2019].[Person].[EmailAddress] B
	ON A.BusinessEntityID = B.BusinessEntityID
JOIN [AdventureWorks2019].[Person].[PersonPhone] C
	ON A.[BusinessEntityID] = C.[BusinessEntityID]

WHERE LEFT(C.[PhoneNumber], 3) = '206'


/*
Exercise 3:

Modify your query from Exercise 2 to pull in each person's city from the "Person.Address" table. 

Note that this table has no fields in common with any of the tables already in our join. 
This means we will need to join in another table that we can use as a "bridge" 
between our Person.Address table and our Person.Person table - 
a table that should have fields we can use to connect it to either table.

The table we need is "Person.BusinessEntityAddress"; 
note that it has both "BusinessEntityID" AND "AddressID" fields. 
You will need to join this table to Person.Person, and then join Person.Address to this table 
in order to get your query to work.
*/

SELECT 
       A.[FirstName]
      ,A.[LastName]
	  ,B.[EmailAddress]
	  ,C.[PhoneNumber]
	  ,E.[City]

FROM [AdventureWorks2019].[Person].[Person] A
JOIN [AdventureWorks2019].[Person].[EmailAddress] B
	ON A.BusinessEntityID = B.BusinessEntityID
JOIN [AdventureWorks2019].[Person].[PersonPhone] C
	ON A.[BusinessEntityID] = C.[BusinessEntityID]
JOIN [AdventureWorks2019].[Person].[BusinessEntityAddress] D
	ON A.[BusinessEntityID] = D.[BusinessEntityID]
JOIN [AdventureWorks2019].[Person].[Address] E
	ON D.[AddressID] = E.[AddressID]

WHERE LEFT(C.[PhoneNumber], 3) = '206'