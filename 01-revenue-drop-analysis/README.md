# 📊 Revenue Performance & Drop Analysis

## 🎯 Business Problem
Management membutuhkan investigasi mendalam terkait performa revenue 
bulanan — termasuk identifikasi region dan produk yang mengalami 
penurunan signifikan, untuk mendukung pengambilan keputusan bisnis.

## 🗂️ Dataset
Data transaksi penjualan periode Januari - April 2024, mencakup:
- `order_date` — tanggal transaksi
- `region` — wilayah penjualan (East, West, North, South)
- `product` — nama produk
- `quantity`, `price` — untuk kalkulasi revenue

## 🛠️ Tools
- PostgreSQL
- Window Functions (LAG, RANK, DENSE_RANK)
- CTE (Common Table Expression)

## 📈 Analysis Steps

### 1. Monthly Revenue Trend
Melihat trend revenue bulanan secara keseluruhan untuk identifikasi 
periode anomali.
→ [`1_monthly_trend.sql`](queries/1_monthly_trend.sql)

### 2. Regional Breakdown
Membandingkan performa revenue antar region menggunakan 
period-over-period comparison.
→ [`2_regional_breakdown.sql`](queries/2_regional_breakdown.sql)

### 3. Product Breakdown
Drill-down ke level produk untuk identifikasi kontributor utama 
penurunan revenue.
→ [`3_product_breakdown.sql`](queries/3_product_breakdown.sql)

### 4. Drop Investigation
Query investigasi lengkap — menampilkan region & produk dengan 
penurunan revenue lebih dari 10% dibanding bulan sebelumnya.
→ [`4_drop_investigation.sql`](queries/4_drop_investigation.sql)

## 💡 Key Findings

1. **Februari 2024 adalah periode penurunan revenue terparah**, dengan 
   3 dari 4 region (East, North, West) mengalami penurunan signifikan 
   secara bersamaan — mengindikasikan kemungkinan faktor musiman 
   pasca high-season Januari, bukan masalah operasional spesifik.

2. **Region North paling konsisten bermasalah**, mengalami penurunan 
   berulang di dua periode berbeda (Februari: -36.15%, April: -25.46%), 
   menjadikannya region dengan risiko tertinggi.

3. **Monitor 27" dan Laptop Pro** adalah dua kontributor revenue 
   terbesar di region North dengan kontribusi yang berimbang — 
   menunjukkan penurunan permintaan terjadi di kedua produk utama 
   secara bersamaan, bukan disebabkan oleh satu produk tertentu.

4. **Region East menunjukkan pola tidak stabil** — sempat recovery 
   di Maret namun kembali turun di April (-14.70%), mengindikasikan 
   perlu monitoring lebih lanjut.

## 🎯 Business Recommendation

1. **Investigasi faktor musiman Februari** — cek apakah ada pola 
   historis serupa di tahun-tahun sebelumnya untuk memastikan ini 
   adalah tren musiman yang bisa diantisipasi, bukan masalah 
   operasional.

2. **Prioritaskan audit region North** — lakukan deep-dive ke 
   customer feedback, kompetitor, dan strategi pricing khusus 
   region ini karena pola penurunannya paling konsisten.

3. **Evaluasi strategi bundling Monitor 27" & Laptop Pro** — karena 
   keduanya turun bersamaan, kemungkinan ada hubungan permintaan 
   (customer yang beli laptop juga cenderung beli monitor). 
   Bundling promo bisa membantu menjaga stabilitas kedua produk.

4. **Set up monitoring bulanan otomatis** menggunakan query 
   investigasi ini, agar tim bisa deteksi penurunan >10% lebih cepat 
   tanpa menunggu laporan manual bulanan.

## 📝 Notes
Query dioptimasi dengan filter awal di CTE dan menghindari fungsi 
di WHERE clause untuk performa lebih baik pada dataset besar.