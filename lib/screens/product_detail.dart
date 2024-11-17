import 'package:flutter/material.dart';
import 'package:cheesecakestore_mobile/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductEntry product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${product.fields.name}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text("Size: ${product.fields.size}"),
            const SizedBox(height: 10),
            Text("Price: Rp ${product.fields.price}"),
            const SizedBox(height: 10),
            Text("Description: ${product.fields.description}"),
            const SizedBox(height: 10),
            Text("Notes: ${product.fields.notes}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Back to List"),
            ),
          ],
        ),
      ),
    );
  }
}