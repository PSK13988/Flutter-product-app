import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reedius_test/di/locator.dart';
import 'package:reedius_test/screens/landing/provider/products_provider.dart';
import 'package:reedius_test/screens/landing/view/product_landing_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Product Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => locator<ProductProvider>(),
        child: locator<ProductLandingScreen>(),
      ),
    );
  }
}
