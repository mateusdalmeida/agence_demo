import 'package:agence/pages/generic_page.dart';
import 'package:agence/pages/home/home.dart';
import 'package:agence/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

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
                    leading: const Icon(Icons.home),
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
                        bool isgoogleSignedIn =
                            await _googleSignIn.isSignedIn();

                        final AccessToken? facebookAccessToken =
                            await FacebookAuth.instance.accessToken;

                        if (facebookAccessToken != null) {
                          await FacebookAuth.instance.logOut();
                        }

                        if (isgoogleSignedIn) {
                          _googleSignIn.signOut();
                        }

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
