import 'dart:ui';

class AppConstants {
  static final AppConstants _singleton = AppConstants._internal();

  factory AppConstants() => _singleton;

  AppConstants._internal();

  // Symbols

  static const String rupeeSymbol = '\u{20B9}';

  // Colors
  static const Color colorMrp = Color(0xFF868686);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorPrice = Color(0xFF202020);
  static const Color colorFAB = Color(0xFF03A9F4);

  // Static label

  static const String titleProductListing = 'Product Listing';
  static const String titleAddProduct = 'Add Product';
  static const String titleEditProduct = 'Edit Product';
  static const String titleShopName = 'Shop Name';
  static const String titleFAB = 'Add Products';

  static const String btnDelete = 'Delete';
  static const String btnEdit = 'Edit';
  static const String btnCancel = 'Cancel';
  static const String btnYes = 'Yes';
  static const String btnAddToCart = 'Add to Cart';
}
