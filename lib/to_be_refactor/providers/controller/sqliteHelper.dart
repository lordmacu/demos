import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:ualet/to_be_refactor/models/generic/table_model.dart';

class SqliteHelper with ChangeNotifier {
  static SqliteHelper _databaseHelper;
  static Database _database;

  SqliteHelper._createInstance();

  String nameTable = 'parameterApp';
  String colId = 'id';
  String colTitle = 'title';
  String colDescription = 'description';

  factory SqliteHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = SqliteHelper._createInstance();
    }
    return _databaseHelper;
  }
  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, '_ualet.db');

    var dataDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return dataDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE   $nameTable($colId INTEGER PRIMARY KEY, $colTitle TEXT, '
        '$colDescription TEXT)');
  }

  Future<List<Map<String, dynamic>>> getTableMapList() async {
    Database db = await this.database;

    var result = await db.query(nameTable, orderBy: '$colTitle ASC');
    return result;
  }

  Future<int> insertTable(TableModel data) async {
    Database db = await this.database;
    var d = data.toMap();
    var result = await db.insert(nameTable, d);
    return result;
  }

  Future<int> updateTable<T>(data) async {
    var db = await this.database;
    var result = await db.update(nameTable, data.fromJson(),
        where: '$colId = ?', whereArgs: [data.id]);
    return result;
  }

  Future<int> deleteTable(int id) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $nameTable WHERE $colId = $id');
    return result;
  }

  Future<int> getCount() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $nameTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  Future<List<TableModel>> getDataList() async {
    var dataMapList = await getTableMapList();
    int count = dataMapList.length;
    List<TableModel> dataList = List<TableModel>();
    for (int i = 0; i < count; i++) {
      dataList.add(TableModel.fromMapObject(dataMapList[i]));
    }

    return dataList;
  }

  Future<int> deleteAllTable() async {
    Database db = await this.database;
    return await db.delete(nameTable);
  }
}
