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

TUGAS 7
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