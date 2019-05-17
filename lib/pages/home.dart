import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'content/dropbuttom.dart';
import 'content/lista_grande.dart';
import 'content/viagemcity.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meu conhecimento com Flutter "),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: <Widget>[
          Container(height: 50),
          FlutterLogo(
            size: 150,
            colors: Colors.red,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Lista Gigante - Seção 4, Aula 14"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ListaGigante()),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Statefull Widgets - Seção 5, Aula 18"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => ViagemCity()),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("DropdownButtom - Seção 5, Aula 19"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => DropButtom()),
                  );
                },
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Calculadora - Seção 6, Aula 20"),
                onPressed: () {},
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text("Outras Parada"),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Currículo"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Cursos"),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Social"),
            backgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
