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
          create table $tableEating (
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

  Future<Eating> insert(Eating eating) async {
    var dbClient = await db;
    eating.id = await dbClient.insert(tableEating, eating.toMap());
    return eating;
  }

  Future<Eating> getEating(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableEating,
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
      return Eating.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableEating, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Eating eating) async {
    var dbClient = await db;
    return await dbClient.update(tableEating, eating.toMap(),
        where: '$columnId = ?', whereArgs: [eating.id]);
  }

  Future<List> getAllEatings() async {
    List<Eating> eating = List();
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableEating, columns: [
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
        eating.add(Eating.fromMap(f));
        // print("getAllEatings" + Eatings.fromMap(f).toString());
      });
    }
    return eating;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
