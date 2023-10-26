import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/services/api_product.dart';
import 'package:flutter_application_1/models/Carrito.dart';
import 'package:flutter_application_1/pages/carrito_page.dart';

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  Carrito carrito =
      Carrito(); // Instancia de la clase Carrito para gestionar los productos agregados

  void verCarrito(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CarritoPage(carrito: carrito), // Pasa la instancia del carrito
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              verCarrito(context);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final products = snapshot.data;

            return ListView.builder(
              itemCount: products?.length ?? 0,
              itemBuilder: (context, index) {
                final product = products?[index];
                if (product != null) {
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.description),
                        Text('\$${product.price.toStringAsFixed(2)}'),
                        Text('Stock: ${product.stock}'),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        // Agregar el producto al carrito
                        carrito.agregarProducto(product);
                      },
                      child: Text('Agregar'),
                    ),
                  );
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }
}
