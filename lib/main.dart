import 'package:flutter/material.dart';
import 'pages/bottom/Curriculo.dart';
import 'pages/bottom/Sociais.dart';
import 'pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Rotas
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/curriculo': (context) => Curriculo(),
        '/sociais': (context) => Sociais(),
      },
      // Definição de temas
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorDark: Colors.white,
        accentColor: Colors.black,
        ),
      debugShowCheckedModeBanner: false,
      title: 'App de Estudos',
    );
  }
}
