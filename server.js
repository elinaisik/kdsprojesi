// backend/server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const mysql = require('mysql2');
const { spawn } = require('child_process');
const path = require('path'); 

const app = express();
const port = 3000;

app.use(cors());
app.use(bodyParser.json());

// MySQL Bağlantısı
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',            // MySQL kullanıcı adı
  password: '',            // MySQL şifre
  database: 'kdss_projesi'
});

db.connect((err) => {
  if (err) {
    console.error('Veritabanına bağlanırken hata oluştu:', err);
    return;
  }
  console.log('Veritabanına başarıyla bağlanıldı.');
});

// 1. Giriş Endpoint'i
app.post('/api/login', (req, res) => {
    const { username, password } = req.body;
  
    if (username === 'admin' && password === '1234') {
      res.json({ success: true, message: 'Giriş başarılı' });
    } else {
      res.json({ success: false, message: 'Kullanıcı adı veya şifre hatalı!' });
    }
  });

// 2. Genel İşletme Skoru Endpoint'i
app.get('/api/business-score', (req, res) => {
    const query = `
      SELECT AVG((paketleme_puan + kargo_puan + musteri_hizmetleri_puan + urun_puan) / 4.0) AS genel_skor
      FROM feedback;
    `;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Genel skor sorgusunda hata:', err);
        res.status(500).send('Sunucu hatası');
        return;
      }
  
      // console.log ile gelen değeri kontrol
      console.log('Genel Skor:', results[0].genel_skor, typeof results[0].genel_skor);
  
      let genelSkor = 0;
      if (results[0].genel_skor !== null) {
        genelSkor = parseFloat(results[0].genel_skor).toFixed(1);
      }
  
      res.json(genelSkor);
    });
  });

// 3. Departman Puanları Endpoint'i
app.get('/api/department-scores', (req, res) => {
    const query = `
      SELECT AVG(paketleme_puan) AS paketleme,
             AVG(kargo_puan) AS kargo,
             AVG(musteri_hizmetleri_puan) AS musteri_hizmetleri,
             AVG(urun_puan) AS urun
      FROM feedback;
    `;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Departman puanları sorgusunda hata:', err);
        res.status(500).send('Sunucu hatası');
        return;
      }
      res.json(results[0]);
    });
  });

// 4. Sentiment Analizi Endpoint'i
app.get('/api/sentiment-analysis', (req, res) => {
    const pythonProcess = spawn('python3', ['sentiment_analysis.py']); // python yerine python3 

    let dataString = '';

    pythonProcess.stdout.on('data', (data) => {
        dataString += data.toString();
    });

    pythonProcess.stderr.on('data', (data) => {
        console.error(`Python backend ile JS frontend bağlandı: ${data}`);
    });

    pythonProcess.on('close', (code) => {
        if (code !== 0) {
            res.status(500).send('Sentiment analizi sırasında hata oluştu.');
            return;
        }
        console.log('Alınan JSON Verisi:', dataString); // JSON verisini logla
        try {
            const complaintData = JSON.parse(dataString);
            res.json(complaintData);
        } catch (error) {
            console.error('JSON parse hatası:', error);
            console.error('Alınan Veri:', dataString); // Hatalı veriyi logla
            res.status(500).send('Veri işleme hatası.');
        }
    });
});

// 5. Departman Bazlı Şikayetler Endpoint'i
app.get('/api/departman-sikayet', (req, res) => {
    const query = `
      SELECT urunler.kategori AS departman, COUNT(feedback.yorum) AS sikayet_sayisi
      FROM feedback
      JOIN urunler ON feedback.urun_id = urunler.urun_id
      WHERE feedback.yorum != ''
      GROUP BY urunler.kategori
      ORDER BY sikayet_sayisi DESC;
    `;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Departman bazlı şikayet sorgusunda hata:', err);
        res.status(500).send('Sunucu hatası');
        return;
      }
      const data = {};
      results.forEach(row => {
        data[row.departman] = row.sikayet_sayisi;
      });
      res.json(data);
    });
  });

