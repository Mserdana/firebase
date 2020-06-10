
import 'dart:io';

import 'package:fomation_tc/model/Product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DataHelperProdut{


  static final DataHelperProdut _cons = new DataHelperProdut.internel();
  factory DataHelperProdut()=> _cons;
  static Database _database;
  int oldVersion , newVersion;
   static final _databaseVersion = 11;
  static final _tableName = "Product";
  static final  String  coulmnId = "_id";
  static final String colmnPName = "productName";
  static final String columnPPrice = "productPrice";
  static final String columnPDesc = "productDescription";
   static final String columnPCategory ="productCategory";
  static final String columnPSrc ="productImageSrc";

  DataHelperProdut.internel();

  Future<Database> get db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  _initDb()async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentDirectory.path}/MyData.txt}";
    return await openDatabase(path,version: _databaseVersion , onUpgrade: (db,oldVersion,newVersion){
      oldVersion= _databaseVersion;
       newVersion=12;
      if(newVersion>oldVersion){
          db.execute("DROP TABLE IF EXISTS $_tableName");
          db.execute(
              '''
              CREATE TABLE product (
                $coulmnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $colmnPName TEXT NOT NULL,
                $columnPPrice TEXT NOT NULL,
                $columnPDesc TEXT NOT NULL,
                $columnPCategory TEXT NOT NULL,
                $columnPSrc TEXT NOT NULL
              )
              '''

          );
        }
    },onCreate: _createDB);

  }


   _createDB(Database db, int version)async{
        Database newDatabase= await db;
        return await newDatabase.execute(
            '''
              CREATE TABLE $_tableName (
                $coulmnId INTEGER PRIMARY KEY AUTOINCREMENT,
                $colmnPName TEXT NOT NULL,
                $columnPPrice TEXT NOT NULL,
                $columnPDesc TEXT NOT NULL,
                $columnPCategory TEXT NOT NULL,
                $columnPSrc TEXT NOT NULL
              )
              '''

        );
  }

  Future<int> SaveProduct(Product product) async {
    var result = await  db;
    int id = await result.insert(_tableName, product.toMap());
    return id;
  }
/*
  Future<Product> queryProduct(int id) async {
    Database result = await db;
    List<Map> maps = await result.query(_tableName,
        columns: [coulmnId, colmnPName, columnPCategory , columnPDesc,columnPPrice , columnPSrc] ,
        where: '$coulmnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Product.fromMap(maps.first);
    }
    return null;
  }


 */
  Future<List<Product>> getProducts() async{
    Database result = await db;
    final List<Map<String, dynamic>> maps = await result.query(_tableName);
    return List.generate(maps.length, (i){

      return Product.save(
                ProductName: maps[i][colmnPName],
                ProductDesc: maps[i][columnPDesc],
                ProductCategory:maps[i][columnPCategory],
                ProductPrice:maps[i][columnPPrice],
                ProductId: maps[i][coulmnId].toString(),
                ProductImagsrc: maps[i][columnPSrc]
            );


    });


  }
}