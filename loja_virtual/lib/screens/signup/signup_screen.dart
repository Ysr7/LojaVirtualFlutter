import 'package:flutter/material.dart';
import 'package:loja_virtual/helpers/validators.dart';

class SignupScreen extends StatelessWidget {

  final TextEditingController nomeCompletoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text("Criar Conta"),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "Nome Completo"),
                controller: nomeCompletoController,
              ),
              const SizedBox(
                height: 16,
              ),
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
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Senha"),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Repite a Senha"),
                autocorrect: false,
                obscureText: true,
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                  textColor: Colors.white,
                  onPressed: () {},
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
    );
  }
}
