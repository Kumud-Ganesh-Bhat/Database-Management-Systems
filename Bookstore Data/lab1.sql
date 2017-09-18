/**********************************************************
***
** File      : lab1.sql
** Author    : Kumud Bhat
** Username  : kumbhat
** Date      : 9/17/2016
***
**********************************************************/

/** Helping bookstore to maintain shopping records by database techniques **/

/** Creating 5 Tables including appropriate primary/foreign key constraints**/

/** Table 1 : Customer **/
CREATE TABLE Customer (
C_Id NUMBER, 
C_Name VARCHAR(50),
Credit_Limit NUMBER,
Income_Level CHAR,
Gender CHAR,
CHECK (Income_Level IN ('L','M','H')),
CHECK (Gender IN ('F','M')),
PRIMARY KEY (C_Id)
);

/** Table 2: WareHouse **/
CREATE TABLE WareHouse(
Warehouse_Id NUMBER,
Location VARCHAR(100),
Quantity_In_Stock NUMBER,
PRIMARY KEY (Warehouse_Id)
);

/** Table 3: Book **/
CREATE TABLE Book(
Book_Id NUMBER,
Book_name VARCHAR(100),
Warehouse_Id NUMBER,
Quantity_On_Hand NUMBER,
Warranty_Period NUMBER,
Purchase_Price NUMBER,
PRIMARY KEY (Book_Id),
FOREIGN KEY (Warehouse_Id) REFERENCES WareHouse(Warehouse_Id) ON DELETE CASCADE
);

/** Table 4: Orders **/
CREATE TABLE Orders(
Order_Id NUMBER,
Order_Date DATE,
C_Id NUMBER,
Order_Status CHAR
CHECK (Order_Status IN ('C','P')),
PRIMARY KEY (Order_Id),
FOREIGN KEY (C_Id) REFERENCES Customer(C_Id) ON DELETE CASCADE
);

/** Table 5: OrderItems **/
/** Assuming OrderItems is a weak entity and a subclass of entity Book **/
CREATE TABLE OrderItems(
Order_Id NUMBER,
Book_Id NUMBER,
Unit_Price NUMBER,
Quantity NUMBER,
PRIMARY KEY (Order_Id, Book_Id),
FOREIGN KEY (Order_Id) REFERENCES Orders (Order_Id) ON DELETE CASCADE,
FOREIGN KEY (Book_Id) REFERENCES Book (Book_Id) ON DELETE CASCADE
);

/** Inserting Values in each Tables Created **/

/* Table 1: Customer */
INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (1, 'Jone',140,'L','F');

INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (2, 'Chris',230,'M','M');

INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (3, 'Saywer',480,'H','F');

INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (4, 'Kropy',500,'H','M');

INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (5, 'Lucy',220,'M','M');

INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (6, 'Mando',100,'L','F');

INSERT INTO Customer (C_Id, C_Name,Credit_Limit,Income_Level,Gender)
VALUES (7, 'Bunny',300,'M','F'); 

/** Table 2: WareHouse **/
INSERT INTO WareHouse (Warehouse_Id, Location, Quantity_In_Stock)
VALUES (1,'Los Angles',1100);

INSERT INTO WareHouse (Warehouse_Id, Location, Quantity_In_Stock)
VALUES (2,'Chicago',800);

INSERT INTO WareHouse (Warehouse_Id, Location, Quantity_In_Stock)
VALUES (3,'New York',700); 

/** Table 3: Book **/
INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (1,'Life with dog',1,18,90,6);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (2,'Inferno',1,25,180,8);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (3,'Doctor sleep',3,9,365,10);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (4,'Disappear',2,60,30,15);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (5,'Six years',2,50,365,7);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (6,'The lowland',1,5,120,25);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (7,'Wave',3,11,60,20);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (8,'Lost world',2,20,30,15);

INSERT INTO Book (Book_Id, Book_name, Warehouse_Id, Quantity_On_Hand, Warranty_Period, Purchased_Price)
VALUES (9,'Whiskey beach',3,33,150,10); 

