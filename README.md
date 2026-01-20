# SQL-Practice-Projects

# SQL Learning Journey 🚀

Bu depoda, BTK Akademi ve ders notlarım üzerinden ilerlediğim SQL öğrenme sürecindeki projelerimi paylaşıyorum.

## 1. Kütüphane Yönetim Sistemi (Basic Schema)
Bu çalışma, veritabanı tasarımı, tablo ilişkileri ve temel CRUD işlemlerini içerir.

### Veritabanı Şeması
* **Kategoriler**: Kitap türlerini tutar.
* **Kitaplar**: Kitap bilgilerini ve kategori bağlantısını tutar.
* **Ogrenciler**: Kütüphane üyelerini tutar.
* **OduncIslemleri**: Öğrenciler ve kitaplar arasındaki ilişkiyi yönetir (Foreign Keys).

### Örnek Sorgu
```sql
SELECT Ad, KitapAdı FROM OduncIslemleri ... 
