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
TUGAS 9
=======
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa 
konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, 
null-safety, maintainability)?
--> Model Dart dipakai supaya data dari Django punya bentuk yang jelas dan tipe yang pasti. Kalau 
cuma pakai Map<String, dynamic>, struktur datanya jadi liar dan rawan error. Model membantu ngejamin 
tipe data, ngejamin null-safety, dan bikin kode lebih gampang dipelihara kalau API berubah. Selain 
itu, model bikin akses data lebih rapi karena kita akses lewat properti, bukan string key yang rawan 
typo. Intinya, model bikin aplikasi lebih aman, jelas, dan enak dikelola untuk jangka panjang.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs 
CookieRequest.
--> Package http dipakai untuk request standar seperti GET dan POST tanpa manajemen session. Ini 
cocok buat endpoint umum yang tidak butuh login. CookieRequest beda fungsi karena dia nyimpen dan 
bawa cookie session Django secara otomatis. CookieRequest jadi solusi khusus buat request yang butuh 
autentikasi, seperti login, mengambil data user, atau mengakses endpoint yang butuh session. Jadi 
http itu request biasa, sementara CookieRequest itu request yang terintegrasi dengan sistem login Django.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
--> Autentikasi Django pakai session. Artinya seluruh halaman harus pakai session yang sama. Kalau 
setiap widget bikin instance CookieRequest sendiri, maka session-nya terpecah dan Django nganggep 
user belum login. Karena itu instance CookieRequest dibagikan lewat Provider supaya semua halaman 
pakai session yang sama dan status login tetap konsisten.

4.  Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django.
Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan 
SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi 
tersebut tidak dilakukan dengan benar?
--> Supaya Flutter bisa komunikasi dengan Django, ada beberapa konfigurasi yang harus disiapkan. 
Alamat 10.0.2.2 perlu dimasukkan ke ALLOWED_HOSTS karena emulator Android hanya bisa mengakses 
localhost Django melalui alamat itu. CORS diaktifkan supaya Django mengizinkan request dari aplikasi 
Flutter. Pengaturan SameSite dan cookie harus disesuaikan supaya session dari Django tidak diblokir 
browser emulator. Android juga butuh izin internet di AndroidManifest agar aplikasi boleh ngirim 
request ke luar. Kalau salah satu konfigurasi hilang atau salah, request bisa gagal total, cookie 
tidak tersimpan, atau Django menolak request.

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
--> Prosesnya dimulai dari user yang mengisi data di Flutter. Data ini disimpan lewat controller atau 
state. Flutter kemudian mengirim data itu dalam bentuk JSON ke API Django melalui http atau CookieRequest. 
Django menerima data, memprosesnya seperti validasi atau menyimpan ke database, lalu mengembalikan respons 
JSON. Flutter menerima respons itu, mengubahnya ke dalam model Dart, dan model tersebut dipakai untuk 
menampilkan data di UI melalui widget seperti Text, Card, atau ListView.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada
Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
--> Saat login, Flutter mengirim username dan password lewat CookieRequest. Django mengecek datanya
dan kalau cocok, Django membuat session dan mengembalikan cookie session itu. CookieRequest menyimpan 
cookie supaya request berikutnya dianggap sebagai user yang sudah login. Setelah itu Flutter 
menampilkan menu utama. Proses register mirip, hanya saja Django membuat user baru terlebih dahulu. 
Untuk logout, Flutter mengirim request logout menggunakan CookieRequest, Django menghapus session, 
dan Flutter kembali ke halaman login. Semua proses ini berjalan dari input Flutter, diproses Django, 
sampai status login berubah di aplikasi.

7.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! 
(bukan hanya sekadar mengikuti tutorial).
-->
- Implementasi fitur registrasi akun pada backend dan client 
- Buat endpoint registrasi di Django yang menerima data seperti username, password, dan field tambahan jika diperlukan. 
- Di Flutter, buat halaman registrasi dengan form input dan validasi sederhana (mis. cek field kosong, format password). 
- Kirim request POST berisi JSON ke endpoint registrasi (mis. request.postJson('/register/', body)), tangani response error/sukses, dan arahkan user ke halaman login setelah registrasi berhasil. 
- Membuat halaman login pada Flutter 
- Buat halaman login dengan dua input: username dan password, beserta handling loading dan error. 
- Panggil mekanisme login melalui CookieRequest.login() atau POST ke endpoint login. 
- Setelah response sukses dan cookie session diterima, set state aplikasi menjadi authenticated dan navigasi ke halaman utama/menu aplikasi. 
- Integrasi autentikasi Django dengan Flutter (session management)
- Konfigurasi view login/logout di Django untuk mengembalikan response JSON dan meng-set session cookie (sessionid). 
- Inisialisasi satu instance CookieRequest di main.dart dan sediakan melalui Provider atau mekanisme state management lain. 
- Pastikan semua request yang memerlukan autentikasi menggunakan instance CookieRequest tersebut sehingga cookie session otomatis dikirimkan. 
- Membuat model kustom di Django dan endpoint JSON 
- Definisikan model di Django (mis. Item) dengan field name, price, description, thumbnail, category, is_featured, dan relasi ForeignKey ke User bila diperlukan. 
- Lakukan migrasi schema (makemigrations, migrate). 
- Implementasikan serializer/view yang mengembalikan JSON untuk list, create, dan detail item (DRF atau JsonResponse). 
- Membuat model Dart dan parsing JSON di Flutter 
- Buat file model Dart (mis. item.dart) dengan konstruktor, fromJson, dan toJson. Pastikan handling untuk tipe numeric dan nilai nullable. 
- Gunakan model ini untuk mem-parse response JSON menjadi objek Dart yang terstruktur. 
- Menampilkan daftar item (list page) di Flutter 
- Buat service untuk mengambil data list dari endpoint Django (mis. request.getJson('/api/items/')). 
- Konversi response menjadi List<Item> menggunakan Item.fromJson. 
- Render daftar menggunakan ListView.builder, setiap item ditampilkan dalam Card yang memuat name, price, description singkat, thumbnail (pakai Image.network + placeholder), category, dan indikator is_featured. 
- Membuat halaman detail untuk setiap item 
- Tambahkan navigasi dari tiap card list ke DetailScreen dengan mengirim objek Item sebagai argumen. 
- Di DetailScreen, tampilkan seluruh atribut model secara lengkap (nama, harga, deskripsi penuh, gambar, kategori, status featured, dll). 
- Sediakan tombol atau AppBar dengan tombol kembali untuk kembali ke halaman daftar. 
- Menerapkan filter item berdasarkan user yang login 
- Implementasikan filter di backend agar endpoint hanya mengembalikan data milik request.user (contoh: Item.objects.filter(user=request.user)). 
- Pastikan endpoint yang melakukan filter memerlukan autentikasi session sehingga data terbatas hanya untuk pemiliknya. 
- Testing alur end-to-end 
- Uji end-to-end: register -> login -> ambil daftar item -> buka detail item -> logout. 
- Periksa behavior session cookie, response error handling, dan tampilan loading/error di UI. 
- Pastikan konfigurasi konektivitas (ALLOWED_HOSTS, CORS, SameSite cookie) sudah sesuai untuk environment development/production.

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