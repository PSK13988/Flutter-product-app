import 'package:flutter/material.dart';
import 'package:reedius_test/models/product.dart';
import 'package:provider/provider.dart';
import 'package:reedius_test/screens/landing/provider/products_provider.dart';

// Reference https://www.digitalocean.com/community/tutorials/flutter-widget-communication
class QuantityWidget extends StatelessWidget {
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  const QuantityWidget({
    Key? key,
    required this.product,
    required this.onDecrement,
    required this.onIncrement,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    // final productProvider = context.read<ProductProvider>();
    return Row(
      children: [
        const Text('Quantity'),
        TextButton(onPressed: () => onDecrement(), child: Text('-')),
        Text('${context.watch<ProductProvider>().getProductQuantity(product)}'),
        TextButton(onPressed: () => onIncrement(), child: Text('+')),
      ],
    );
  }
}
