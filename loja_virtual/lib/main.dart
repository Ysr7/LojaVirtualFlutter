import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:loja_virtual/screens/base/base_sreeen.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';
import 'package:loja_virtual/screens/signup/signup_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      lazy: false,
      child: MaterialApp(
        title: 'Loja Virtual',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0)),
        initialRoute: "/login",
        onGenerateRoute: (settings) {
          switch (settings.name) {
             case "/login":
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case "/signup":
              return MaterialPageRoute(builder: (_) => SignupScreen());
            case "/base":
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
