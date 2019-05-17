import 'package:flutter/material.dart';

class ViagemCity extends StatefulWidget {
  @override
  _ViagemCityState createState() => _ViagemCityState();
}

class _ViagemCityState extends State<ViagemCity> {
  // Variáveis
  String nomedacidade = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Aula de Statefull Widget"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextField(
                  style: TextStyle(fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      labelText: "Digite a Cidade:",
                      icon: Icon(Icons.edit_location)),
                  cursorColor: Colors.red,
                  autofocus: false, //Mudar para True caso necessário
                  keyboardType: TextInputType.text,
                  onSubmitted: (String entradaUser) {
                    nomedacidade = entradaUser;
                  }),
              Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  "Legal! Você gostaria de conhecer:",
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
              Text(
                "$nomedacidade",
                style: TextStyle(
                  fontSize: 60.0,
                ),
              ),
            ],
          )),
    );
  }
}
