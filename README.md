# kick_off

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

TUGAS 8
=======
1.  Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. 
    Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
---> Navigator.push() digunakan untuk pindah ke page baru tanpa menutup page sebelumnya, 
    jadi user masih bisa kembali ke page awal dengan tombol “back”. Sedangkan 
    Navigator.pushReplacement() mengganti page yang sedang dibuka dengan page baru,
    sehingga page sebelumnya tidak bisa dikembalikan lagi. Dalam aplikasi Football Shop saya,
    Navigator.push() digunakan saat user menekan tombol "Add Product" untuk pindah ke page form. 
    Ini agar user bisa kembali (back) ke halaman utama setelah selesai mengisi form.
    Sebaliknya, Navigator.pushReplacement() digunakan saat user push menu 'Home' dari 
    drawer. Ini akan mengganti page apapun yang sedang dibuka (misalnya page form) dengan 
    home page, sehingga user tidak bisa 'back' ke page form tadi.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk 
   membangun struktur halaman yang konsisten di seluruh aplikasi?
---> Saya menggunakan Scaffold sebagai struktur dasar setiap page agar tampilan tetap rapi dan 
     konsisten. Di dalamnya, ada AppBar untuk menampilkan judul halaman atau tombol navigasi, dan 
     Drawer untuk memudahkan akses ke halaman lain seperti All Products, My Product, atau Add
     Products.

3.  Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, 
    SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh 
    penggunaannya dari aplikasi kamu.
---> Widget seperti Padding membantu memberi jarak antar elemen agar tampilan lebih rapi dan tidak 
     terlalu rapat. SingleChildScrollView berguna agar halaman bisa digulir saat elemen form cukup 
     panjang, terutama di layar kecil. ListView cocok digunakan untuk menampilkan banyak elemen yang 
     seragam seperti daftar produk atau item keranjang belanja. Misalnya, pada halaman form checkout, 
     saya pakai Padding di productlist_form.dart sebagai child utama dari Form. Saya membungkus
     seluruh column yang berisi field-field dengan SingleChildScrollView. 

4.  Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual 
    yang konsisten dengan brand toko?
---> Saya menyesuaikan warna tema aplikasi Kick Off dengan mengatur properti warna pada widget 
     seperti AppBar dan ElevatedButton agar sesuai dengan warna brand. Misalnya, aku mengganti 
     backgroundColor AppBar menjadi warna biru gradasi yang mencerminkan identitas toko, serta 
     menyesuaikan warna tombol action menggunakan ButtonStyle agar tetap seragam. Dengan 
     begitu, setiap halaman, termasuk halaman form dan menu utama, memiliki tampilan yang konsisten 
     dengan tema visual Kick Off.


TUGAS 7
=======
1.  Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
--> Widget tree itu seperti struktur pohon yang isinya semua widget yang menyusun tampilan aplikasi Flutter. Setiap widget bisa punya “anak” (child) yang juga bisa punya anak lagi, dan seterusnya.
    Jadi hubungan parent-child itu seperti hirarki, parent ngatur atau membungkus childnya, sedangkan child mengikuti aturan atau layout dari parent-nya. Misalnya Column (parent) bisa punya beberapa Text atau Button (child).
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
---> 
MaterialApp -> sebagai root aplikasi, ngatur tema dan navigasi.
Scaffold -> jadi struktur utama halaman (ada app bar, body, dll).
AppBar -> header di atas layar.
Text -> menampilkan tulisan.
Column -> menyusun widget secara vertikal.
Row -> menyusun widget secara horizontal.
Container -> mengatur padding, margin, warna background, atau ukuran widget.
Icon -> menmapilkan ikon.
ElevatedButton / TextButton -> tombol interaktif.
Card -> menampilkan konten di dalam tampilan kayak kartu biar lebih rapi.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
--> MaterialApp adalah widget utama yang biasanya dipakai sebagai root aplikasi Flutter. MaterialApp 
    menyediakan struktur dasar aplikasi seperti tema warna, font, route (navigasi), dan title. 

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
--> StatelessWidget : widget yang tampilannya tidak berubah meskipun ada interaksi. Contohnya kayak Text atau Icon.
StatefulWidget : widget yang bisa berubah tampilan atau data tanpa perlu refresh halaman. Misalnya tombol yang kalo ditekan bisa ganti warna atau angka counter yang naik.
StatelessWidget dapat digunakan jika tampilannya statis, dan StatefulWidget jika butuh ada perubahan data atau interaksi dari user.

5.  Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
--> BuildContext itu sepert identitas dari posisi widget di widget tree. Flutter butuh context ini 
agar mengetahui di mana posisi widget berada, biar bisa akses widget parent, tema, atau navigasi. 
Biasanya BuildContext dipakai di dalam method build untuk manggil widget lain, ambil tema, atau pindah halaman.

6.  Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart". 
--> Hot reload -> update kode yang berubah langsung ke aplikasi tanpa ngulang dari awal, jadi data yang sudah ada tidak ilang.
Hot restart -> nge-restart aplikasi dari awal, jadi semua data dan state balik ke kondisi awal. 
Biasanya digunakan kalo perubahan di kode tidak bisa ke-reload langsung.