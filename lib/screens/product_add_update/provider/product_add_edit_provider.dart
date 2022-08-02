import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class ProductAddEditProvider extends ChangeNotifier {
  List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  List<String> get items => _items;

  final productNameController = TextEditingController();

  void setProductName(String name) {
    productNameController.text = name;
    notifyListeners();
  }
}
