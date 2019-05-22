import 'package:flutter/material.dart';


//variaveis globais
var countermanual=150;

class ListaGigante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: Text("Long List"),
      ),
      body: getListView(),
    );
  }
}

List<String> getListElements() {
  // Caso queira aumentar a lista é só aumentar o "countemanual" no inicio do código.
  var items = List<String>.generate(countermanual, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  // Caso queira aumentar a lista é só aumentar o "countemanual" no inicio do código.
  var listView = ListView.builder(itemCount: countermanual, itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.keyboard_arrow_right),
      subtitle: Text("eh nozes"),
      title: Text(
        listItems[index], 
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )),
      trailing: Icon(Icons.photo_size_select_actual),
    );
  });
  return listView;
}
