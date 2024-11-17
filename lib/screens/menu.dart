import 'package:flutter/material.dart';
import 'package:cheesecakestore_mobile/widgets/left_drawer.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306245655';
  final String name = 'Shintia Dharma Shanty';
  final String className = 'PBP F';

  MyHomePage({super.key});

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.shopping_cart, Colors.pink[300]!, '/product-list'),
    ItemHomepage("Tambah Produk", Icons.add, Colors.pink[200]!, '/add-item'),
    ItemHomepage("Logout", Icons.logout, Colors.pink[100]!, '/'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cheesecake Store',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Membuat NPM, Name, dan Class dalam satu baris
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: infoCard('NPM', npm)),
                    const SizedBox(width: 10),
                    Expanded(child: infoCard('Name', name)),
                    const SizedBox(width: 10),
                    Expanded(child: infoCard('Class', className)),
                  ],
                ),
                const SizedBox(height: 40),

                // Teks Selamat Datang
                const Text(
                  'Welcome to Cheesecake Store!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 40),

                // Grid Menu
                Center(
                  child: GridView.count(
                    primary: false,
                    padding: const EdgeInsets.all(10),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((item) => menuCard(context, item)).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membuat Card Info yang lebih menarik
  Widget infoCard(String title, String content) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat Card Menu
  Widget menuCard(BuildContext context, ItemHomepage item) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, item.route);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, color: Colors.white, size: 32),
            const SizedBox(height: 10),
            Text(
              item.title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemHomepage {
  final String title;
  final IconData icon;
  final Color color;
  final String route;

  ItemHomepage(this.title, this.icon, this.color, this.route);
}