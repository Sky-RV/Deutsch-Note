import 'dart:async';
import 'package:deutsch_notebook/Models/Notebook_Model.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Notebook_DbProvider{

  Notebook_DbProvider._();

  static final Notebook_DbProvider NoteBook_Database = Notebook_DbProvider._();
  late Database _database;

  Future<Database> get database async{
    _database = await initDB();
    return _database;
  }

  initDB() async{
    return openDatabase(
      join(await getDatabasesPath(), 'Notebook_Database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE NoteBook(Note_Id INTEGER PRIMARY KEY, Note_Name TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> Insert_Notebook(Notebook_Model notebook_model) async {
    final db = await database;

    await db.insert(
      'NoteBook',
      notebook_model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Notebook_Model>> Notebooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('NoteBook');

    return List.generate(maps.length, (i) {
      return Notebook_Model(
        Notebook_ID: maps[i]['Notebook_ID'],
        Notebook_Name: maps[i]['Notebook_Name'],
      );
    });
  }

  Future<void> UpdateNotebook(Notebook_Model notebook_model) async {
    final db = await database;

    await db.update(
      'NoteBook',
      notebook_model.toMap(),
      where: 'Notebook_ID = ?',
      whereArgs: [notebook_model.Notebook_ID],
    );
  }

  Future<void> DeleteNotebook(int id) async {
    final db = await database;
    await db.delete(
      'NoteBook',
      where: 'Notebook_ID = ?',
      whereArgs: [id],
    );
  }

  Future<int?> NotebookLength() async {
    final db = await database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM NoteBook'));
  }

}