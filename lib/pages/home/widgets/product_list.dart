import 'package:agence/models/product_model.dart';
import 'package:agence/services/api.dart';
import 'package:agence/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductList extends StatefulWidget {
  final List<ProductModel> products;
  const ProductList({Key? key, required this.products}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final _scrollController = ScrollController();
  bool _isLoading = false;
  List<ProductModel> productList = [];

  @override
  void initState() {
    productList += widget.products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scrollController.addListener(() async {
      if (!_isLoading) {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          setState(() {
            _isLoading = true;
          });

          List data = await getData();
          productList += data
              .map((item) => ProductModel.fromJson(item))
              .toList()
              .cast<ProductModel>();

          setState(() {
            _isLoading = false;
          });
        }
      }
    });
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        padding: const EdgeInsets.all(12),
        controller: _scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: productList.length,
        itemBuilder: (context, index) =>
            ProductCard(product: productList[index]),
      ),
      bottomNavigationBar: Visibility(
          visible: _isLoading, child: const LinearProgressIndicator()),
    );
  }
}
