import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/login/login_screen.dart';

void main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja Virtual',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 4, 125, 141),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0)),
          home: LoginScreen(),
    );
  }
}
