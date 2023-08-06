-- Base Table
CREATE TABLE base_table(
SELECT 
id_distributor,
id_cabang,
id_invoice,
tanggal,
j.id_customer,
j.id_barang,
jumlah_barang,
nama_barang,
tipe,
nama_tipe,
kemasan,
p.level,
nama,
cabang_sales
unit,
harga,
mata_uang,
brand_id
FROM penjualan j
JOIN pelanggan p ON j.id_customer = p.id_customer
JOIN barang b ON j.id_barang = b.kode_barang);

SELECT * FROM base_table;

-- Aggregate Table
CREATE TABLE aggregate_table(
SELECT
tanggal,
jumlah_barang,
nama_barang,
nama_tipe,
kemasan,
level,
nama AS nama_pelanggan,
unit,
harga,
(harga * jumlah_barang) AS total_harga
FROM base_table);

SELECT * FROM aggregate_table
GROUP BY 3,4,5,6
ORDER BY tanggal ASC;