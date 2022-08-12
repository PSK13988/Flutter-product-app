import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reedius_test/di/locator.dart';
import 'package:reedius_test/models/product.dart';
import 'package:reedius_test/screens/product_add_update/provider/product_add_edit_provider.dart';
import 'package:reedius_test/screens/product_add_update/view/product_add_edit_screen.dart';

abstract class Routes {
  void navigateToAddProductScreen(BuildContext context, {Product? product});
  void pop(BuildContext context);
}

class RoutesImpl extends Routes {
  @override
  void navigateToAddProductScreen(BuildContext context, {Product? product}) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider(
            create: (_) => locator<ProductAddEditProvider>(),
            child: ProductAddEditScreen(product: product),
          ),
        ),
      );

  @override
  void pop(BuildContext context) => Navigator.pop(context);
}
