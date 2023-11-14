import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/Carrito.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/pages/datos_compra_page.dart'; // Importa la nueva página

class CarritoPage extends StatefulWidget {
  final Carrito carrito;

  CarritoPage({required this.carrito});

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  void eliminarProductoDelCarrito(Product product) {
    // Filtra la lista de productos en el carrito para excluir el producto que se va a eliminar
    final nuevaLista =
        widget.carrito.productos.where((p) => p.id != product.id).toList();
    setState(() {
      widget.carrito.productos = nuevaLista;
    });
  }

  void irADatosDeCompra(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DatosCompraPage(), // Página de datos de compra
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito de Compras'),
        actions: [
          IconButton(
            icon: Icon(Icons.shop),
            onPressed: () {
              irADatosDeCompra(
                  context); // Navegar a la página de datos de compra
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: widget.carrito.productos.length,
        itemBuilder: (context, index) {
          final product = widget.carrito.productos[index];
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
                // Eliminar el producto del carrito
                eliminarProductoDelCarrito(product);
              },
              child: Text('Eliminar'),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(
                context); // Navegar de regreso a la página de productos
          },
          child: Text('Volver'),
        ),
      ),
    );
  }
}
