import 'package:agence/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class GenericPage extends StatelessWidget {
  final IconData pageIcon;
  final String pageName;
  const GenericPage({Key? key, required this.pageName, required this.pageIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(pageName),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(pageIcon),
          Text(pageName),
        ],
      ),
    );
  }
}
