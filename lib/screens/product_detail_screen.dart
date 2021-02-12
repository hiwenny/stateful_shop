import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

// 1. Sample Provider 
class ProductDetailScreen extends StatelessWidget {
  static final routeName = 'product-details';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments
        as String; // Sample extracting argv from Navigator.
    final loadedProduct = Provider.of<Products>(
      context,
      // 3. Opt-out listener
      listen: false, // Sample to only build on first load, but forces no rebuilding on Products changes :(
    ).findById(productId); // Sample utility method-in-provider.
    return Scaffold(
      appBar: AppBar(),
      body: Text(loadedProduct.title),
    );
  }
}
