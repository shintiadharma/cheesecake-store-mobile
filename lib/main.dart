import 'package:flutter/material.dart';
import 'package:cheesecakestore_mobile/screens/menu.dart';
import 'package:cheesecakestore_mobile/screens/productentry_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: {
        '/home': (context) => MyHomePage(),
        '/add-item': (context) => ProductEntryFormPage(),
      },
    );
  }
}