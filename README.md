# Jasa titip App

# Deskripsi Aplikasi
Jasa titop App adalah aplikasi mobile berbasis Flutter yang digunakan memfasilitasi jasa titip (jastip) secara Online. Aplikasi ini memungkinkan pengguna untuk menambahkan pesanan titipan, melihat daftar permintaan, memperbarui detail pesanan, serta menghapus pemesanan titipan dengan mudah dan terorganisir.

## Struktur Project

```text
lib/t
|- models/
|  |- items.dart
|  |- order.dart
|
|- page/
|  |- auth/
|     |- login.dart
|     |- register.dart
|  |- dashboard/
|     |- dashboardpelanggan.dart
|     |- dashboard.dart
|  |- jastip/
|     |- create.dart
|      |- update.dart
|
|- main.dart
```

## Fitur Aplikasi

1. Login dan register
   
   Aplikasi ini menyediakan login untuk pengguna lama dan register untuk pengguna baru.
   
2. Create
   
   Pengguna dapat menambahkan pesananan titipan dengan mengisi form input seperti nama barang, lokasi, nama pemesan dan harga.

3. Read
   
   Aplikasi menampilkan daftar pemesanan titipan yang telah dimasukkan.

4. Update
    
   Pengguna dapat mengubah data pemesanan titipan seperti nama barang, lokasi, nama pemesan dan harga

5. Delete
    
   Pengguna dapat menghapus data pemesanan titipan.

6. Multi Page Navigation
    
   Aplikasi memiliki beberapa halaman:
   - Halaman Utama (Dashboard)
   - Halaman Tambah pesanan titipan
   - Halaman Update pesanan titipan

7. Dark dan light mode
   Aplikasi menyediakan dua mode tampilan yaitu dark mode dan light mode yang dapat digunakan oleh pengguna.

## Widget yang Digunakan

- MaterialApp
- Scaffold
- AppBar
- GridView
- TextField
- ElevatedButton
- FloatingActionButton
- Navigator
- ConstrainedBox
- GestureDetector
- AlertDialog   
- CircularProgressIndicator
- OutlineInputBorder
- FilteringTextInputFormatter

## Simulasi Aplikasi

### Login





   
  
