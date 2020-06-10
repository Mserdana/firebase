
import 'dart:io';

import 'package:fomation_tc/Taskes/DataHelperProduct.dart';
import 'package:fomation_tc/model/Order.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DtataBaseOrder {

  DtataBaseOrder.internel();
  static final DtataBaseOrder _cons = new DtataBaseOrder.internel();
  factory DtataBaseOrder()=> _cons;
  static Database _database;
  int oldVersion , newVersion;
  static final _databaseVersion = 1;
  static final _tableName = "Order";
  static final  String  coulmnid = "orderId";
  static final String colmnPname = "ProductName";
  static final String columnPprice = "ProductPrice";
  static final String columnPdesc = "ProductDescription";
  static final String columnPcategory ="ProductCategory";
  static final String columnPsrc ="ProductImageSrc";
  static final String coulmnUserName ="ProductImageSrc";
  static final String columnUserAddress="ProductImageSrc";


   Future<Database> get db async{
     if (_database != null) {
       return _database;
     }
     _database = await _initateDB();
     return _database;
   }

    _initateDB () async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentDirectory.path}/MyData.txt}";
    return await openDatabase(path , version: _databaseVersion , onCreate:_onCreateDb );

  }

  _onCreateDb(Database database , int version)async{
    Database newdb = await database;
    return newdb.execute(''''
       CREATE TABLE $_tableName(
           $coulmnid INTEGER PRIMARY KEY AUTOINCREMENT,
                $colmnPname TEXT NOT NULL,
                $columnPprice TEXT NOT NULL,
                $columnPdesc TEXT NOT NULL,
                $columnPcategory TEXT NOT NULL,
                $columnPsrc TEXT NOT NULL
                $coulmnUserName TEXT NOT NULL ,
                $columnUserAddress TEXT NOT NULL
                foreign key (orderId) references Product(_id) ,
              )
    ''');
  }


  Future<int> SaveOrder(Order order) async {
    var result = await  db;
    int id = await result.insert(_tableName, order.toMap());
    return id;
  }



  Future<List<Order>> getProducts() async{
    Database result = await db;
    final List<Map<String, dynamic>> maps = await result.query(_tableName);
    return List.generate(maps.length, (i){

      return Order.save(
        pName: maps[i][colmnPname],
        pDesc:  maps[i][columnPdesc],
        pCatogerise: maps[i][columnPcategory],
        pPrice: maps[i][columnPprice],
        PImage: maps[i][columnPsrc],
        UserName: maps[i][coulmnUserName],
        UserAdrres: maps[i][columnUserAddress]
      );


    });


  }



}