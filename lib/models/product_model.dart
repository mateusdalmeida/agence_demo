class ProductModel {
  final String title;
  final String imageUrl;
  final String description;

  ProductModel(
      {required this.title, required this.imageUrl, required this.description});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      imageUrl: json['image'],
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
    );
  }
}
