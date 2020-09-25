import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entrar"),
        centerTitle: true,
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
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email) {
                    if (!emailValid(email)) {
                      return "E-mail inválido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: senhaController,
                  decoration: const InputDecoration(hintText: "Senha"),
                  autocorrect: false,
                  obscureText: true,
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
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        emailController.text;
                        senhaController.text;
                      }
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text(
                      "Entrar",
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
