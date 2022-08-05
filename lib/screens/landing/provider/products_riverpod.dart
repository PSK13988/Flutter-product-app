import 'package:reedius_test/models/product.dart';
import 'package:reedius_test/screens/landing/provider/products_provider.dart';
import 'package:riverpod/riverpod.dart';

final productRiverpod = StateNotifierProvider<ProductRiverpod, List<Product>>(
    (ref) => ProductRiverpod());

final productCartRiverpod =
    StateNotifierProvider<ProductCartRiverpod, List<Product>>(
        (ref) => ProductCartRiverpod());

class ProductCartRiverpod extends StateNotifier<List<Product>> {
  ProductCartRiverpod() : super([]);

  void addProductToCart(Product product) {
    if (state.any((element) => element.id == product.id)) {
      state = [
        ...state,
        state[state.indexWhere((element) => element.id == product.id)] = product
      ];
    } else {
      state = [...state, product];
    }
  }
}

class ProductRiverpod extends StateNotifier<List<Product>> {
  ProductRiverpod() : super([]) {
    initData();
  }

  void initData() {
    state.addAll([
      Product(
          id: 1,
          name:
              'Ashirvaad Multigrain Atta 50kg bag Ashirvaad Multigrain Atta 50kg',
          category: 'Food',
          mrp: 1640.0,
          discount: 5,
          price: 1550,
          quantity: 2),
      Product(
          id: 2,
          name:
              'Ashirvaad Multigrain Atta 25kg bag Ashirvaad Multigrain Atta 50kg',
          category: 'Food',
          mrp: 1200.0,
          discount: 2,
          price: 1000,
          quantity: 1),
      Product(
          id: 3,
          name:
              'Ashirvaad Multigrain Atta 20kg bag Ashirvaad Multigrain Atta 50kg',
          category: 'Food',
          mrp: 1040.0,
          discount: 4,
          price: 800,
          quantity: 2),
      Product(
          id: 4,
          name:
              'Ashirvaad Multigrain Atta 10kg bag Ashirvaad Multigrain Atta 50kg',
          category: 'Food',
          mrp: 840.0,
          discount: 6,
          price: 600,
          quantity: 3),
    ]);
  }

  void addProduct(Product product) => state = [...state, product];

  void updateProduct(Product product) => state = [
        ...state,
        state[state.indexWhere((element) => element.id == product.id)] = product
      ];

  void updateProductQuantity(Product product, QuantityUpdate quantityUpdate) {
    switch (quantityUpdate) {
      case QuantityUpdate.increment:
        product.quantity = product.quantity + 1;
        break;
      case QuantityUpdate.decrement:
        if (product.quantity > 0) {
          product.quantity = product.quantity - 1;
        } else {
          product.quantity = 0;
        }
        break;
    }
    state = [
      ...state,
      state[state.indexWhere((element) => element.id == product.id)] = product
    ];
  }

  int getProductQuantity(Product product) =>
      state.firstWhere((element) => element.id == product.id).quantity;

  void removeProduct(int id) {
    state.removeWhere((element) => element.id == id);
  }
}

// class ProductProvider extends ChangeNotifier {
//   final List<Product> _products = [];

//   final List<Product> _cartProducts = [];

//   List<Product> get products => _products;

//   List<Product> get cartProducts => _cartProducts;

//   int get cartCount => _cartProducts.length;

//   ProductProvider() {
//     initData();
//     notifyListeners();
//   }

//   void initData() {
//     _products.addAll([
//       Product(
//           id: 1,
//           name:
//               'Ashirvaad Multigrain Atta 50kg bag Ashirvaad Multigrain Atta 50kg',
//           category: 'Food',
//           mrp: 1640.0,
//           discount: 5,
//           price: 1550,
//           quantity: 2),
//       Product(
//           id: 2,
//           name:
//               'Ashirvaad Multigrain Atta 25kg bag Ashirvaad Multigrain Atta 50kg',
//           category: 'Food',
//           mrp: 1200.0,
//           discount: 2,
//           price: 1000,
//           quantity: 1),
//       Product(
//           id: 3,
//           name:
//               'Ashirvaad Multigrain Atta 20kg bag Ashirvaad Multigrain Atta 50kg',
//           category: 'Food',
//           mrp: 1040.0,
//           discount: 4,
//           price: 800,
//           quantity: 2),
//       Product(
//           id: 4,
//           name:
//               'Ashirvaad Multigrain Atta 10kg bag Ashirvaad Multigrain Atta 50kg',
//           category: 'Food',
//           mrp: 840.0,
//           discount: 6,
//           price: 600,
//           quantity: 3),
//     ]);
//   }

//   void addProduct(Product product) {
//     _products.add(product);
//     notifyListeners();
//   }

//   void updateProduct(Product product) {
//     _products[_products.indexWhere((element) => element.id == product.id)] =
//         product;
//     notifyListeners();
//   }

//   void updateProductQuantity(Product product, QuantityUpdate quantityUpdate) {
//     switch (quantityUpdate) {
//       case QuantityUpdate.increment:
//         product.quantity = product.quantity + 1;
//         break;
//       case QuantityUpdate.decrement:
//         if (product.quantity > 0) {
//           product.quantity = product.quantity - 1;
//         } else {
//           product.quantity = 0;
//         }
//         break;
//     }
//     _products[_products.indexWhere((element) => element.id == product.id)] =
//         product;

//     notifyListeners();
//   }

//   int getProductQuantity(Product product) =>
//       products.firstWhere((element) => element.id == product.id).quantity;

//   void removeProduct(int id) {
//     _products.removeWhere((element) => element.id == id);
//     notifyListeners();
//   }

//   void addProductToCart(Product product) {
//     if (_cartProducts.any((element) => element.id == product.id)) {
//       _cartProducts[_cartProducts
//           .indexWhere((element) => element.id == product.id)] = product;
//     } else {
//       _cartProducts.add(product);
//     }
//     notifyListeners();
//   }
// }
