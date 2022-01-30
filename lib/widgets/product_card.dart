import 'package:agence/models/product_model.dart';
import 'package:agence/pages/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0.1),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
        border: Border.all(width: 0.1),
      ),
      child: TextButton(
        //necessario para que o efeito de ripple se sobreponha a imagem
        style: TextButton.styleFrom(
          primary: Colors.black87,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Product(product: product)));
        },
        child: Column(
          children: [
            //com o uso do flexible é possivel que a imagem ocupe o espaco restante
            // independente do tamanho do texto exibido na parte inferior
            Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Ink.image(image: NetworkImage(product.imageUrl))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
