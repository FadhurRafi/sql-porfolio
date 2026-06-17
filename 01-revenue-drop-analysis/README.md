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
*(akan diisi setelah jalankan semua query)*

## 🎯 Business Recommendation
*(akan diisi berdasarkan findings)*

## 📝 Notes
Query dioptimasi dengan filter awal di CTE dan menghindari fungsi 
di WHERE clause untuk performa lebih baik pada dataset besar.