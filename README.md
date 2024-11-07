# Cheesecake Store Mobile

<details>
<summary><b>Tugas 7</b></summary>

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
1. Saya membuat proyek flutter bernama cheesecake-store-mobile, karena saya memilih untuk menggunakan vscode, dan saya sudah menginstall semua extension yang dibutuhkan, saya membuat proyek flutter ini dengan menekan `command + shift + p`.
2. Lalu saya merapikan kode dengan memindahkan beberapa potongan kode ke dalam `menu.dart` yang saya buat.
3. Untuk membuat tiga tombol sederhana dengan ikon dan teks untuk: **Lihat Daftar Produk**, **Tambah Produk**, dan **Logout**, saya mengimplementasikan menggunakan kelas `ItemHomepage` yang mendefinisikan nama, ikon, dan warna tombol. Objek-objek ini dimasukkan ke dalam list `items`:

     ```dart
     final List<ItemHomepage> items = [
       ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart, Colors.pink[300]!, "Kamu telah menekan tombol Lihat Daftar Produk"),
       ItemHomepage("Tambah Produk", Icons.add, Colors.pink[200]!, "Kamu telah menekan tombol Tambah Produk"),
       ItemHomepage("Logout", Icons.logout, Colors.pink[100]!, "Kamu telah menekan tombol Logout"),
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
</details>

# Tugas 8
## 1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` digunakan di Flutter untuk mendefinisikan objek-objek yang bersifat immutable (tidak dapat diubah) dan membuat mereka menjadi compile-time constants. Artinya, nilai-nilai ini ditentukan saat kompilasi, bukan saat runtime. Ini menghemat memori karena Flutter tidak perlu membuat ulang objek tersebut setiap kali widget di-render ulang. Keuntungan menggunakan `const` adalah peningkatan performa karena objek `const` hanya dibuat sekali. Sebaiknya kita menggunakan `const` pada widget yang sifatnya statis dan tidak akan berubah (misalnya teks, ikon, atau padding yang tidak berubah sepanjang siklus aplikasi), dan juga untuk elemen-elemen yang sering digunakan dalam berbagai tempat dengan nilai yang sama (misalnya warna atau margin yang tetap). Namun, hindari `const` jika widget tersebut akan berubah-ubah berdasarkan state atau kondisi tertentu.

## 2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` adalah widget layout di Flutter yang memungkinkan untuk menempatkan widget-widget lain di dalamnya dalam bentuk baris (vertikal) atau kolom (horizontal).
* `Column`: Menyusun widget secara vertikal (dari atas ke bawah). Biasanya digunakan untuk menumpuk elemen dalam satu kolom di layar.
* `Row`: Menyusun widget secara horizontal (dari kiri ke kanan). Digunakan untuk menempatkan elemen-elemen secara berdampingan.

Contoh implementasi Column:
```dart
Column(
  children: [
    Text("Item 1"),
    Text("Item 2"),
  ],
);
```
Contoh implementasi Row:
```dart
Row(
  children: [
    Icon(Icons.star),
    Text("Rating"),
  ],
);
```

## 3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Elemen input yang digunakan pada halaman form:
* `TextFormField`: Untuk mengisi data teks pada formulir seperti name, size, prize, description, dan note.

Elemen input Flutter lain yang tidak digunakan pada tugas ini:
* `Checkbox`: Untuk memilih antara dua opsi (on/off).
* `Switch`: Untuk opsi aktif/non-aktif dalam bentuk saklar.
* `Slider`: Untuk memilih nilai dalam rentang tertentu.
* `DropdownButton`: Untuk memilih satu dari beberapa opsi dalam bentuk dropdown.
* `DatePicker/TimePicker`: Untuk memilih tanggal atau waktu, yang biasanya digunakan pada aplikasi dengan data waktu.
* `Radio`: Untuk memilih salah satu dari beberapa opsi.

## 4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema secara konsisten, Flutter menyediakan ThemeData pada MaterialApp. Dengan ThemeData, kita bisa mendefinisikan warna, font, dan gaya yang akan diterapkan di seluruh aplikasi. Pada aplikasi yang saya buat, saya menggunakan ThemeData untuk mengatur skema warna utama agar seragam dan konsisten di setiap halaman. Ini implementasinya dalam kode saya (pada `main.dart`):

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cheesecake Store',
      theme: ThemeData(
        primaryColor: Color(0xFFF48FB1), 
        scaffoldBackgroundColor: Colors.pink[50],
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.pink, 
          secondary: Colors.pink, 
        ),
      ),
      home: MyHomePage(),
    );
  }
```
## 5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menangani navigasi dalam aplikasi Flutter dengan banyak halaman, saya menggunakan beberapa pendekatan. Salah satu cara dasarnya adalah menggunakan Navigator dan MaterialPageRoute di mana `Navigator.push()` digunakan untuk membuka halaman baru, sementara `Navigator.pop()`digunakan untuk kembali ke halaman sebelumnya. Saya juga menggunakan `Navigator.pushReplacement()` menggantikan halaman saat ini dengan halaman baru.