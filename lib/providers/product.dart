import 'package:flutter/foundation.dart';

// 2. Sample nested Provider
class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  bool isFavourite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavourite = false,
  });

  void toggleFavourites() {
    isFavourite = !isFavourite;
    notifyListeners(); // setState eq
  }

}
