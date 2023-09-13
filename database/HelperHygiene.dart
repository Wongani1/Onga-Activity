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
          create table $tableHygiene (
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

  Future<Hygiene> insert(Hygiene hygiene) async {
    var dbClient = await db;
    hygiene.id = await dbClient.insert(tableHygiene, hygiene.toMap());
    return hygiene;
  }

  Future<Hygiene> getHygiene(int id) async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableHygiene,
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
      return Hygiene.fromMap(maps.first);
    }
    return null;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableHygiene, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Hygiene hygiene) async {
    var dbClient = await db;
    return await dbClient.update(tableHygiene, hygiene.toMap(),
        where: '$columnId = ?', whereArgs: [hygiene.id]);
  }

  Future<List> getAllHygienes() async {
    List<Hygiene> hygiene = List();
    var dbClient = await db;
    List<Map> maps = await dbClient.query(tableHygiene, columns: [
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
        hygiene.add(Hygiene.fromMap(f));
        // print("getAllHygienes" + Hygiene.fromMap(f).toString());
      });
    }
    return hygiene;
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
