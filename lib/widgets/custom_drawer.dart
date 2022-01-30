import 'package:agence/pages/generic_page.dart';
import 'package:agence/pages/home/home.dart';
import 'package:agence/pages/login.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Home"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: const Text("Perfil"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GenericPage(
                                  pageIcon: Icons.person,
                                  pageName: "Perfil",
                                )),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.shopping_cart),
                    title: const Text("Meus Produtos"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GenericPage(
                                  pageIcon: Icons.shopping_cart,
                                  pageName: "Meus Produtos",
                                )),
                      );
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Configurações"),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const GenericPage(
                                  pageIcon: Icons.settings,
                                  pageName: "Configurações",
                                )),
                      );
                    },
                  ),
                ],
              ),
            ),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: <Widget>[
                    const Divider(height: 0),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text("Sair"),
                      onTap: () async {
                        print("logout");
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                            (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
