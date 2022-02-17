-- # 1
select * from AdventureWorks.Person.Address
join AdventureWorks.Person.BusinessEntityAddress
on Address.AddressID = BusinessEntityAddress.AddressID
join AdventureWorks.Sales.SalesPerson
on BusinessEntityAddress.BusinessEntityID = SalesPerson.BusinessEntityID
where BusinessEntityAddress.BusinessEntityID = 281

-- # 2
select OrderQty from AdventureWorks.Sales.SalesOrderDetail

-- # 3
select * from AdventureWorks.Person.Address where AddressLine2 is not null
-- Assuming if they have a second address line, they are in an appartment
Select COUNT(*) from AdventureWorks.Person.Address where AddressLine2 is not null

-- # 4
select PostalCode from AdventureWorks.Person.Address
join AdventureWorks.Person.BusinessEntityAddress
on Address.AddressID = BusinessEntityAddress.AddressID
join AdventureWorks.Person.Person
on BusinessEntityAddress.BusinessEntityID = Person.BusinessEntityID
where Person.BusinessEntityID = 281

-- # 5
select SalesOrderDetail.[SalesOrderID], SUM (OrderQTY) AS "Total Order Quantity" from AdventureWorks.Sales.SalesOrderDetail
join AdventureWorks.Sales.SalesOrderHeader
on SalesOrderDetail.SalesOrderID = SalesOrderHeader.SalesOrderID
join AdventureWorks.Sales.Customer
on SalesOrderHeader.CustomerID = Customer.CustomerID
where Customer.CustomerID = 29825
GROUP BY SalesOrderDetail.SalesOrderID 


-- # 6 
select DISTINCT Top 50 SUM (SalesOrderHeader.[SubTotal]) as "Total Customer Sales", SalesOrderHeader.[CustomerID] from AdventureWorks.Sales.SalesOrderHeader
GROUP BY SalesOrderHeader.CustomerID
ORDER BY "Total Customer Sales" DESC





-- # 7 
select top 50  * from AdventureWorks.Sales.SalesPerson
ORDER BY SalesLastYear DESC

-- # 8 

SELECT TOP 30 * , CONCAT(Address.[AddressLine1], Address.[AddressLine2], Address.[City], Address.[StateProvinceID]) as "Full Address", EmailAddress.[EmailAddress], Password.[PasswordHash] from AdventureWorks.Person.Person 
join AdventureWorks.Person.BusinessEntityAddress
on Person.BusinessEntityID = BusinessEntityAddress.BusinessEntityID
join AdventureWorks.Person.Address
on BusinessEntityAddress.AddressID = Address.AddressID
inner join AdventureWorks.Person.EmailAddress
on Person.BusinessEntityID = EmailAddress.BusinessEntityID
join AdventureWorks.Person.Password
on Person.BusinessEntityID = EmailAddress.BusinessEntityID

