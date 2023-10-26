import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Carrito de Compras'),
        ),
        body: ProductoPage(), // Utiliza el widget ProductoPage aquí
      ),
    );
  }
}
