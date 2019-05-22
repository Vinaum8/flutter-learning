import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'body.dart';

class Home extends StatelessWidget {
//Variáveis, caso necessário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Meu conhecimento com Flutter "),
      ),
      body: BodyDart(),
    );
}
}

