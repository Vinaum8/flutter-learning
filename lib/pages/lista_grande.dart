import 'package:flutter/material.dart';

class ListaGigante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Long List"),
      ),
      body: getListView(),
    );
  }
}

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  var listView = ListView.builder(itemBuilder: (context, index) {
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
