# PERANCANGAN DAN IMPLEMENTASI BASIS DATA TRANSAKSI PADA NATURAL DIGITAL PRINTING

# Deskripsi Projek
Proyek ini merupakan tugas mata kuliah Pemrograman Basis Data yang bertujuan untuk merancang dan mengimplementasikan basis data transaksi pada usaha Natural Digital Printing. Sistem basis data ini digunakan untuk mengelola data pelanggan, karyawan/kasir, barang cetak, serta transaksi penjualan secara terstruktur menggunakan konsep basis data relasional dan bahasa SQL. Fokus utama proyek ini adalah pada perancangan database, relasi tabel, serta implementasi query SQL, tanpa pengembangan antarmuka aplikasi.
# Tolls Yang Digunakan
  1. DBMS : MYSQL
  2. Bahasa Query : SQL
  3. Notepad,phpMyAdmin, XAMPP, MySQL Workbrench

# Langkah Instalasi / Setup Database
  # Instalasi
    1. Pastikan sudah menginstall MYSQL dan Mysql Workbrench di komputer/laptop
    2. Pastikan MYSQL server berjalan dengan baik
    3. Jalankan MySQL Workbrench
    4. Pada awal halaman mysql workbrench, klik Local Instance MYSQL
    5. Masukkan password MySQL jika diminta
    6. Tunggu hingga dashboard MySQL Workbench terbuka.
  # Membuat Database
    1. Pada panel Navigator => Schemas, klik kanan
    2. Pilih Create Schema
    3. Masukkan nama database, contohnya : natural_digital_printing
    4. Klik Apply
    5. Periksa SQL script yang muncul, lalu klik Apply kembali
    6. Klik Finish
    7. Pastikan databasenya sudah muncul di daftar Schemas
  # Mengaktifkan Database
    1. Klik 2 kali pada nama databasenya
    2. Pastikan nama database bold yang menandakan itu sudah aktif, atau cara alternatifnya USE natural_digital_printing
  # Menjalankan Program
    1. Buka file SQL yang sudah dibuat (Klik File => Open SQL script
    2. Blok script yang ingin dieksekusi lalu Klik Execute (kilat)
    3. Hasil eksekusi akan muncul pada Result Grid di bagian bawah
  # Implementasi Database
  <img width="1202" height="278" alt="image" src="https://github.com/user-attachments/assets/0987a8da-4f09-473f-ab47-5dc81db93e7a" />
  Implementasi basis data
dilakukan menggunakan MySQL
dan MySQL Workbench.
Pembuatan tabel dilengkapi
dengan Primary Key dan
Foreign Key untuk menjaga
integritas data.

# Entity Relationship Diagram
  <img width="971" height="673" alt="image" src="https://github.com/user-attachments/assets/daffecc1-edfe-427a-aab8-826eafd75a6f" />
  Perancangan basis data dilakukan
menggunakan ERD dengan entitas
utama yaitu Pelanggan, Karyawan,
Kasir, Barang, Transaksi, dan Order.
Relasi antar entitas dirancang untuk
mendukung proses transaksi
penjualan.



# Nama Anggota Kelompok
  1. Insan Nia Cahaya Putri
  2. Sandhy Prasetyo Adjie
  3. Arvanda Nuraini
