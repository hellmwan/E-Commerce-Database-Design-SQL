INSERT INTO Categories (CategoryName) VALUES ('Elektronik'), ('Kitap'), ('Aksesuar');

INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('ayşe', 'DEMİR', 'ayse@email.com'),
('mUrAt', 'ak', 'murat@email.com'),
('Selin', 'Yılmaz', 'selin@email.com');

INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity) VALUES 
('Laptop', 1, 25000.00, 10),
('Klavye', 1, 1500.00, 50),
('SQL Eğitim Kitabı', 2, 350.00, 100);

INSERT INTO Orders (CustomerID, TotalAmount) VALUES (1, 26500.00), (2, 350.00);