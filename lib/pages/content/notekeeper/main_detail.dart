import 'package:flutter/material.dart';
import 'package:Curriculo_App/pages/content/notekeeper/models/note.dart';
import 'package:Curriculo_App/pages/content/notekeeper/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget {
  final String appBarTitle;
  final Note note;

  NoteDetail(this.note, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return NoteDetailState(this.note, this.appBarTitle);
  }
}

class NoteDetailState extends State<NoteDetail> {

  static var _priorities = ['High', 'Low'];

  DatabaseHelper helper = DatabaseHelper();

  String appBarTitle;
  Note note;

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  NoteDetailState(this.note, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    titleController.text = note.title;
    descriptionController.text = note.description;

    return WillPopScope(
      onWillPop: (){
        moveToLastScreen();
      },
    child: Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            moveToLastScreen();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Text("Priority",
            style: textStyle,
            ),
            // Primeiro elemento
            ListTile(
              title: DropdownButton(
                items: _priorities.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem));
                }).toList(),

                value: getPriorityAsString(note.priority),

                style: textStyle,
                onChanged: (valueSelectedByUser) {
                  setState(() {
                    debugPrint('User Selected $valueSelectedByUser');
                    updatePriorityAsInt(valueSelectedByUser);
                  });
                },
              ),
            ),

            // SEGUNDO ELEMENTO
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                style: textStyle,
                controller: titleController,
                onChanged: (value) {
                  debugPrint('Mudaram o texto aqui ohhhhhh');
                  updateTitle();
                },
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),

            // TERCEIRO ELEMENTO
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                style: textStyle,
                controller: descriptionController,
                onChanged: (value) {
                  debugPrint('Mudaram o texto aqui ohhhhhh');
                  updateDescription();
                },
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )),
              ),
            ),

            // QUARTO ELEMENTO
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        "Save",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('Save Button Clicked');
                          _save();
                        });
                      },
                    ),
                  ),
                  Container(width: 5.0),
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).primaryColorDark,
                      child: Text(
                        "Delete",
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint('Delete Button Clicked');
                          _delete();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  // converter uma string priority em um form depois do integer ser salvo na base de dados
  void updatePriorityAsInt(String value){
    switch (value){
      case 'High':
      note.priority = 1;
      break;
      case 'Low':
      note.priority = 2;
      break;
    }
  }

  String getPriorityAsString(int value){
    String priority;
    switch (value){
      case 1:
        priority = _priorities[0]; //high
        break;
      case 2:
      priority = _priorities[1]; //low 
        break;
    }
    return priority;
  }

  void updateTitle(){
    note.title = titleController.text;
  }

  void updateDescription(){
    note.description = descriptionController.text;
  }

  void _save() async {
    moveToLastScreen();
    note.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (note.id != null){ //case 1: Update Operation
      result = await helper.updateNote(note);
    } else { // case 2: Inser Operation
      result = await helper.insertNote(note);
    }
    if (result != 0){ // sucess
      _showAlertDialog('Status', 'Note Save Successfully');
    } else { // failure
      _showAlertDialog('Status', 'Problem Save Note');
    }
  }

  void _delete() async {

    moveToLastScreen();

    if (note.id == null){
      _showAlertDialog('Status', 'No Note Was Deleted');
      return;
    }

    int result = await helper.deleteNote(note.id);
    if (result != 0){ // sucess
      _showAlertDialog('Status', 'Note Deleted Successfully');
    } else { // failure
      _showAlertDialog('Status', 'Error Ocurred While Deleting Note');
    }
  }

  void _showAlertDialog(String title, String message){
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
      context: context,
      builder: (_) => alertDialog
    );
  }
}
