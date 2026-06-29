# 📦 Product Performance & Inventory Analysis

## 🎯 Business Problem
Management ingin mengetahui performa penjualan produk di setiap kategori, 
profitabilitas masing-masing kategori, serta mengidentifikasi risiko 
inventory (understock/overstock) untuk mendukung keputusan procurement 
dan strategi bisnis.

## 🗂️ Dataset
Data produk dan transaksi penjualan e-commerce (Electronics, Fashion, 
Home & Living) periode Mei 2024, mencakup:

**Tabel `products`**
- `product_name`, `category` — informasi produk
- `cost_price`, `sell_price` — untuk kalkulasi profit
- `stock_qty` — stock tersedia saat ini

**Tabel `order_items`**
- `order_date`, `product_id`, `quantity_sold` — data transaksi

## 🛠️ Tools
- PostgreSQL
- Window Functions (RANK, SUM() OVER)
- CTE (Common Table Expression)
- CASE WHEN untuk kategorisasi custom

## 📈 Analysis Steps

### 1. Best Seller per Category
Mengidentifikasi top 3 produk terlaris (berdasarkan quantity sold) 
di setiap kategori.
→ [`1_best_seller_per_category.sql`](queries/1_best_seller_per_category.sql)

### 2. Profitability Analysis
Menghitung total profit dan profit margin per kategori untuk 
membandingkan profitabilitas antar kategori.
→ [`2_profitability_analysis.sql`](queries/2_profitability_analysis.sql)

### 3. Inventory Risk Analysis
Mengkategorikan setiap produk sebagai Understock, Overstock, atau 
Healthy berdasarkan rasio stock terhadap quantity sold.
→ [`3_inventory_risk.sql`](queries/3_inventory_risk.sql)

### 4. Combined Analysis
Menggabungkan kontribusi revenue (%) tiap produk terhadap total 
revenue dengan status inventory-nya — untuk mengidentifikasi produk 
kritis (revenue tinggi tapi understock).
→ [`4_combined_analysis.sql`](queries/4_combined_analysis.sql)

## 💡 Key Findings

1. **Laptop Pro 14" adalah single point of failure** — berkontribusi 
   54.29% dari total revenue, namun stock tersisa hanya 5 unit dengan 
   30 unit sudah terjual. Risiko kehabisan stock pada produk ini 
   berdampak langsung ke lebih dari separuh revenue bisnis.

2. **Bluetooth Speaker mengalami understock paling parah secara rasio** 
   (stock 8 vs terjual 45 — rasio 1:5.6), meski kontribusi revenue 
   relatif kecil (3.73%).

3. **Kategori Home & Living memiliki profit margin tertinggi (60.74%)** 
   dibanding Electronics (40.45%) dan Fashion (56.23%), namun nominal 
   profit terkecil — mengindikasikan potensi niche yang belum 
   dimaksimalkan secara volume.

4. **5 dari 15 produk mengalami overstock**, didominasi produk dengan 
   kontribusi revenue di bawah 0.5% (Cotton T-Shirt, Sunglasses UV 
   Protect, Ceramic Mug Set, Throw Pillow) — mengindikasikan modal 
   kerja yang tertahan di produk slow-moving.

## 🎯 Business Recommendation

1. **Prioritaskan restock Laptop Pro 14" segera** — mengingat 
   kontribusinya terhadap revenue, kehabisan stock berisiko tinggi 
   terhadap pendapatan bisnis secara keseluruhan. Pertimbangkan 
   safety stock minimum yang proporsional dengan kontribusi revenue.

2. **Tinjau ulang strategi procurement untuk produk overstock** — 
   evaluasi apakah perlu diskon/clearance untuk membebaskan modal 
   kerja yang tertahan di Cotton T-Shirt, Sunglasses UV Protect, dan 
   Ceramic Mug Set.

3. **Eksplorasi peningkatan volume di kategori Home & Living** — 
   dengan margin tertinggi, strategi marketing tambahan di kategori 
   ini berpotensi meningkatkan profit signifikan tanpa menekan margin.

4. **Bangun alert system otomatis untuk rasio stock vs sales** — 
   khususnya untuk produk top revenue contributor, agar tim bisa 
   antisipasi understock sebelum benar-benar kehabisan.

## 📝 Notes
Status inventory dikategorikan dengan aturan: Understock jika stock 
< quantity sold, Overstock jika stock > 3x quantity sold, selebihnya 
Healthy.