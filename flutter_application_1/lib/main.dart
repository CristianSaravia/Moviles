import 'package:flutter/material.dart';
import 'product_card.dart'; // Asegúrate de importar el archivo adecuado.

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Productos'),
        ),
        body: ProductList(),
      ),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ejemplo de uso del componente ProductCard
    return ListView(
      children: [
        ProductCard(
          productName: 'Producto 1',
          price: 19.99,
          description: 'Descripción del producto 1',
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1822/1822045.png',
        ),
        ProductCard(
          productName: 'Producto 2',
          price: 29.99,
          imageUrl: 'https://cdn-icons-png.flaticon.com/512/1822/1822045.png',
        ),
      ],
    );
  }
}