/** Table 4: Orders **/
INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (1,'2016-08-01',1,'P');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (2,'2016-8-27',2,'C');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (3,'2016-06-20',3,'C');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (4,'2016-08-01',4,'C');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (5,'2016-08-31',1,'P');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (6,'2016-09-01',4,'P');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (7,'2016-07-20',6,'C');

INSERT INTO Orders (Order_Id, Order_Date, C_Id, Order_Status)
VALUES (8,'2016-08-11',2,'C');

/** Table 5: OrderItems **/
INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (1,1,19,2);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (1,2,20,1);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (2,1,17,1);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (3,4,20,2);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (3,2,25,3);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (3,8,16,1);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (4,4,21,10);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (5,2,10,2);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (5,8,28,1);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (6,9,16,10);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (7,5,12,3);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (7,7,25,1);

INSERT INTO OrderItems (Order_Id,Book_Id,Unit_Price,Quantity)
VALUES (8,4,30,2);

/** Query Execution **/
/* Query 1: Count the number of male and female customers */

SELECT C.Gender, COUNT(*) 
FROM Customer C 
GROUP BY C.Gender;

       /*OR*/
       
SELECT COUNT(*) AS Total_Female_Customers 
FROM Customer C 
WHERE C.Gender = 'F';

SELECT COUNT(*) AS Total_Male_Customers 
FROM Customer C 
WHERE C.Gender = 'M';

/* Query 2: Return the name/names of Customers whose income level are Median (M); and calcualte the average credit limit of these median-income customers */

/*Returning name/names of Customers whose income level are Median (M) */
SELECT C.C_Name 
FROM Customer C 
WHERE C.Income_Level = 'M';

/*Calculating the average credit_limit of the Customers whose income level are Median (M)*/
SELECT AVG(C.Credit_Limit) 
FROM Customer C 
WHERE C.Income_Level = 'M';

/* Query 3: Check the complete orders and find the name/names of Customers who have an income level of "H" */
SELECT C.C_Name, O.Order_Status 
FROM Customer C, Orders O 
WHERE C.C_Id = O.C_Id 
AND C.Income_Level = 'H' 
AND O.Order_Status = 'C';

/*Query 4: Return the name of the Customer who has placed more orders than any other customers (Including both processing and complete orders)*/
SELECT C.C_Name
FROM Customer C,Orders O
WHERE C.C_Id = O.C_Id
AND
O.Order_Status = 'P' OR O.Order_Status = 'C'
AND O.Order_Id IN (SELECT MAX(COUNT(O1.Order_Id))
                   FROM Orders O1, Customer C1
                   WHERE O1.C_Id = C1.C_Id
                   GROUP BY O1.Order_Id
                   );
                    

/* C.C_Name
FROM Customer C
WHERE C.C_Id IN (SELECT O.C_Id 
                 FROM Orders O
                 WHERE O.Order_ID IN (SELECT OI.Order_ID
                                      FROM OrderItems OI
                                      WHERE OI.Quantity > ANY ( SELECT SUM(OI2.Quantity)AS Total_Orders_Placed
                                                                FROM Customer C2, Orders O2, OrderItems OI2
                                                                WHERE C2.C_Id = O2.C_Id
                                                                AND
                                                                O2.Order_Id = OI2.Order_Id
                                                                GROUP BY C2.C_Name))); */

/*Query 5: Return the name/names of  the customers who have ever placed an order/orders containing at least 3 items and their income level is not high */
SELECT C.C_Name
FROM Customer C, Orders O,  OrderItems OI
WHERE C.Income_Level = 'L' OR C.Income_Level = 'M'
AND
C.C_Id = O.C_Id
AND
O.Order_Id = OI.Order_Id
GROUP BY C.C_Name
HAVING SUM(OI.Quantity) >= 3;

/*Query 6: Calculate the Sale Revenue of all complete orders*/
SELECT SUM(OI.Quantity * OI.Unit_Price) As Total_Sale_Revenue
FROM Orders O,OrderItems OI
WHERE O.Order_Id= OI.Order_Id  
AND 
O.Order_Status='C';

/*Query 6: Calculate the profit for all complete orders */
SELECT (SUM(OI.Quantity * OI.Unit_Price))-(SUM(OI.Quantity * B.Purchased_Price))AS Profit
FROM Orders O,OrderItems OI,Book B 
WHERE O.Order_Id= OI.Order_Id 
AND  
O.Order_Status='C'
AND
OI.Book_Id= B.Book_Id;

