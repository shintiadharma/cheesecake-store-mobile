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
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Produk',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildTextFormField(
                        label: 'Nama Produk',
                        icon: Icons.cake,
                        onChanged: (value) => setState(() => _name = value),
                      ),
                      const SizedBox(height: 16),
                      buildTextFormField(
                        label: 'Size',
                        icon: Icons.straighten,
                        onChanged: (value) => setState(() => _size = value),
                      ),
                      const SizedBox(height: 16),
                      buildTextFormField(
                        label: 'Price',
                        icon: Icons.attach_money,
                        keyboardType: TextInputType.number,
                        onChanged: (value) => setState(() => _price = int.tryParse(value) ?? 0),
                      ),
                      const SizedBox(height: 16),
                      buildTextFormField(
                        label: 'Description',
                        icon: Icons.description,
                        onChanged: (value) => setState(() => _description = value),
                      ),
                      const SizedBox(height: 16),
                      buildTextFormField(
                        label: 'Notes',
                        icon: Icons.note,
                        onChanged: (value) => setState(() => _notes = value),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            Map<String, dynamic> data = {
                              'name': _name,
                              'size': _size,
                              'price': _price.toString(),
                              'description': _description,
                              'notes': _notes,
                            };
                            
                            try {
                              final response = await request.postJson(
                                "http://127.0.0.1:8000/create-flutter/",
                                jsonEncode(data),
                              );

                              if (response.containsKey('status') && response['status'] == 'success') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Produk berhasil disimpan!")),
                                );
                                Navigator.pushReplacementNamed(context, '/home');
                              } else {
                                print('Response: $response');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(response['message'] ?? "Gagal menyimpan produk")),
                                );
                              }
                            } catch (e) {
                              print('Error: $e');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Terjadi kesalahan saat menyimpan produk")),
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required String label,
    required IconData icon,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.pink),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$label tidak boleh kosong';
          }
          return null;
        },
      ),
    );
  }
}