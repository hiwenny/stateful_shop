import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static final routeName = 'product-details';

  @override
  Widget build(BuildContext context) {
    ModalRoute.of(context).settings.arguments as String; // Sample extracting argv from Navigator.
    return Scaffold(
      appBar: AppBar(),
    );
  }
}