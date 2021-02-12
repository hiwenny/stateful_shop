import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stateful_shop/providers/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    // 2. Sample nested Provider
    final product = Provider.of<Product>(context,
        listen: false); // only renders once. See 5. Provider access outside build method
    return ClipRRect(
      // Styling widget to wrap a rectangle and reshape it into rounded corners.
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetailScreen.routeName,
                arguments: product.id);
            // .pushNamed(ProductDetailScreen.routeName, arguments: id);
          },
          child: Image.network(product.imageUrl, fit: BoxFit.cover),
          // child: Image.network(imageUrl, fit: BoxFit.cover),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          // 5. Provider access outside build method
          leading: Consumer<Product>(
            builder: (ctx, product, child) => IconButton(
              icon: product.isFavourite
                  ? Icon(Icons.favorite)
                  : Icon(Icons.favorite_border),
              onPressed: () {
                product.toggleFavourites();
              },
              color: Theme.of(context).accentColor,
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            product.title,
            // title,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