// 6. Ürün Bazlı Şikayetler Endpoint'i
app.get('/api/urun-sikayet', (req, res) => {
  const query = `
    SELECT urunler.ad AS urun, COUNT(feedback.yorum) AS sikayet_sayisi
    FROM feedback
    JOIN urunler ON feedback.urun_id = urunler.urun_id
    WHERE feedback.yorum != ''
    GROUP BY urunler.ad
    ORDER BY sikayet_sayisi DESC;
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Ürün bazlı şikayet sorgusunda hata:', err);
      res.status(500).send('Sunucu hatası');
      return;
    }
    const data = {};
    results.forEach(row => {
      data[row.urun] = row.sikayet_sayisi;
    });
    res.json(data);
  });
});

// 7. Ürün Bazlı Yıldız Puanları Endpoint'i
app.get('/api/urun-yildiz-puanlari', (req, res) => {
  const query = `
    SELECT urunler.ad AS urun,
           AVG(feedback.paketleme_puan) AS paketleme_puan,
           AVG(feedback.kargo_puan) AS kargo_puan,
           AVG(feedback.musteri_hizmetleri_puan) AS musteri_hizmetleri_puan,
           AVG(feedback.urun_puan) AS urun_puan,
           AVG((feedback.paketleme_puan + feedback.kargo_puan + feedback.musteri_hizmetleri_puan + feedback.urun_puan) / 4) AS genel_memnuniyet
    FROM feedback
    JOIN urunler ON feedback.urun_id = urunler.urun_id
    GROUP BY urunler.ad
    ORDER BY genel_memnuniyet DESC;
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Ürün bazlı memnuniyet sorgusunda hata:', err);
      res.status(500).send('Sunucu hatası');
      return;
    }
    res.json(results);
  });
});

// 8. Yıl Boyunca Satış Verileri Endpoint'i
app.get('/api/satis-verileri', (req, res) => {
  const query = `
    SELECT DATE_FORMAT(tarih, '%Y-%m') AS ay, SUM(toplam_tutar) AS toplam_satis
    FROM siparisler
    GROUP BY ay
    ORDER BY ay ASC;
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Satış verileri sorgusunda hata:', err);
      res.status(500).send('Sunucu hatası');
      return;
    }
    const data = {
      labels: [],
      values: []
    };
    results.forEach(row => {
      data.labels.push(row.ay);
      data.values.push(row.toplam_satis);
    });
    res.json(data);
  });
});

// 9. Ürün Bazlı Memnuniyet Verileri Endpoint'i
app.get('/api/urun-memnuniyet', (req, res) => {
    const query = `
      SELECT 
        urunler.ad AS urun,
        AVG(feedback.paketleme_puan) AS paketleme_puan,
        AVG(feedback.kargo_puan) AS kargo_puan,
        AVG(feedback.musteri_hizmetleri_puan) AS musteri_hizmetleri_puan,
        AVG(feedback.urun_puan) AS urun_puan,
        AVG((feedback.paketleme_puan + feedback.kargo_puan + feedback.musteri_hizmetleri_puan + feedback.urun_puan) / 4) AS genel_memnuniyet
      FROM feedback
      JOIN urunler ON feedback.urun_id = urunler.urun_id
      GROUP BY urunler.ad
      ORDER BY genel_memnuniyet DESC;
    `;
    db.query(query, (err, results) => {
      if (err) {
        console.error('Ürün bazlı memnuniyet sorgusunda hata:', err);
        res.status(500).send('Sunucu hatası');
        return;
      }
      res.json(results);
    });
  });

// 10. Ürün Bazlı Satış Verileri Endpoint'i
app.get('/api/urun-satis', (req, res) => {
  const query = `
    SELECT 
      urunler.ad AS urun,
      SUM(siparisler.adet) AS toplam_adet,
      SUM(siparisler.toplam_tutar) AS toplam_tutar
    FROM siparisler
    JOIN urunler ON siparisler.urun_id = urunler.urun_id
    GROUP BY urunler.ad
    ORDER BY toplam_tutar DESC;
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error('Ürün bazlı satış sorgusunda hata:', err);
      res.status(500).send('Sunucu hatası');
      return;
    }
    res.json(results);
  });
});

// Statik frontend
app.use(express.static(path.join(__dirname, '../frontend')));

// Ana sayfa '/' için login.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, '../frontend', 'login.html'));
  });

// Sunucu run
app.listen(port, () => {
    console.log(`Sunucu http://localhost:${port} adresinde çalışıyor.`);
  });