import 'dart:io';

import 'package:spacex/screens/space_x_rocket_screen.dart';
import 'package:spacex/utils/dbkeys.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:spacex/models/space_x_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper; // Singleton DatabaseHelper
  static Database? _database;

  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper
  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper
        ._createInstance(); // This is executed only once, singleton object
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = '${directory.path}rockets.db';
    var rocketsDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return rocketsDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute('''CREATE TABLE ${LocalDbKeys.dbTableName} (
     ${LocalDbKeys.colId} TEXT,
     ${LocalDbKeys.colHeight} TEXT,
     ${LocalDbKeys.colDiameter} TEXT,
     ${LocalDbKeys.colMass} TEXT,
     ${LocalDbKeys.colFlickerImages} TEXT,
     ${LocalDbKeys.colName} TEXT,
     ${LocalDbKeys.colType} TEXT,
     ${LocalDbKeys.colActive} INTEGER,
     ${LocalDbKeys.colStages} INTEGER,
     ${LocalDbKeys.colBoosters} INTEGER,
     ${LocalDbKeys.colCostPerLaunch} INTEGER,
     ${LocalDbKeys.colSuccessRatePct} INTEGER,
     ${LocalDbKeys.colFirstFlight} TEXT,
     ${LocalDbKeys.colCountry} TEXT,
     ${LocalDbKeys.colCompany} TEXT,
     ${LocalDbKeys.colWikipedia} TEXT,
     ${LocalDbKeys.colDescription} TEXT,
     ${LocalDbKeys.colIsFavourite} INTEGER
      )''');
  }

  /// ---- Fetch Operation: Get all the rocket objects from database ---- ///

  Future<List<Map<String, dynamic>>> getRocketMapList() async {
    Database? db = await database;
    var result = await db!.query(LocalDbKeys.dbTableName);
    return result;
  }

  /// ---- Insert Operation: Update a rocket object and save it to database ---- ///

  Future<int> insertRocket(SpaceXModel rocket) async {
    Database? db = await database;
    var result = await db!.insert(LocalDbKeys.dbTableName, rocket.toJson());
    return result;
  }

  /// ---- Update Operation: Update a rocket object and save it to database ---- ///

  Future<int> updateRocket(SpaceXModel rocket) async {
    Database? db = await database;
    var result = await db!.update(LocalDbKeys.dbTableName, rocket.toJson(), where: '${LocalDbKeys.colId} = ?', whereArgs: [rocket.id]);
    return result;
  }

  /// ---- Delete Operation: Delete a Note object from database ---- ///
  Future<int> deleteRocket(int id) async {
    Database? db = await database;
    var result = await db!.delete(LocalDbKeys.dbTableName,
        where: '${LocalDbKeys.dbTableName} = ?', whereArgs: [id]);
    return result;
  }

  /// ---- Get the number of objects in the database ---- ///
  Future<int> getCount() async {
    Database? db = await database;
    List<Map<String, dynamic>> x =
    await db!.rawQuery(' SELECT COUNT (*) from ${LocalDbKeys.dbTableName}');
    int? result = Sqflite.firstIntValue(x);
    // print("$result [RED]");
    return result!;
  }

  /// --- Convert Map List into SpaceXModel list --- ///
  Future<List<SpaceXModel>> getRocketList() async {
    print("Get rocket list called");
    var rocketMapList = await getRocketMapList();
    List<SpaceXModel> rocketList = [];
    for (var i in rocketMapList) {
      print(i["isFavourite"]);
      rocketList.add(SpaceXModel.fromJson(i));
    }

    return rocketList;
  }
}
