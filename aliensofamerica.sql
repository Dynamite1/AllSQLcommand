/* In this project, I am going to use all my SQL Knowledge. For this SQL data Cleaning Project I am using data set given BY Ian K. 
It has 3 table such as Aliens,Location and Details*/
--1.TOP, The SELECT TOP clause is used to specify the number of records to return.
SELECT TOP (5) [id]
      ,[first_name]
      ,[last_name]
      ,[email]
      ,[gender]
      ,[type]
      ,[birth_year]
  FROM [test].[dbo].[Aliens$]  ORDER BY id
--2.WHERE CLAUSE.The WHERE clause is used to filter records. Below I try to find only male aliens
SELECT [id]
      ,[first_name],[last_name] ,[email],[gender],[type],[birth_year]
  FROM [test].[dbo].[Aliens$]  
  WHERE gender= 'Male'
-- NOT EQUAL(!=). Below query to use not equal to find other gender
 SELECT distinct [gender] 
  FROM [test].[dbo].[Aliens$]  
  WHERE gender != 'Male'
/*4.BETWEEN The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
--The BETWEEN operator is inclusive: begin and end values are included. */
SELECT [id]
      ,[first_name],[last_name] ,[email],[gender],[type],[birth_year]
  FROM [test].[dbo].[Aliens$]  
  WHERE birth_year between 1900 and 2000

--5.The CONCAT() function adds two or more strings together.
SELECT [first_name],[last_name] ,CONCAT(first_name,' ',last_name) as FullName
  FROM [test].[dbo].[Aliens$]  

--COUNT. To count how many ALIENS in this dataset.
SELECT count(id) as Total_Aliens
  FROM [test].[dbo].[Aliens$]  
--7.ORDER BY. Below query to order by Birth year
SELECT [id]
      ,[first_name],[last_name] ,[email],[gender],[type],[birth_year]
  FROM [test].[dbo].[Aliens$]  
  ORDER BY birth_year
-- 8.Group By . below query to group by genders
SELECT [gender], COUNT(gender) as Number
  FROM [test].[dbo].[Aliens$]  
  GROUP BY gender
  ORDER BY Number DESC

--9. HAVING Below query used HAVING clause to find the duplicate email address
SELECT count(email)
  FROM [test].[dbo].[Aliens$]  
  GROUP BY email
  HAVING count(email)>1
  
-- 10.LIKE Operator used in below query to find last name start with A
SELECT [last_name] 
  FROM [test].[dbo].[Aliens$]  
  WHERE last_name  LIKE 'A%'

--11.YEAR() Function used below query to calculate the age of alien. 
SELECT [birth_year], [Age]=YEAR(getdate())-birth_year
  FROM [test].[dbo].[Aliens$]  

--12.MAX() Function used below query to find the last alien birth year. 
SELECT MAX(birth_year) as Last_Alien_birth_year
  FROM [test].[dbo].[Aliens$]  

--13.MIN() Function used below query to find the last alien birth year. 
SELECT MIN(birth_year) as First_Alien_birth_year
  FROM [test].[dbo].[Aliens$] 
 
 --14.VIEW() statement to create virtual table calculate age 
CREATE VIEW [Age] as
SELECT [id] ,[first_name],[last_name] ,[email],[gender],[type],[birth_year],[Age]=YEAR(getdate())-birth_year
  FROM [test].[dbo].[Aliens$] 
  
SELECT * FROM Age

--15.AVG() funtion use to find the agerage age of aliens
SELECT avg(Age) FROM Age

--16. CASE() expression use to group by them every century
SELECT Century,COUNT(Century) as Total_Aliens 
FROM
(SELECT 
[Century]=
CASE	
	WHEN birth_year between 0 and 1699 THEN 'Before 1700'
	WHEN birth_year between 1700 and 1799 THEN '18TH century'
	WHEN birth_year between 1800 and 1899 THEN '19TH centrury'
	WHEN birth_year >= 1900  THEN '20TH centrury'
	else 'other'
end	
  FROM [test].[dbo].[Aliens$] ) as cent
 GROUP BY Century
 ORDER BY Century 
 --17. JOIN clause use to joing aliens table with details table AND FIND total aggressive aliens
 SELECT count( *) as Total_Agrresive_aliens
 FROM [test].[dbo].[Aliens$] A
  INNER JOIN [test].[dbo].[Details$] D
 ON A.id= D.detail_id
 WHERE aggressive= 1

 --18.Below query used RIGHT() function to find the domain name and total users
 SELECT *,COUNT(*) AS TOTAL_USERS from(
SELECT  RIGHT(email,CHARINDEX('@',REVERSE(email))-1) as Domain
  FROM [test].[dbo].[Aliens$]  ) as Domian
  GROUP BY Domain
  ORDER BY COUNT(*) DESC
  
--19. Replace() function use to include all gender together except male and female
SELECT [gender],REPLACE(gender,'Bigender','other')
  FROM [test].[dbo].[Aliens$] 
