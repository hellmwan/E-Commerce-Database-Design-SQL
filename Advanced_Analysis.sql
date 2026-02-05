-- 1. Müşteri İsimlerini Düzenleme (Senin Çözdüğün Yöntem)
-- Adın baş harfi büyük kalanı küçük, Soyadın tümü büyük
SELECT
    FirstName,
    LastName,
    -- Ad formatlama
    UPPER(SUBSTR(FirstName, 1, 1)) || LOWER(SUBSTR(FirstName, 2)) AS YeniAd,
    -- Soyad formatlama
    UPPER(LastName) AS YeniSoyad,
    -- Birleşik isim formatı
    (UPPER(SUBSTR(FirstName, 1, 1)) || LOWER(SUBSTR(FirstName, 2))) || '-' || UPPER(LastName) AS MusteriKarti
FROM Customers;


-- 2. Kritik Stok Raporu
-- Stok miktarı 20'den az olan ürünleri listele
SELECT 
    ProductName, 
    StockQuantity 
FROM Products 
WHERE StockQuantity < 20;


-- 3. Müşteri Harcama Analizi (Tablo İsimleriyle JOIN)
-- Hangi müşteri ne kadar harcadı?
SELECT 
    Customers.FirstName || ' ' || Customers.LastName AS MusteriAdSoyad,
    Orders.TotalAmount AS SiparisTutari,
    Orders.OrderDate AS Tarih
FROM Customers
JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Orders.TotalAmount DESC;


-- 4. Kategori Bazlı Ürün Listeleme (Tablo İsimleriyle JOIN)
-- Ürün adı ve hangi kategoride olduğu
SELECT 
    Products.ProductName,
    Categories.CategoryName,
    Products.Price
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID;