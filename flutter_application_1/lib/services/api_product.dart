import 'dart:convert'; // Asegúrate de importar dart:convert para usar json.decode
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/models/product.dart'; // Ajusta la ruta de importación a tu proyecto

Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse('https://shop-api-roan.vercel.app/product'));

  if (response.statusCode == 200) {
    // Decodifica la respuesta JSON y crea una lista de productos
    final List<dynamic> data = json.decode(response.body);
    List<Product> products = data.map((productData) {
      return Product.fromJson(productData); // Utiliza el constructor fromJson
    }).toList();

    return products;
  } else {
    throw Exception('Error al cargar productos');
  }
}