--What is the total amount each customer spent at the restaurant? 
SELECT [customer_id],
       Sum([price])
FROM   [test].[dannys_diner].[menu] A
       JOIN [test].[dannys_diner].[sale] B
         ON A.product_id = B.product_id
GROUP  BY customer_id

--2.How many days has each customer visited the restaurant? 
SELECT customer_id,
       Count(order_date) AS Total_Visit
FROM   [test].[dannys_diner].[sale]
GROUP  BY customer_id

--What was the first item from the menu purchased by each customer? 
SELECT r.*,
       product_name
FROM  (SELECT Row_number()
                OVER (
                  partition BY customer_id
                  ORDER BY order_date) AS First_day,
              [customer_id],
              [order_date],
              [product_id]
       FROM   [test].[dannys_diner].[sale] s) r
      INNER JOIN [test].[dannys_diner].[menu] m
              ON r.product_id = m.product_id
WHERE  first_day = 1

--What is the most purchased item on the menu and how many times was it purchased by all customers?
SELECT TOP 1 Count(*) AS Most_purcheased,
             m.product_name
FROM   [test].[dannys_diner].[sale] s
       JOIN [test].[dannys_diner].[menu] m
         ON s.product_id = m.product_id
GROUP  BY s.product_id,
          m.product_name
ORDER  BY most_purcheased DESC

--.Which item was the most popular for each customer? 
SELECT *
FROM   (SELECT r.*,
               m.product_name,
               Dense_rank()
                 OVER(
                   partition BY r.customer_id
                   ORDER BY total_purchased DESC) AS ranked
        FROM   (SELECT Count(s.product_id) AS total_purchased,
                       customer_id,
                       product_id
                FROM   [test].[dannys_diner].[sale] s
                GROUP  BY product_id,
                          customer_id) r
               JOIN [test].[dannys_diner].[menu] m
                 ON r.product_id = m.product_id) t
WHERE  ranked = 1

--which item was purchased first by the customer after they became a member? 
SELECT *
FROM   (SELECT m.customer_id              AS customer,
               me.product_name            AS product,
               Rank()
                 OVER (
                   partition BY m.customer_id
                   ORDER BY s.order_date) AS rnk
        FROM   [test].[dannys_diner].[members] AS m
               JOIN [test].[dannys_diner].[sale] AS s
                 ON m.customer_id = s.customer_id
               JOIN [test].[dannys_diner].[menu] AS me
                 ON s.product_id = me.product_id
        WHERE  s.order_date >= m.join_date) ff
WHERE  rnk = 1

--.Which item was purchased just before the customer became a member? 
SELECT *
FROM  (SELECT Rank()
                OVER (
                  partition BY s.customer_id
                  ORDER BY s.order_date DESC) AS rnk,
              me.product_name,
              s.customer_id,
              s.product_id,
              s.order_date,
              m.join_date
       FROM   [test].[dannys_diner].[members] AS m
              JOIN [test].[dannys_diner].[sale] AS s
                ON m.customer_id = s.customer_id
              JOIN [test].[dannys_diner].[menu] AS me
                ON s.product_id = me.product_id
       WHERE  s.order_date < m.join_date) ff
WHERE  rnk = 1

--what are the total items and amount spent for each member before they became a member? 
SELECT Count(s.product_id),
       Sum(me.price)
FROM   [test].[dannys_diner].[members] AS m
       JOIN [test].[dannys_diner].[sale] AS s
         ON m.customer_id = s.customer_id
       JOIN [test].[dannys_diner].[menu] AS me
         ON s.product_id = me.product_id
WHERE  s.order_date < m.join_date
GROUP  BY s.customer_id

--If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have? 
SELECT s.customer_id,
       Sum(CASE
             WHEN me.product_name = 'sushi' THEN ( me.price * 20 )
             ELSE ( me.price * 10 )
           END) AS total_point
FROM   [test].[dannys_diner].[sale] AS s
       JOIN [test].[dannys_diner].[menu] AS me
         ON s.product_id = me.product_id
GROUP  BY s.customer_id

/*In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
not just sushi - how many points do customer A and B have at the 
end of January? */
SELECT s.customer_id,
       Sum(CASE
             WHEN m.join_date > s.order_date THEN
               CASE
                 WHEN me.product_name = 'sushi' THEN ( me.price * 20 )
                 ELSE ( me.price * 10 )
               END
             WHEN s.order_date > Dateadd(day, 6, m.join_date) THEN
               CASE
                 WHEN me.product_name = 'sushi' THEN ( me.price * 20 )
                 ELSE ( me.price * 10 )
               END
             ELSE ( me.price * 20 )
           END)
FROM   [test].[dannys_diner].[members] AS m
       JOIN [test].[dannys_diner].[sale] AS s
         ON m.customer_id = s.customer_id
       JOIN [test].[dannys_diner].[menu] AS me
         ON s.product_id = me.product_id
WHERE  order_date <= '2021-01-31'
GROUP  BY s.customer_id 
