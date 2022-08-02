import 'package:flutter/material.dart';
import 'package:reedius_test/utils/app_constants.dart';

class AppStyles {
  static final AppStyles _singleton = AppStyles._internal();

  factory AppStyles() => _singleton;

  AppStyles._internal();

  static const TextStyle listItemTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle listItemMrp = TextStyle(
    color: AppConstants.colorMrp,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle listItemPrice = TextStyle(
    color: AppConstants.colorPrice,
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle listItemDiscount = TextStyle(
    color: AppConstants.colorWhite,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
}
