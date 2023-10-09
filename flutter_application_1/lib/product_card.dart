import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String productName;
  final double price;
  final String? description;
  final String? imageUrl;

  ProductCard({
    required this.productName,
    required this.price,
    this.description,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          if (imageUrl != null) Image.network(imageUrl!),
          ListTile(
            title: Text(productName),
            subtitle: Text(description ?? ''),
            trailing: Text('\$${price.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }
}
