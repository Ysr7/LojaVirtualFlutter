import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/signup");
              },
              textColor: Colors.white,
              child: const Text(
                "Criar Conta",
                style: TextStyle(
                  fontSize: 14,
                ),
              ))
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              key: formKey,
              child: Consumer<UserManager>(builder: (_, userManager, __) {
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(hintText: "E-mail"),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      enabled: !userManager.loading,
                      validator: (email) {
                        if (!emailValid(email)) {
                          return "E-mail inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: senhaController,
                      decoration: const InputDecoration(hintText: "Senha"),
                      autocorrect: false,
                      obscureText: true,
                      enabled: !userManager.loading,
                      validator: (senha) {
                        if (senha.isEmpty || senha.length < 6) {
                          return "Senha inválida";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: const Text("Esqueci minha senha")),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        onPressed: userManager.loading
                            ? null
                            : () {
                                if (formKey.currentState.validate()) {
                                  userManager.singIn(
                                      user: User(
                                          email: emailController.text,
                                          pass: senhaController.text),
                                      onFail: (e) {
                                        scaffoldKey.currentState
                                            .showSnackBar(SnackBar(
                                          content: Text("Falha ao entrar: $e"),
                                          backgroundColor: Colors.red,
                                        ));
                                      },
                                      onSuccess: () {
                                        Navigator.of(context).pop();
                                      });
                                }
                              },
                        color: Theme.of(context).primaryColor,
                        disabledColor:
                            Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userManager.loading
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Text(
                                "Entrar",
                                style: TextStyle(fontSize: 18),
                              ),
                      ),
                    )
                  ],
                );
              })),
        ),
      ),
    );
  }
}
