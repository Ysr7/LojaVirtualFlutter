import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text("Criar Conta"),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Nome Completo"),
                  validator: (name) {
                    if (name.isEmpty) {
                      return "Campo obrigatório";
                    } else if (name.trim().split(" ").length <= 1) {
                      return "Preencha seu nome completo";
                    }
                    return null;
                  },
                  onSaved: (name) => user.name = name,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if (email.isEmpty) {
                      return "Campo obrigatório";
                    } else if (!emailValid(email)) {
                      return "E-mail inválido";
                    }
                    return null;
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Senha"),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass) {
                    if (pass.isEmpty) {
                      return "Campo obrigatório";
                    } else if (pass.length < 6) {
                      return "Senha deve ter mais de que 6 caracteres";
                    }
                    return null;
                  },
                  onSaved: (pass) => user.pass = pass,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: "Repite a Senha"),
                  autocorrect: false,
                  obscureText: true,
                  validator: (confirmPass) {
                    if (confirmPass.isEmpty) {
                      return "Campo obrigatório";
                    } else if (confirmPass.length < 6) {
                      return "Senha deve ter mais de que 6 caracteres";
                    }

                    return null;
                  },
                  onSaved: (confirmPass) =>
                      user.confirmPass = confirmPass,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    disabledColor:
                        Theme.of(context).primaryColor.withAlpha(100),
                    textColor: Colors.white,
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();

                        if (user.pass != user.confirmPass) {
                          scaffoldKey.currentState.showSnackBar(const SnackBar(
                            content: Text("Senhas não são iguais"),
                            backgroundColor: Colors.red,
                          ));
                          return;
                        }
                        context.read<UserManager>().signup(
                            user: user,
                            onSuccess: () {
                              Navigator.of(context).pop();
                            },
                            onFail: (e) {
                              scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text("Falha ao cadastrar: $e"),
                                backgroundColor: Colors.red,
                              ));
                            });
                      }
                    },
                    child: const Text(
                      "Criar Conta",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
