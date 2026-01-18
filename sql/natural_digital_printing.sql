CREATE DATABASE natural_digital_printing_db;
USE natural_digital_printing_db;

CREATE TABLE pelanggan (
    id_pelanggan INT PRIMARY KEY,
    nama_customer VARCHAR(100) NOT NULL,
    alamat TEXT,
    telp VARCHAR(15)
);

CREATE TABLE karyawan (
    id_karyawan VARCHAR(10) PRIMARY KEY,
    nama_karyawan VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50) NOT NULL
);

CREATE TABLE kasir (
    id_kasir VARCHAR(10) PRIMARY KEY,
    id_karyawan VARCHAR(10) NOT NULL,
    waktu_input DATE NOT NULL,
    CONSTRAINT fk_kasir_karyawan
        FOREIGN KEY (id_karyawan)
        REFERENCES karyawan(id_karyawan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE barang (
    kode_barang VARCHAR(20) PRIMARY KEY,
    nama_barang VARCHAR(100) NOT NULL,
    ukuran VARCHAR(50),
    harga INT NOT NULL
);

CREATE TABLE transaksi (
    id_transaksi VARCHAR(10) PRIMARY KEY,
    no_bukti VARCHAR(50) NOT NULL,
    tanggal DATE NOT NULL,
    jatuh_tempo DATE NOT NULL,
    term VARCHAR(20) NOT NULL,
    total_harga INT NOT NULL,
    sales VARCHAR(100),
    id_pelanggan INT NOT NULL,
    id_kasir VARCHAR(10) NOT NULL,
    CONSTRAINT fk_transaksi_pelanggan
        FOREIGN KEY (id_pelanggan)
        REFERENCES pelanggan(id_pelanggan)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT fk_transaksi_kasir
        FOREIGN KEY (id_kasir)
        REFERENCES kasir(id_kasir)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE `order` (
    id_order VARCHAR(10) PRIMARY KEY,
    id_transaksi VARCHAR(10) NOT NULL,
    kode_barang VARCHAR(20) NOT NULL,
    qty INT NOT NULL,
    harga INT NOT NULL,
    CONSTRAINT fk_order_transaksi
        FOREIGN KEY (id_transaksi)
        REFERENCES transaksi(id_transaksi)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_order_barang
        FOREIGN KEY (kode_barang)
        REFERENCES barang(kode_barang)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

INSERT INTO pelanggan VALUES
(53179, 'Arva', 'Gentan, Baki, Sukoharjo', '82133506723');

INSERT INTO karyawan VALUES
('K001', 'Rena', 'Kasir');

INSERT INTO kasir VALUES
('KS001', 'K001', '2025-06-11');

INSERT INTO barang VALUES
('A301.36', 'AC 260 GR (1 SISI)', '-', 2900),
('A301.415', 'LAMINASI HOT GLOSSY 1-5', '-', 2000);

INSERT INTO transaksi VALUES
('TR01', 'NDP/0825/06/2025', '2025-06-11', '2025-06-11',
 'CASH', 9800, 'Natural Digital Printing', 53179, 'KS001');

INSERT INTO `order` VALUES
('OR01', 'TR01', 'A301.36', 2, 2900),
('OR02', 'TR01', 'A301.415', 2, 2000);

SELECT 
    p.nama_customer,
    t.no_bukti,
    b.nama_barang,
    o.qty,
    o.harga,
    (o.qty * o.harga) AS subtotal
FROM `order` o
JOIN transaksi t ON o.id_transaksi = t.id_transaksi
JOIN pelanggan p ON t.id_pelanggan = p.id_pelanggan
JOIN barang b ON o.kode_barang = b.kode_barang;

SELECT 
    id_transaksi,
    SUM(qty * harga) AS total_transaksi
FROM `order`
GROUP BY id_transaksi;

SELECT 
    id_transaksi,
    SUM(qty * harga) AS total_transaksi
FROM `order`
GROUP BY id_transaksi
HAVING total_transaksi > 5000;

START TRANSACTION;

INSERT INTO transaksi VALUES
('TR02', 'NDP/0826/06/2025', '2025-06-12', '2025-06-12',
 'CASH', 4000, 'Natural Digital Printing', 53179, 'KS001');

ROLLBACK;
SELECT * FROM transaksi;
SELECT * FROM pelanggan;
SELECT * FROM karyawan;
SELECT * FROM kasir;
SELECT * FROM barang;
SELECT * FROM transaksi;
SELECT * FROM `order`;


