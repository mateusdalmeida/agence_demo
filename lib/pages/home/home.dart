import 'package:agence/models/product_model.dart';
import 'package:agence/pages/home/widgets/product_list.dart';
import 'package:agence/services/api.dart';
import 'package:agence/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Home"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            List<ProductModel> _products = (snapshot.data! as List)
                .map((item) => ProductModel.fromJson(item))
                .toList()
                .cast<ProductModel>();
            return ProductList(products: _products);
          }
        },
      ),
    );
  }
}
