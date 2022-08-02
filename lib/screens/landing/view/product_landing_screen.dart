import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:provider/provider.dart';
import 'package:reedius_test/di/locator.dart';
import 'package:reedius_test/di/routes.dart';
import 'package:reedius_test/models/product.dart';
import 'package:reedius_test/screens/landing/provider/products_provider.dart';
import 'package:reedius_test/utils/app_constants.dart';
import 'package:reedius_test/utils/app_styles.dart';

class ProductLandingScreen extends StatelessWidget {
  const ProductLandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => createLayout(context);

  Widget createLayout(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppConstants.titleProductListing,
        ),
        actions: [
          IconBadge(
            icon: const Icon(Icons.shopping_cart),
            itemCount: context.watch<ProductProvider>().cartCount,
            badgeColor: Colors.red,
            itemColor: Colors.white,
            hideZero: true,
            onTap: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              SearchWidget(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              Expanded(
                child: CreateProductListView(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => locator<Routes>().navigateToAddProductScreen(context),
        label: const Text(AppConstants.titleFAB),
        icon: const Icon(Icons.add_circle_outline),
        backgroundColor: AppConstants.colorFAB,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 3,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          hintText: 'Search Product Images...',
        ),
      ),
    );
  }
}

class CreateProductListView extends StatelessWidget {
  const CreateProductListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Consumer<ProductProvider>(
        builder: (context, productProvider, _) => ListView.separated(
          padding: const EdgeInsets.only(bottom: 56),
          itemCount: productProvider.products.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
          itemBuilder: (BuildContext context, int index) {
            final product = productProvider.products[index];
            return Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.category,
                    size: 70,
                  ),
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _createText(text: product.name, style: AppStyles.listItemTitle),
                      Row(
                        children: [
                          _createText(text: '${AppConstants.rupeeSymbol} ${product.mrp}', style: AppStyles.listItemMrp),
                          const SizedBox(width: 15),
                          _createText(text: '${product.price}', style: AppStyles.listItemPrice),
                        ],
                      ),
                      Container(
                        color: Colors.deepOrange,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: _createText(text: '${product.discount}% Discount', style: AppStyles.listItemDiscount),
                        ),
                      ),
                    ],
                  ),
                  trailing: GestureDetector(
                    child: const Icon(Icons.more_horiz),
                    onTap: () => _showBottomSheetDialog(context, product),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () => context.read<ProductProvider>().addProductToCart(product),
                        child: const Text(AppConstants.btnAddToCart),
                      ),
                      QuantityWidget(
                        product: product,
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      );

  Widget _createText({required String text, required TextStyle style}) => Text(text, style: style);

  void _showBottomSheetDialog(BuildContext context, Product product) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
      ),
      backgroundColor: Colors.white,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              onTap: () {
                locator<Routes>().pop(context);
                locator<Routes>().navigateToAddProductScreen(context, product: product);
              },
              title: const Text(AppConstants.btnEdit),
            ),
            ListTile(
              onTap: () {
                locator<Routes>().pop(context);
                _showAlertDialog(context, product);
              },
              title: const Text(AppConstants.btnDelete),
            ),
          ],
        );
      },
    );
  }

  Future<void> _showAlertDialog(BuildContext context, Product product) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Product!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete ${product.name} from product list.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(AppConstants.btnCancel),
              onPressed: () => locator<Routes>().pop(context),
            ),
            TextButton(
              child: const Text(AppConstants.btnYes),
              onPressed: () {
                locator<Routes>().pop(context);
                context.read<ProductProvider>().removeProduct(product.id);
              },
            ),
          ],
        );
      },
    );
  }
}

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Quantity'),
        TextButton(onPressed: () => context.read<ProductProvider>().updateProductQuantity(product, QuantityUpdate.decrement), child: Text('-')),
        Text('${product.quantity}'),
        TextButton(onPressed: () => context.read<ProductProvider>().updateProductQuantity(product, QuantityUpdate.increment), child: Text('+')),
      ],
    );
  }
}
