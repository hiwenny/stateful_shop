import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';

import '../widgets/product_item.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  static final routeName = 'products-overview';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // 7. Sample toggling in local state with Provider getter methods.
  bool _showOnlyFavourites = false;
  @override
  Widget build(BuildContext context) {
    // // 6. Example global toggle
    // final productsData = Provider.of<Products>(context, listen: false); // So this whole screen doesn't rerender, we are only interested in accessing the method to update showFavourites.

    var scaffold = Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favs'), value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
            icon: Icon(
              Icons.more_vert,
            ),
            onSelected: (FilterOptions selectedValue) {
              // 7. Sample toggling in local state with Provider getter methods.
              // ! Important ! Must wrap in setState() to trigger rebuild.
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  // 7. Sample toggling in local state with Provider getter methods.
                  _showOnlyFavourites = true;
                  // // 6. Example global toggle
                  //     productsData.showFavouritesOnly();
                } else {
                  // 7. Sample toggling in local state with Provider getter methods.
                  _showOnlyFavourites = false;
                  // // 6. Example global toggle
                  //     productsData.showAll();
                }
              });
            },
          )
        ],
      ),
      body: ProductsGrid(_showOnlyFavourites),
    );
    return scaffold;
  }
}

// Extracted products grid, which is a configured GridView.
class ProductsGrid extends StatelessWidget {
  // 7. Sample toggling in local state with Provider getter methods.
  final bool showFavourite;

  ProductsGrid(this.showFavourite);

  @override
  Widget build(BuildContext context) {
    final productsData =
        Provider.of<Products>(context); // subscribe to <Products> changes.
    // 7. Sample toggling in local state with Provider getter methods.
    final loadedProducts =
        showFavourite ? productsData.favouriteItems : productsData.items;
    return GridView.builder(
      // The builder method provides virtualization for free, so longer lists are optimised.
      padding: const EdgeInsets.all(10.0),
      itemCount: loadedProducts.length,
      // 2. Sample nested Provider
      // 4. Sample Provider with rebuild on value change.
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // Now list of products are available in the context, and ProductItem can just access it.
        // Important! <Product> must have ChangeNotifier mixin because this context targets <Product> directly by returning List<Products>[i].
        value: loadedProducts[i],
        child: ProductItem(
            // Now we can skip passing the product specifics and just pull it out of <Product> provider inside ProductItem instead.

            // id: loadedProducts[i].id, title: loadedProducts[i].title,
            // imageUrl: loadedProducts[i].imageUrl,
            ),
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
