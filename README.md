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

<details>
<summary><b>Tugas 8</b></summary>

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
</details>

# Tugas 9

## 1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena model mempermudah proses pemetaan data JSON ke dalam struktur data yang terorganisir, seperti objek. Hal ini memudahkan untuk pengelolaan, validasi, dan manipulasi data, serta mengurangi risiko kesalahan ketika format data berubah. Jika model tidak dibuat, kita harus menangani data secara manual, yang lebih rawan error, sulit di-maintain, dan cenderung meningkatkan kompleksitas kode.

## 2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library `http` digunakan dalam aplikasi Flutter untuk mengirim request `HTTP`, seperti `GET` dan `POST`, ke server backend. Library ini juga berfungsi untuk menerima respons dari server, termasuk mem-parsing data JSON yang dikembalikan. Jadi, `http` ini menjadi penghubung antara aplikasi Flutter dan API backend untuk mengelola pertukaran data.

## 3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` berfungsi untuk menyimpan cookie sesi pengguna, yang berguna untuk mempertahankan status autentikasi pengguna, seperti login. Cookie ini akan secara otomatis dikirim bersama setiap request HTTP yang memerlukan autentikasi. Instance CookieRequest perlu dibagikan ke seluruh komponen aplikasi agar semua fitur yang memerlukan autentikasi dapat mengakses status sesi yang sama tanpa perlu dikelola ulang di setiap bagian aplikasi.

## 4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dimulai ketika pengguna memasukkan data melalui form di Flutter. Data ini kemudian dikirim ke backend melalui request `HTTP`, misalnya `POST`. Backend (Django) akan memproses data tersebut, seperti menyimpannya ke database atau menghasilkan respons tertentu. Respons dari backend, dalam format JSON, diterima oleh Flutter, diproses, dan hasilnya ditampilkan kepada pengguna di antarmuka aplikasi flutter kita.

## 5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi meliputi login, register, dan logout. Pada proses login, pengguna memasukkan kredensial di Flutter, yang kemudian dikirim ke Django melalui request POST. Django memverifikasi kredensial dan, jika valid, mengembalikan cookie atau token sesi yang disimpan di `CookieRequest`. Token ini digunakan untuk mengakses fitur yang memerlukan autentikasi. Pada register, data akun dikirim ke Django, diverifikasi, dan disimpan ke database jika valid. Django kemudian memberikan konfirmasi ke Flutter. Pada logout, Flutter mengirimkan request ke Django untuk menghapus sesi atau token, dan Django memastikan pengguna telah keluar. Setelah logout, Flutter menghapus data sesi lokal dan mengarahkan pengguna kembali ke halaman login.

## 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Pertama, saya mengimplementasikan fitur registrasi akun. Di Django, saya membuat aplikasi bernama authentication dan menambahkan fungsi `register` di file` views.py` untuk memvalidasi input, seperti memastikan password cocok dan username belum digunakan. Setelah itu, saya konfigurasi path di `urls.py`. Di Flutter, saya membuat file register.dart yang berisi form registrasi menggunakan widget seperti TextField untuk username, password, dan konfirmasi password. Saya menggunakan package pbp_django_auth untuk menghubungkan form ini dengan endpoint Django dan menampilkan pesan kesalahan jika registrasi gagal atau mengarahkan ke halaman login jika berhasil.

2. Selanjutnya, saya membuat halaman login pada Flutter. Di Django, saya menambahkan fungsi `login` di `views.py `untuk memverifikasi kredensial pengguna, lalu saya konfigurasi path di urls.py. Di Flutter, saya membuat file login.dart yang berisi form login. Saya menggunakan CookieRequest dari pbp_django_auth untuk mengirim data login ke server Django.

3. Setelah itu, saya mengintegrasikan sistem autentikasi Django dengan Flutter. Di Django, saya mengatur middleware `CorsMiddleware` pada settings.py untuk mendukung komunikasi lintas domain. Saya juga menambahkan variabel konfigurasi seperti `CORS_ALLOW_ALL_ORIGINS` dan `ALLOWED_HOSTS`. Di Flutter, saya menambahkan `Provider` di `main.dart `untuk menyediakan objek `CookieRequest` ke seluruh aplikasi, sehingga session dapat digunakan secara global.

4. Model product di django saya mencangkup `name`, `price`, `description`, dan `quantity`. Di Flutter, saya menggunakan Quicktype untuk membuat model Dart dari data JSON yang dihasilkan oleh endpoint Django.

5. Berikutnya, saya membuat halaman daftar item. Di Flutter, saya membuat file list_item.dart dan menggunakan `FutureBuilder` untuk mengambil data dari endpoint Django menggunakan `CookieRequest.get`. Data ditampilkan menggunakan widget ListView.builder, dengan menampilkan atribut seperti name, price, description, dan quantity. Saya juga memastikan view JSON untuk memfilter item berdasarkan pengguna yang sedang login menggunakan request.user.

6. Selanjutnya, saya mengimplementasikan fitur logout. Di Django, saya menambahkan fungsi logout di views.py yang memanggil `auth_logout` untuk menghapus sesi pengguna. Di Flutter, saya mengubah apa yang terjadi ketika tombol logout ditekan. Setelah logout, pengguna diarahkan kembali ke halaman login.

7. Terakhir, saya mengintegrasikan form input di Flutter dengan Django. Di Django, saya membuat path create-flutter/ untuk menerima data dari Flutter dan menyimpannya ke database. Di Flutter, saya membuat form menggunakan pbp_django_auth untuk mengirim data form ke Django.