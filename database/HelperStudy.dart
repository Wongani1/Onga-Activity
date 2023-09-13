import 'package:xyz/model/User.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:xyz/utils/Utils.dart';
import 'package:path_provider/path_provider.dart';

class Helper {
  static final Helper _instance = new Helper.internal();
  factory Helper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "imulm.db");
    var theDb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
          create table $tableStudy (
          $columnId integer primary key autoincrement,
          $columnName text not null,
          $columnCategory text not null,
          $columnDescription text not null,
          $columnDate text not null,
          $columnComment text not null,
          $columnRating text not null,
          $columnDone text not null,
          $columnReview text not null)
          ''');
    });
    return theDb;
  }

  Helper.internal();

  Future<Study> insert(Study study) async {
    var dbClient = await db;
    study.id = await dbClient.insert(tableStudy, study.toMap());
    return study;
  }

  Future<Study> getStudy(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableDance,
        columns: [
          columnId,
          columnName,
          columnCategory,
          columnDescription,
          columnDate,
          columnComment,
          columnRating,
          columnDone,
          columnReview
        ],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Study.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableStudy, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Study study) async {
    var dbClient = await db;
    return await dbClient.update(tableStudy, study.toMap(),
        where: '$columnId = ?', whereArgs: [study.id]);
  }

  Future<List> getAllStudies() async {
    List<Study> study = List();
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableStudy, columns: [
      columnId,
      columnName,
      columnCategory,
      columnDescription,
      columnDate,
      columnComment,
      columnRating,
      columnDone,
      columnReview
    ]);
    if (maps.length > 0) {
      maps.forEach((f) {
        study.add(Study.fromMap(f));
        // print("getAllStudies" + Study.fromMap(f).toString());
      });
    }
    return study;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
