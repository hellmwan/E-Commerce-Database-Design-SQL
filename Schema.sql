-- 1. Kategoriler (Elektronik, Giyim vb.)
CREATE TABLE Categories (
    CategoryID INTEGER PRIMARY KEY AUTOINCREMENT,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);

-- 2. Ürünler (Stok ve Fiyat Kontrollü)
CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY AUTOINCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INTEGER,
    Price DECIMAL(10,2) NOT NULL CONSTRAINT ck_positive_price CHECK (Price > 0), -- Fiyat 0 olamaz
    StockQuantity INTEGER DEFAULT 0 CONSTRAINT ck_positive_stock CHECK (StockQuantity >= 0),
    Status VARCHAR(10) DEFAULT 'Active' CONSTRAINT ck_status CHECK (Status IN ('Active', 'Passive')),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- 3. Müşteriler (İsim formatlama için uygun veri yapısı)
CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY AUTOINCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 4. Siparişler
CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY AUTOINCREMENT,
    CustomerID INTEGER,
    OrderDate DATE DEFAULT CURRENT_DATE,
    TotalAmount DECIMAL(10,2) DEFAULT 0,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);