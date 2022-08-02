import 'package:flutter/material.dart';
import 'package:reedius_test/models/product.dart';
import 'package:provider/provider.dart';
import 'package:reedius_test/screens/landing/provider/products_provider.dart';

class QuantityWidget extends StatelessWidget {
  final Function onDecrement;
  final Function onIncrement;
  final int quantity;

  const QuantityWidget({
    Key? key,
    required this.product,
    required this.onDecrement,
    required this.onIncrement,
    required this.quantity,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final productProvider = context.read<ProductProvider>();
    return Row(
      children: [
        const Text('Quantity'),
        TextButton(onPressed: () => onDecrement, child: Text('-')),
        Text('${context.watch<ProductProvider>().getProductQuantity(product)}'),
        TextButton(onPressed: () => onIncrement, child: Text('+')),
      ],
    );
  }
}
