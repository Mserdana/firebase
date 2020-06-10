import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:fomation_tc/model/User.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;
  static Database _db;
  static final table = 'user';
  static final columnId = '_id';
  static final columnName = 'username';
  static final columnPassword = 'password';
  static final columnEmail = 'email';
  static final columnAdress= 'address';


  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
  DatabaseHelper.internal();

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentDirectory.path}/myDB.txt";
    return await openDatabase(path,
        version: 10,
        onCreate: _createDB  , onUpgrade: (db,oldVersion,newVersion){
            if(newVersion>oldVersion){
              db.execute("DROP TABLE IF EXISTS $table");
              db.execute('''  
                    CREATE TABLE $table (
                      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
                      $columnName TEXT NOT NULL,
                      $columnPassword INTEGER NOT NULL,
                      $columnEmail TEXT ,
                      $columnAdress TEXT ,
                    )
          ''');
            }
        });
  }


    _createDB(Database db , int version) async{
    await db.execute('''  
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnPassword INTEGER NOT NULL,
            $columnEmail TEXT ,
            $columnAdress TEXT ,
          )
          ''');
    print("Created tables");
  }

  Future<int> saveUser(User user) async{
    var dbClient =await db;
    int result =  await dbClient.insert(table, user.toMap());
    return result;


  }
  
 /*
  Future<User> queryUser(String name) async {
    Database myData = await db;
    List<Map> maps = await myData.query(table,
        columns: [columnId, columnName,columnEmail,columnPassword] ,
        where: '$columnName = ?',
        whereArgs: [name]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }


  */
  Future<List<User>> getUsers() async{
    Database result = await db;
    final List<Map<String, dynamic>> maps = await result.query(table);
    return List.generate(maps.length, (i){
      return User.saveUser(
        username: maps[i][columnName],
        password: maps[i][columnPassword],
        email: maps[i][columnEmail],
        address: maps[i][columnAdress],
      );


    });


  }
  Future<int> deleteUser(User user) async{
    var dbClient =await db;
    int result =  await dbClient.delete(table);
    return result;
  }


}