-- 1. STOK GÜNCELLEME (INSERTED Tablosu ile Join)
-- Sipariş girildiğinde, yeni gelen veriyi (inserted) Products tablosuyla joinleyerek stoğu düşürür.
CREATE TRIGGER StokGuncelle
ON Orders
AFTER INSERT
AS
BEGIN
    UPDATE Products
    SET Products.StockQuantity = Products.StockQuantity - 1
    FROM Products
    INNER JOIN inserted ON Products.ProductID = inserted.ProductID;
END;

-- 2. MÜŞTERİ KAYIT LOGLAMA (INSERTED Tablosu Kullanımı)
-- Yeni eklenen müşterinin bilgilerini almak için inserted tablosu kullanılır.
CREATE TRIGGER MusteriKayitBilgi
ON Customers
AFTER INSERT
AS
BEGIN
    SELECT 'Yeni kayit yapildi: ' + inserted.Email FROM inserted;
END;

-- 3. GÜVENLİK: KATEGORİ SİLME ENGELİ (Hata Fırlatma)
-- Eğer kategoride ürün varsa silme işlemini durdurur ve hata verir.
CREATE TRIGGER KategoriSilmeKontrol
ON Categories
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Products WHERE CategoryID IN (SELECT CategoryID FROM deleted))
    BEGIN
        THROW 50001, 'Bu kategoride ürünler var, silemezsiniz!', 1;
    END
    ELSE
    BEGIN
        DELETE FROM Categories WHERE CategoryID IN (SELECT CategoryID FROM deleted);
    END
END;

-- 1. TOPLU İNDİRİM PROSEDÜRÜ
-- Belirli bir kategorideki tüm ürünlere girilen oranda indirim yapar.
UPDATE Products
BEGIN
    SET Price = Price * (1 - 0.10) -- %10 indirim örneği
    WHERE CategoryID = 1;
END;

-- 2. MÜŞTERİ HARCAMA GÜNCELLEME
-- Bir sipariş eklendiğinde siparişin toplam tutarını hesaplar.
UPDATE Orders
BEGIN
    SET TotalAmount = (SELECT SUM(Price) FROM Products WHERE ProductID = 1)
    WHERE OrderID = 1;
END;

-- 3. PASİFE ÇEKME PROSEDÜRÜ
-- Stoğu biten ürünlerin durumunu otomatik olarak 'Passive' yapar.
UPDATE Products
BEGIN
    SET Status = 'Passive'
    WHERE StockQuantity = 0;
END;