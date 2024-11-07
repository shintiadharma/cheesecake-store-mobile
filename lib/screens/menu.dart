import 'package:flutter/material.dart';
import 'package:cheesecakestore_mobile/widgets/left_drawer.dart';
import 'package:cheesecakestore_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306245655';
  final String name = 'Shintia Dharma Shanty';
  final String className = 'PBP F';

  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart, Colors.pink[300]!, "Kamu telah menekan tombol Lihat Daftar Produk"),
    ItemHomepage("Tambah Produk", Icons.add, Colors.pink[200]!, "Kamu telah menekan tombol Tambah Produk"),
    ItemHomepage("Logout", Icons.logout, Colors.pink[100]!, "Kamu telah menekan tombol Logout"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cheesecake Store',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pink, // Sesuaikan warna AppBar
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0), // Set padding dari halaman
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, // Posisikan konten di tengah secara vertikal
              children: <Widget>[
                // Info cards for NPM, Name, and Class
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoCard(title: 'NPM', content: npm),
                    InfoCard(title: 'Nama', content: name),
                    InfoCard(title: 'Kelas', content: className),
                  ],
                ),
                const SizedBox(height: 16.0), // Spacing between info cards and welcome text

                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Text(
                    'Welcome to Cheesecake Store!', // Tambahkan teks selamat datang
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ),

                const SizedBox(height: 16.0), // Spacing between welcome text and grid

                // Grid layout
                Center(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10), // Kurangi padding
                    crossAxisSpacing: 5, // Kurangi jarak horizontal antar card
                    mainAxisSpacing: 5, // Kurangi jarak vertikal antar card
                    crossAxisCount: 3, // Jumlah kolom dalam grid
                    shrinkWrap: true,
                    children: items.map((ItemHomepage item) {
                      return ItemCard(item); // Menggunakan ItemCard untuk menampilkan item
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}