
import 'package:Curriculo_App/pages/content/dropbuttom.dart';
import 'package:Curriculo_App/pages/content/lista_grande.dart';
import 'package:Curriculo_App/pages/content/notekeeper/main.dart';
import 'package:Curriculo_App/pages/content/viagemcity.dart';
import 'package:flutter/material.dart';

class BodyDart extends StatefulWidget {
  BodyDart({Key key}) : super(key: key);

  _BodyDartState createState() => _BodyDartState();
}

class _BodyDartState extends State<BodyDart> {
  //Variáveis caso necessário
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Column(
        children: <Widget>[
          Container(height: 50),
          FlutterLogo(
            size: 150,
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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
                color: Theme.of(context).primaryColor,
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

          // TEM QUE FAZER UM CALCULADORA PARA FICAR LINDÃO
          // Container(
          //   alignment: Alignment.center,
          //   child: Container(
          //     width: 250,
          //     child: FlatButton(
          //       color: Theme.of(context).primaryColor,
          //       textColor: Colors.white,
          //       child: Text("Calculadora - Seção 6, Aula 20"),
          //       onPressed: () {},
          //     ),
          //   ),
          // ),
          
          Container(
            alignment: Alignment.center,
            child: Container(
              width: 250,
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: Text("NoteKeeper App - Seção 7, aula 25"),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NoteList()),
                  );
                },
              ),
            ),
          ),
        ],
      ),      
    );
  }
}