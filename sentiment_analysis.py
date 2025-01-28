# backend/sentiment_analysis.py

import mysql.connector
import json
from transformers import AutoModelForSequenceClassification, AutoTokenizer, pipeline
import sys
import re

def main():
    try:
        db = mysql.connector.connect(
            host="localhost",
            user="root",
            password="",
            database="kdss_projesi"
        )
        cursor = db.cursor()

        # Yorumları Çek
        cursor.execute("SELECT yorum FROM feedback WHERE yorum != ''")
        yorumlar = cursor.fetchall()

        print(f"Toplam Yorum Sayısı: {len(yorumlar)}", file=sys.stderr)

        # Sentiment Analizi İçin Pipeline
        tokenizer = AutoTokenizer.from_pretrained("savasy/bert-base-turkish-sentiment-cased")
        model = AutoModelForSequenceClassification.from_pretrained("savasy/bert-base-turkish-sentiment-cased")
        sentiment_pipeline = pipeline(
            "sentiment-analysis",
            tokenizer=tokenizer,
            model=model,
            device=-1  # CPU
        )

        # Şikayet Kelimeleri
        sikayet_kelimeleri = [
            'kargo', 'paketleme', 'güzel', 'kötü', 'soyuluyor',
            'tez', 'halen', 'gerçekleştirme', 'iyileştirme', 'hizmet',
            'kalite', 'yavaş', 'ezik', 'damar', 'yardım', 'teslimat',
            'yüz', 'burun', 'gözlük', 'şapka', 'güneş', 'günlük',
            'sipariş', 'müşteri', 'teşekkür', 'rahatsız', 'alerji'
        ]
        sikayet_sayisi = {kelime: 0 for kelime in sikayet_kelimeleri}

        for index, (text,) in enumerate(yorumlar, start=1):
            # Boşluk kontrolü
            if not text.strip():
                continue

            # Noktalama vb. temizleme, küçük harfe çevirme
            temiz_text = re.sub(r'[^\w\sğüşıöçİĞÜŞIÖÇ]', '', text.lower())
            
            print(f"İşlenen Yorum {index}: {text}", file=sys.stderr)
            analysis = sentiment_pipeline(text)[0] 
            label = analysis['label']     # "positive" veya "negative"
            score = analysis['score']
            print(f"Analiz Sonucu: {analysis}", file=sys.stderr)

            # Yalnızca NEGATİF etiketli yorumlarda şikayet kelimelerini sayağım
            if label == 'negative':
                # Kelimeleri whitespace ile ayır
                kelimeler = temiz_text.split()
                # Substring mi tam eşleşme mi? 
                # Basit substring yaklaşımı (kelime içinde "şapka" geçiyorsa say)
                for kelime in kelimeler:
                    for anahtar in sikayet_kelimeleri:
                        if anahtar in kelime:   # ör: 'şapka' in 'şapkanın'
                            sikayet_sayisi[anahtar] += 1

            if index % 50 == 0:
                print(f"{index} yorum işlendi.", file=sys.stderr)

        # Son olarak en çoktan aza doğru sıralama
        sirali_sikayetler = dict(sorted(sikayet_sayisi.items(), key=lambda item: item[1], reverse=True))

        # JSON olarak stdout'a bas
        print(json.dumps(sirali_sikayetler))
        print("JSON çıktısı başarıyla yazdırıldı.", file=sys.stderr)
        sys.stdout.flush()

    except Exception as e:
        print(f"WARNING: {e}", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()