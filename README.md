# Tugas 7
## 1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless Widget adalah widget yang tampilannya tetap dan tidak berubah selama aplikasi berjalan karena tidak memiliki state (keadaan) yang bisa berubah. Sebaliknya, Stateful Widget adalah widget yang memiliki state internal yang dapat berubah-ubah, sehingga bisa memperbarui tampilan saat ada perubahan data. Jadi, perbedaannya terletak pada kemampuan Stateful Widget untuk merespons perubahan dan memperbarui UI, sedangkan Stateless Widget tidak bisa melakukan itu.

## 2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
Dalam kode saya, saya menggunakan beberapa widget:
1. Scaffold: Menyediakan struktur dasar aplikasi dengan AppBar dan body.
2. AppBar: Menampilkan bar di bagian atas aplikasi yang berisi judul.
3. Padding: Memberikan jarak di sekitar widget anaknya.
4. Column: Menyusun widget secara vertikal.
5. Row: Menyusun widget secara horizontal.
6. Card: Menampilkan kotak dengan sudut melengkung dan bayangan, digunakan dalam InfoCard.
7. Container: Membungkus widget lain dan memungkinkan pengaturan ukuran, padding, dan dekorasi.
8. Text: Menampilkan teks di layar.
9. SizedBox: Memberikan jarak vertikal antara widget.
10. Center: Menempatkan widget di tengah parent-nya.
11. GridView.count: Menampilkan widget dalam bentuk grid dengan jumlah kolom tertentu.
12. Material: Menyediakan efek material seperti bayangan dan warna latar belakang.
13. InkWell: Menangani interaksi sentuhan pada widget dan memberikan efek ripple.
14. Icon: Menampilkan ikon.
15. SnackBar: Menampilkan pesan sementara di bagian bawah layar.

## 3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi `setState()` digunakan dalam Stateful Widget untuk memberi tahu Flutter bahwa ada perubahan pada state internal widget, sehingga framework perlu membangun ulang UI dengan data terbaru. Variabel yang terpengaruh adalah semua variabel state yang didefinisikan dalam kelas State. Dalam kode saya, karena menggunakan StatelessWidget, fungsi `setState()` tidak digunakan karena tidak ada state yang berubah.

## 4. Jelaskan perbedaan antara const dengan final.
Perbedaan antara `const` dan `final`:
* `const`: Digunakan untuk mendefinisikan nilai konstan pada waktu kompilasi (compile-time constant). Nilainya harus sudah diketahui sebelum program berjalan dan bersifat immutable.
* `final`: Digunakan untuk variabel yang nilainya ditetapkan sekali dan tidak dapat diubah setelahnya. Nilainya dapat ditentukan saat runtime, bukan hanya pada waktu kompilasi.

## 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
1. Saya membuat proyek flutter bernama josh_mobile, karena saya memilih untuk menggunakan vscode, dan saya sudah menginstall semua extension yang dibutuhkan, saya membuat proyek flutter ini dengan menekan `command + shift + p`.
2. Lalu saya merapikan kode dengan memindahkan beberapa potongan kode ke dalam `menu.dart` yang saya buat.
3. Untuk membuat tiga tombol sederhana dengan ikon dan teks untuk: **Lihat Daftar Produk**, **Tambah Produk**, dan **Logout**, saya mengimplementasikan menggunakan kelas `ItemHomepage` yang mendefinisikan nama, ikon, dan warna tombol. Objek-objek ini dimasukkan ke dalam list `items`:

     ```dart
     final List<ItemHomepage> items = [
       ItemHomepage("Lihat Daftar Produk", Icons.list_alt, Colors.red),
       ItemHomepage("Tambah Produk", Icons.add, Colors.blue),
       ItemHomepage("Logout", Icons.logout, Colors.yellow),
     ];
     ```
4. Untuk mengimplementasikan warna-warna yang berbeda untuk setiap tombol, setiap item dalam list `items` memiliki properti `color` yang digunakan untuk mengatur warna latar belakang di `ItemCard`. Warna ini diatur menggunakan widget `Material`:
     ```dart
     return Material(
       color: item.color, // Warna diambil dari properti color
       borderRadius: BorderRadius.circular(12),
       child: InkWell(
         // Aksi untuk interaksi
       ),
     );
     ```
5. Untuk memunculkan snackbar dengan tulisan tertentu ketika tombol ditekan, di dalam `ItemCard`, Saya memakain `InkWell` untuk menangani aksi ketika tombol ditekan. Ketika tombol ditekan, `ScaffoldMessenger` digunakan untuk menampilkan `Snackbar` dengan pesan yang menyesuaikan nama tombol:

     ```dart
     onTap: () {
       ScaffoldMessenger.of(context)
         ..hideCurrentSnackBar()
         ..showSnackBar(
           SnackBar(content: Text("Kamu telah menekan tombol ${item.name}")),
         );
     },
     ```