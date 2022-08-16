import 'package:get_it/get_it.dart';
import 'package:reedius_test/di/routes.dart';
import 'package:reedius_test/models/product.dart';
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
  locator.registerFactory<Routes>(
    () => RoutesImpl(
      data1: 1,
      data2: 'data2',
      product: Product(
          id: 5,
          name:
              'Ashirvaad Multigrain Atta 10kg bag Ashirvaad Multigrain Atta 50kg',
          category: 'Food',
          mrp: 840.0,
          discount: 6,
          price: 600,
          quantity: 3),
    ),
  );

  // Register factories
  locator.registerFactory<ProductLandingScreen>(
      () => const ProductLandingScreen());
}
