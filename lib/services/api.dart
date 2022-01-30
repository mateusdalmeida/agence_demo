Future<List> getData() async {
  print("ops");
  await Future.delayed(const Duration(seconds: 2));
  return List.generate(
      15,
      (index) => {
            "title": "produto",
            "image":
                "https://www.agence.com.br/wp-content/themes/dt-the7/inc/presets/images/agence/agence.png",
            "description":
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
          });
}
