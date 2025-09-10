import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MoviesDatabase {
  static final nameDB = "movies_database";
  static final versionDB = 1;

  static Database? _database; //cuando hay un '_' quiere decir que es privado
  Future<Database?> get database async {
    if (_database != null) return _database;
    return _database = await _initDB();
  }

  Future<Database?> _initDB() async {
    Directory folder = await getApplicationDocumentsDirectory();
    String pathDB = join(folder.path, nameDB);
    return openDatabase(pathDB, version: versionDB, onCreate: _createTables);
  }

  FutureOr<void> _createTables(Database db, int version) {
    String sql = '''CREATE TABLE movies(
      id_movie INTEGER PRIMARY KEY AUTOINCREMENT,
      movie varchar(150),
      tiempo char(4),
      date_reseale char(10)
      )''';
      db.execute(sql);
  }
  INSERT (String table, Map<String, dynamic> data) async   {
    var con = await database;
    return con!.insert(table , data);
  }
  UPDATE(String table, Map<String, dynamic> data) async{
    var con = await database;
    return con!.update(table, data, where: 'id_movie = ?', whereArgs: [data['id_movie']]);//donde va el '?' se pone el valor que va en whereArgs y son parametrizadas
  }
  Future<int> DELETE(String table, int id) async{
    var con = await database;
    return con!.delete(table, where: 'id_movie = ?', whereArgs: [id]);
  }
  SELECT(){}
}