/*Query 7: Return the name of the customer who has processing order valued more than half of his/her credit limit */
SELECT C.C_Name
FROM Customer C, Orders O, OrderItems OI, Book B
WHERE C.C_Id = O.C_Id
AND O.Order_Id = OI.Order_Id
AND OI.Book_Id = B.Book_Id
AND (OI.Quantity * B.Purchased_Price) > (C.Credit_Limit/2);

/*Query 8 : Return <Order_Id,Book_Name,Order_Date,Warranty_Perios> for all sold books whose warranties are already expired and quantity on hand > 10 */
SELECT O.Order_Id,B.Book_Name,O.Order_Date,B.Warranty_Period
FROM Orders O,Book B,OrderItems OI
WHERE O.Order_Id = OI.Order_Id
AND OI.Book_Id = B. Book_Id
AND O.Order_Status = 'C' /*Books are already sold*/
AND B.Quantity_On_Hand > 10
AND (TRUNC(sysdate)-TRUNC(O.Order_Date)) > B.Warranty_Period;

/*Query 9 : Return the name/names of customers who have purchased atleast 2 books in August 2016. (Including all processed and complete orders)*/
SELECT C.C_Name
FROM Customer C, Orders O, OrderItems OI
WHERE C.C_Id = O.C_Id
AND O.Order_Status = 'P' OR O.Order_Status = 'C'
AND O.Order_Date LIKE '2016-%08'
AND O.Order_Id = OI.Order_Id
AND OI.Quantity >= 2;

/*Query 10: Find the name/names of the customers who have placed atleast one order including items from atleast 2 different warehouses */
SELECT C.C_Name
FROM Customer C, Orders O, OrderItems OI, Book B
WHERE C.C_Id = O.C_Id
AND O.Order_Id = OI.Order_Id
AND OI.Book_Id = B.Book_Id
GROUP BY C.C_Name
HAVING COUNT(O.Order_Id) >= 1 AND COUNT(DISTINCT B.Warehouse_Id) >= 2;

/*Query 11: Return the total number of Male Customers who did not place any order in August 2016 */
SELECT COUNT(DISTINCT C.C_ID)
FROM Customer C, Orders O
WHERE C.Gender = 'M'
AND C.C_Id = O.C_Id
AND O.Order_Date NOT IN (SELECT O1.Order_Date
                         FROM Orders O1, Customer C2 
                         WHERE O1.C_Id = C2.C_Id 
                         AND O1.Order_Date LIKE '2016-%08'
                         );
                         
/*Query 12: Which book/books have not been ordered by high level customers yet */
SELECT B.Book_Name
FROM Book B
WHERE B.Book_Id NOT IN (SELECT B1.Book_Id
                        FROM Book B1, Customer C, Orders O, OrderItems OI
                        WHERE C.Income_Level = 'H'
                        AND C.C_Id = O.C_Id
                        AND O.Order_Id = OI.Order_Id
                        AND OI.Book_Id = B1.Book_Id);
                        
/*Query 13: Find the item that has largest selling volume for customers in different gender */

/*Query 14: Sort the order by its value and return the sorted order_id */
/*Assuming value of each order is equal to quantity in that order multiplied by unit price of that order */
Select O.Order_Id AS Sorted_OrderId
FROM Orders O, OrderItems OI
WHERE O.Order_Id = OI.Order_Id
GROUP BY O.Order_Id
ORDER BY SUM(OI.Quantity * OI.Unit_Price)
DESC;

/*Query 15: Return the name of the book which is ordered by more customers than any other book */
SELECT B.Book_Name 
FROM Book B
WHERE B.Book_Id IN (SELECT OI.Book_Id
                    FROM OrderItems OI
                    GROUP BY OI.Book_Id
                    HAVING COUNT(OI.Book_Id) = (SELECT MAX(COUNT(OI1.Book_Id))
                                                FROM OrderItems OI1
                                                GROUP BY OI1.Book_Id));
 
 /*Query 16: Calculate the average profit of each book; and find the least profitable book               