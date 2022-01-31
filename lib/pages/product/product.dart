import 'package:agence/models/product_model.dart';
import 'package:agence/pages/home/home.dart';
import 'package:agence/pages/product/widgets/map_view.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: MapView(),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(product.imageUrl)),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          product.description,
                          textAlign: TextAlign.justify,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: kToolbarHeight,
        child: TextButton.icon(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
          ),
          icon: const Icon(Icons.add_shopping_cart),
          label: const Text("Comprar"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return SizedBox(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      const Text(
                        "Deseja prosseguir com a compra?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            child: const Text("Não"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          ElevatedButton(
                            child: const Text("Sim"),
                            onPressed: () {
                              const snackBar = SnackBar(
                                content: Text('Compra realizada com sucesso'),
                                behavior: SnackBarBehavior.floating,
                              );

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => const Home()),
                                  (Route<dynamic> route) => false);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
