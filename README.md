**In this project, I have used most of the SQL commands. For this SQL data Cleaning Project I am using data set given BY Ian K. 
It has 3 table such as Aliens,Location and Details**

1.	TOP()
2.	SELECT
3.	FROM
4.	WHERE(a.Name='Northwind Traders')

![image](https://user-images.githubusercontent.com/16399584/189506331-35282fc8-8192-488c-b9c2-cc804587006b.png)


5.	AND ( where a.Name='Northwind Traders' and a.PreferredVendorStatus=1)
6.	!= ( not equal)(where a.PersonType !='IN')
7.	IS NOT NULL (where a.Title  is not null)
8.	IS NULL (where a.MiddleName is null)
9.	NOT LIKE (where a.Title not like '%Mr.%')//WHERE B.[Name] NOT LIKE '%[0-9]%'
10.	IN (where a.PersonType in('SP','EM'))
11.	BETWEEN  AND (where a.SubTotal between 10000 and 30000 )
12.	like (where a.FirstName like '%.')
13.	ASC (order by a.OrganizationLevel asc)
14.	DESC(order by a.VacationHours desc)
15.	ORDER BY 1,3 desc
16.	DISTINCT( )
17.	RIGHT(a.CardNumber,4)
18.	REPLACE(a.Comments,',','')
19.	LEN ()
20.	DATEFROMPARTS(2011,1,1) 
21.	DATEADD(month,6,getdate())
22.	DATEDIFF(day,a.OrderDate,datefromparts(YEAR(a.OrderDate),12,25)) between 0 and 7
23.	CAST()
24.	ISNULL 
25.	GETDATE(),[This Year] = YEAR(GETDATE()),[This Month] = MONTH(GETDATE())
26.	COUNT(*)
27.	GROUP BY 
28.	HAVING 
29.	AVG()
30.	MIN(), MAX(), SUM()
31.	 4 Joins ( inner join/join,left join,right join,full join)
32.	CASE	
33.	AS
34.	UNION
35.	UNION ALL
36.	STORE PROCEDURE
37.	VIEW
38.	CTE meaning common table expression



