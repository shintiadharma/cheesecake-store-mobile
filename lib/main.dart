import 'package:flutter/material.dart';
import 'package:cheesecakestore_mobile/screens/menu.dart';
import 'package:cheesecakestore_mobile/screens/productentry_form.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:cheesecakestore_mobile/screens/login.dart';
import 'package:cheesecakestore_mobile/screens/list_productentry.dart';
import 'package:cheesecakestore_mobile/screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Cheesecake Store',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Color(0xFFF48FB1), 
          scaffoldBackgroundColor: Colors.pink[50],
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Colors.pink, 
            secondary: Colors.pink, 
          ),
        ),
        home: const LoginPage(),
        routes: {
          '/home': (context) => MyHomePage(),
          '/add-item': (context) => ProductEntryFormPage(),
          '/product-list': (context) => ProductListPage(),
        },
      ),
    );
  }
}