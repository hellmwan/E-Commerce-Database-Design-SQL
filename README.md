# 🛒 E-Commerce Database Management System

Bu proje, modern bir e-ticaret platformunun veritabanı mimarisini, veri tutarlılığı kurallarını ve analitik raporlama süreçlerini modellemektedir. Bir Bilgisayar Mühendisliği öğrencisi olarak, veritabanı yönetim sistemlerindeki (DBMS) yetkinliklerimi sergilemek amacıyla hazırlanmıştır.

## 🛠 Teknik Özellikler ve Uygulanan Konseptler

Bu veritabanı tasarımı sırasında aşağıdaki ileri seviye SQL pratikleri uygulanmıştır:

* **İlişkisel Veritabanı Modelleme:** `Categories`, `Products`, `Customers` ve `Orders` tabloları arasında mantıksal `Primary Key` ve `Foreign Key` ilişkileri kurulmuştur.
* **Veri Doğrulama ve Kısıtlamalar (Constraints):**
    * **CHECK:** Ürün fiyatlarının ve stok miktarlarının 0'dan küçük olamayacağı garanti altına alınmıştır.
    * **UNIQUE:** E-posta adresleri ve kategori isimlerinin tekrarlanması önlenmiştir.
    * **DEFAULT:** Sipariş ve kayıt tarihlerinin sistem tarafından otomatik atanması sağlanmıştır.
* **Veri Temizleme (Data Cleaning):** SQL string fonksiyonları (`SUBSTR`, `UPPER`, `LOWER`) kullanılarak, kullanıcı kaynaklı hatalı girilen (örn: karışık harfli isimler) verilerin normalize edilmesi sağlanmıştır.
* **Analitik Raporlama:** Karmaşık `JOIN` operasyonları ve `GROUP BY` gibi kümeleme fonksiyonları ile "En Çok Harcama Yapan Müşteriler" gibi iş zekası raporları oluşturulmuştur.
* **Veritabanı Programlama (Advanced SQL):**
    * **Triggers:** Stok yönetimi, veri loglama ve güvenlik kısıtlamaları için otomatik tetikleyiciler tasarlandı.
    * **Stored Procedures & Logic:** Toplu indirim süreçleri ve stok durum güncellemeleri için iş mantığı sorguları oluşturuldu.


## 📂 Dosya Yapısı

- `Schema.sql`: Veritabanı şemasını, tabloları ve kısıtlamaları içeren DDL (Data Definition Language) kodları.
- `Data.sql`: Sistemi test etmek için oluşturulmuş, gerçekçi senaryolara dayanan örnek veri seti.
- `Advanced_Analysis.sql`: Veri analizi ve raporlama için hazırlanan ileri seviye SQL sorguları.
- `Advanced_Features.sql`: Veritabanı otomasyonu için tasarlanmış; inserted tablosu tabanlı Trigger (Tetikleyici) yapılarını ve iş mantığını yürüten Stored Procedure (Saklı Yordam) örneklerini içeren teknik dosya.
- ## 📊 Veritabanı Şeması (ER Diagram)
![Database Schema](./database-schema.png)

## 🚀 Proje Amacı
Bu çalışma, verinin sadece saklanmasını değil, aynı zamanda iş kurallarına uygun şekilde doğrulanmasını ve anlamlı birer bilgiye (insight) dönüştürülmesini amaçlamaktadır. 

