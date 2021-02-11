import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';

import '../providers/products_provider.dart';

import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  static final routeName = 'products-overview';

  @override
  Widget build(BuildContext context) {
    final productsData =
        Provider.of<Products>(context); // subscribe to <Products> changes.
    final loadedProducts = productsData.items;
    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductsGrid(
        loadedProducts: loadedProducts,
      ),
    );
    return scaffold;
  }
}

// Extracted products grid, which is a configured GridView.
class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    Key key,
    @required this.loadedProducts,
  }) : super(key: key);

  final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      // The builder method provides virtualization for free, so longer lists are optimised.
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      itemBuilder: (ctx, i) => ProductItem(
        // defines the item structure
        id: loadedProducts[i].id, title: loadedProducts[i].title,
        imageUrl: loadedProducts[i].imageUrl,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // defines the grid structure
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
