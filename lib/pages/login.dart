import 'package:agence/pages/home.dart';
import 'package:flutter/material.dart';

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
                        child: Center(child: Text("Esqueci minha senha")),
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
