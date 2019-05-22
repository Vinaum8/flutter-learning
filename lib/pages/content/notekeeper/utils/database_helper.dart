import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:Curriculo_App/pages/content/notekeeper/models/note.dart';

class DatabaseHelper{
static DatabaseHelper _databaseHelper; //singleton databasehelper
static Database _database; //singleton database

String noteTable = 'note_table';
String colId = 'id';
String colTitle = 'title';
String colDescription = 'description';
String colPriority = 'priority';
String colDate = 'date';

DatabaseHelper._createInstance(); // criando uma instância no construtor.

factory DatabaseHelper(){
  if (_databaseHelper == null){
  _databaseHelper = DatabaseHelper._createInstance(); //executado somente uma vez
  }
  return _databaseHelper;
}

Future<Database> get database async{
  if (_database == null){
    _database = await initializeDatabase();
  }
  return _database;
}

Future<Database> initializeDatabase() async { //inicizalição da base de dados
  Directory directory = await getApplicationDocumentsDirectory();
  String path = directory.path + 'notes.db';

  // Abrir/Criar a database com o caminho.
  var notesDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
  return notesDatabase;
}

void _createDb(Database db, int newVersion) async {
  
  await db.execute('CREATE TABLE $noteTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT, $colDescription TEXT, $colPriority INTEGER, $colDate TEXT)');
}

//Fetch
Future<List<Map<String, dynamic>>> getNoteMapsList() async {
  Database db = await this.database;

  // var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
  var result = await db.query(noteTable, orderBy: '$colPriority ASC');
  return result;
}

//Insert
Future<int> insertNote(Note note) async {
  Database db = await this.database;
  var result = await db.insert(noteTable, note.toMap());
  return result;
}

//Update
Future<int> updateNote(Note note) async {
  var db = await this.database;
  var result = await db.update(noteTable, note.toMap(), where: '$colId = ?', whereArgs: [note.id]);
  return result;  
}

//Delete 
Future<int> deleteNote(int id) async {
  var db = await this.database;
  int  result = await db.rawDelete('DELETE FROM $noteTable WHERE $colId = $id');
  return result;  
}

//Get
Future<int> getCount() async {
  Database db = await this.database;
  List<Map<String, dynamic>> x = await db.rawQuery('SELECT COUNT (*) from $noteTable');
  int result = Sqflite.firstIntValue(x);
  return result;
}

//Vai pegar o "MAP List" e Converter para a Note LIST List<Note>
Future<List<Note>> getNoteList() async {
  var noteMapList = await getNoteMapsList(); //Alocado o mapa na variável
  int count = noteMapList.length; //Utilizado o tamanho da lista para o contador
  
  List<Note> noteList = List<Note>();
  // for loop to create a notelist from a map list
  for (int i=0; i< count; i++){
    noteList.add(Note.fromMapObject(noteMapList[i]));
  }
  return noteList;
}
}