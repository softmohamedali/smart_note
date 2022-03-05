

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:note_flutter/domain/models/note.dart';
import 'package:sqflite/sqflite.dart';


@LazySingleton()
@Injectable()
class NoteDataBase {
  NoteDataBase(){
   database;
  }


  static Database? _database;

  Future<Database> get database async {
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    Database _database = await openDatabase("Notedb.db", version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
        CREATE TABLE notes (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT ,
        time TEXT ,
        content TEXT ,
        proirity TEXT ,
        tasks TEXT)
        ''');
        });
    return _database;
  }

  insertNote(Note note) async {
    Database _db = await database;
    await _db.insert(
      'notes',
      note.toJson(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  upDateNote(Note note) async {
    Database _db = await database;
    await _db.update(
      'notes',
      note.toJson(),
      where: 'id= ?', whereArgs: [1],
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  delelteNote({
    required Note note,
    required Function onSuccess,
    required ValueChanged <String> onError
  }) async {
    Database _db = await database;
    await _db
        .delete('notes', where: 'id= ?', whereArgs: [1])
        .then((value) => {onSuccess})
        .catchError((onError)=> {onError(onError)});
  }

  delelteAllNote() async {
    Database _db = await database;
    await _db.rawQuery('DELETE FROM notes');
  }

  Future<List<Note>> getAllNotes() async {
    Database _db = await database;
    List<Map> list = await _db.query(
      'notes',
    );

    return list.isNotEmpty ? list.map((e) => Note.fromJson(e)).toList() : [];
  }

  Future<List<Note>> getNotesHighPriority() async {
    Database _db = await database;
    List<Map> list = await _db.query(
        "notes ORDER BY CASE When proirity like 'H%' then 1 When proirity like 'M%' then 2 When proirity like 'L%' then 3 end"
    );
    return list.isNotEmpty ? list.map((e) => Note.fromJson(e)).toList() : [];
  }

  Future<List<Note>> getNotesLowPriority() async {
    Database _db = await database;
    List<Map> list = await _db.query(
        "notes ORDER BY CASE When proirity like 'L%' then 1 When proirity like 'M%' then 2 When proirity like 'H%' then 3 end"
    );
    return list.isNotEmpty ? list.map((e) => Note.fromJson(e)).toList() : [];
  }



}
