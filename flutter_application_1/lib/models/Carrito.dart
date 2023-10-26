import 'package:flutter_application_1/models/product.dart';

class Carrito {
  List<Product> productos = [];

  void agregarProducto(Product producto) {
    productos.add(producto);
  }

  void eliminarProducto(Product producto) {
    productos.remove(producto);
  }
}
