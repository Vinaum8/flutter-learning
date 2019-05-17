import 'package:flutter/material.dart';

class DropButtom extends StatefulWidget {
  @override
  _DropButtomState createState() => _DropButtomState();
}

class _DropButtomState extends State<DropButtom> {
  var _itenss = ['Um', 'Dois', 'Três', "Outros"];
  var _currentItemSelected = 'Um';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Buttom"),
        backgroundColor: Colors.red,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(height: 50),
            FlutterLogo(
              size: 150,
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Text("Aprendizado de Dropdown",
                textAlign: TextAlign.center,
                style: TextStyle(
                fontSize: 30.0,
            ),
            ),
            ),
            DropdownButton<String>(
              items: _itenss.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected) {
                _onDropDownItemSelected(newValueSelected);
              },
              value: _currentItemSelected,
            ),
          ],
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }
}
