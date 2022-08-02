import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reedius_test/models/product.dart';
import 'package:reedius_test/screens/product_add_update/provider/product_add_edit_provider.dart';
import 'package:reedius_test/utils/app_constants.dart';

class ProductAddEditScreen extends StatelessWidget {
  final Product? product;

  const ProductAddEditScreen({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) => createLayout(context);

  Widget createLayout(BuildContext context) {
    if (product == null) {
      context.read<ProductAddEditProvider>().productNameController.clear();
    } else {
      context.read<ProductAddEditProvider>().productNameController.text = product!.name;
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: product == null ? const Text(AppConstants.titleAddProduct) : const Text(AppConstants.titleEditProduct),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: context.read<ProductAddEditProvider>().productNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Product Name *',
                ),
              ),
              // DropdownButton<String>(
              //   value: 'One',
              //   icon: const Icon(Icons.arrow_downward),
              //   elevation: 16,
              //   style: const TextStyle(color: Colors.deepPurple),
              //   underline: Container(
              //     height: 2,
              //     color: Colors.deepPurpleAccent,
              //   ),
              //   onChanged: (String? newValue) {
              //     // setState(() {
              //     //   dropdownValue = newValue!;
              //     // });
              //   },
              //   items: <String>['One', 'Two', 'Free', 'Four'].map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
