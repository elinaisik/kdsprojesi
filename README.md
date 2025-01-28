Proje Konusu
Negatif müşteri geri bildirimlerini analiz ederek işletmenin karar alma süreçlerine destek veren bir Karar Destek Sistemi (KDS) tasarladım. Bu sistem, farklı departmanlar ve ürünler için kullanıcıya ileriye dönük planlama ve iyileştirme fırsatları sunuyor.

Proje Amaçları
Müşteri Memnuniyetini Artırmak: Negatif geri bildirimlerden yola çıkarak işletme süreçlerinde iyileştirmeler yapmak.
Veriye Dayalı Karar Alma: Geri bildirimlerin sentiment analiziyle değerlendirilip görselleştirilmesi sayesinde daha bilinçli kararlar almak.
Departman ve Ürün Performansı Takibi: İşletmenin farklı alanlardaki performansını detaylı bir şekilde gözlemlemek.
Öngörü Sağlamak: İleriye dönük trendleri analiz ederek stratejik kararlar oluşturmak.


Teknik Detaylar
Veri Kaynağı:

MySQL Database kullanıyorum. Müşteri geri bildirimleri ve satış verileri bu veritabanında saklanıyor.
Veri seti şunları içeriyor:
ürünler tablosu
siparisler tablosu
musteriler tablosu
feedback tablosu(departman puanları, yorum)

Negatif geri bildirimler senstiment analizi ile analiz ediliyor ve daha sonra sistem,  negatif yorumlardaki şikayetlerin hangi alanlarda yoğunlaştığını tespit ediyor.
Dashboard Tasarımı:
Dashboardum, kullanıcıya şu özellikleri sunuyor:

Genel İş Skoru: İşletmenin genel müşteri memnuniyeti skoru.
Departman Skorları: (Paketleme, kargo, müşteri hizmetleri, ürün kalitesi vb.) her departmanın ayrı şikayet analizi.
Genel Şikayet Grafiği: Sentiment analizine göre oluşturulan dinamik bir şikayet grafiği.
Şikayetlerin Dağılımı: Hangi departmanın daha fazla şikayet aldığına dair bir pasta grafiği.
Ürün Bazlı Şikayetler: dropdown menülü seçilen ürün hakkında puan, şikayet gösterir
Ürünlerin karşılaştırmalı satış ,memnuniyet, şikayet, üçlü bar grafiği.

