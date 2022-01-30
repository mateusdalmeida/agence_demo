import 'package:agence/models/product_model.dart';
import 'package:agence/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(product.title),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(product.title), Text(product.description)],
      ),
    );
  }
}
