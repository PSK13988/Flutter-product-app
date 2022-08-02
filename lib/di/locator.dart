import 'package:get_it/get_it.dart';
import 'package:reedius_test/di/routes.dart';
import 'package:reedius_test/screens/landing/provider/products_provider.dart';
import 'package:reedius_test/screens/landing/view/product_landing_screen.dart';
import 'package:reedius_test/screens/product_add_update/provider/product_add_edit_provider.dart';
import 'package:reedius_test/utils/app_constants.dart';
import 'package:reedius_test/utils/app_styles.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // Register Singleton
  locator.registerLazySingleton<ProductProvider>(() => ProductProvider());
  locator.registerLazySingleton<ProductAddEditProvider>(
      () => ProductAddEditProvider());
  locator.registerLazySingleton<AppStyles>(() => AppStyles());
  locator.registerLazySingleton<AppConstants>(() => AppConstants());
  locator.registerLazySingleton<Routes>(() => Routes());

  // Register factories
  locator.registerFactory<ProductLandingScreen>(
      () => const ProductLandingScreen());
}
