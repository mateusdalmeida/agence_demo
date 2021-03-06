import 'package:agence/pages/home/home.dart';
import 'package:agence/widgets/generic_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.alternate_email),
                          labelText: "Email",
                          border: OutlineInputBorder()),
                      controller: emailController,
                      validator: (value) {
                        if (value!.isEmpty) return "Email não digitado";
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock_outline),
                          labelText: "Senha",
                          border: OutlineInputBorder()),
                      obscureText: true,
                      controller: passwordController,
                      validator: (value) {
                        if (value!.isEmpty) return "Senha não digitada";
                      },
                    ),
                    const SizedBox(height: 16),
                    MaterialButton(
                        color: Theme.of(context).primaryColor,
                        height: 56,
                        minWidth: double.infinity,
                        textColor: Colors.white,
                        child: const Text("Entrar"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          }
                        }),
                    GestureDetector(
                      onTap: () {
                        print("esqueceu");
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("Esqueci minha senha")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("ou"),
                          ),
                          Expanded(child: Divider())
                        ],
                      ),
                    ),
                    Center(
                      child: SignInButton(
                        Buttons.Facebook,
                        text: "Entrar com Facebook",
                        onPressed: () async {
                          final LoginResult result =
                              await FacebookAuth.instance.login();

                          if (result.status == LoginStatus.success) {
                            final userData =
                                await FacebookAuth.instance.getUserData();

                            showSnackBar(
                                context: context,
                                message: 'Bem vindo ' + userData['name']);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          } else {
                            showSnackBar(
                                context: context,
                                message:
                                    "Houve um erro no login, tente novamente");

                            print(result.status);
                            print(result.message);
                          }
                        },
                      ),
                    ),
                    Center(
                      child: SignInButton(
                        Buttons.Google,
                        text: "Entrar com Google",
                        onPressed: () async {
                          try {
                            await _googleSignIn.signIn();

                            showSnackBar(
                                context: context,
                                message: 'Bem vindo ' +
                                    _googleSignIn.currentUser!.displayName!);

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Home()),
                            );
                          } catch (error) {
                            showSnackBar(
                                context: context,
                                message:
                                    "Houve um erro no login, tente novamente");

                            print(error);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
