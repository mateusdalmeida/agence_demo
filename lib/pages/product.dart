import 'package:agence/models/product_model.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final ProductModel product;
  const Product({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(product.title);
  }
}
