import 'package:flutter/material.dart';
import 'package:cheesecakestore_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _size = "";
  int _price = 0;
  String _description = "";
  String _notes = "";

  @override
  Widget build(BuildContext context) {
    // Mendeklarasikan request untuk autentikasi
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Tambah Produk'),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form Input Name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Produk",
                    labelText: "Nama Produk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _name = value),
                  validator: (value) => value!.isEmpty ? "Nama Produk tidak boleh kosong!" : null,
                ),
              ),

              // Form Input Size
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Size",
                    labelText: "Size",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _size = value),
                  validator: (value) => value!.isEmpty ? "Size tidak boleh kosong!" : null,
                ),
              ),

              // Form Input Price
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => _price = int.tryParse(value) ?? 0),
                  validator: (value) {
                    if (value == null || value.isEmpty) return "Price tidak boleh kosong!";
                    if (int.tryParse(value) == null) return "Price must be a number!";
                    return null;
                  },
                ),
              ),

              // Form Input Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _description = value),
                  validator: (value) => value!.isEmpty ? "Description tidak boleh kosong!" : null,
                ),
              ),

              // Form Input Notes
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Notes",
                    labelText: "Notes",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) => setState(() => _notes = value),
                  validator: (value) => value!.isEmpty ? "Notes tidak boleh kosong!" : null,
                ),
              ),

              // Tombol Submit
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        try {
                          print("Mengirim data produk...");
                          Map<String, dynamic> data = {
                            'name': _name,
                            'size': _size,
                            'price': _price.toString(),
                            'description': _description,
                            'notes': _notes,
                          };
                          print("Data yang dikirim: $data");

                          final response = await request.postJson(
                            "http://127.0.0.1:8000/authentication/create-product/",
                            data,
                          );

                          print("Response dari server: $response");

                          if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Produk berhasil disimpan!")),
                            );
                            Navigator.pushReplacementNamed(context, '/home');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Gagal menyimpan produk")),
                            );
                          }
                        } catch (e) {
                          print("Error: $e");
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Terdapat kesalahan, coba lagi!")),
                          );
                        }
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}