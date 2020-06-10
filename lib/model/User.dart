import 'package:fomation_tc/Taskes/DadaHelper.dart';

class User {
  int _id;
  String username;
  String password;
  String email;
  String address;
  User(this.username, this.password );

  User.newConst(this.username, this.password , this.email );
  User.saveUser({this.username, this.password , this.email , String address });

  User.fromMap(dynamic obj) {
    this.username = obj[DatabaseHelper.columnName];
    this.password = obj[DatabaseHelper.columnPassword];
    this.email = obj[DatabaseHelper.columnEmail];
    this.address = obj[DatabaseHelper.columnAdress];

  }

  String get _username => username;
  String get _password => password;
  String get _email => email;


  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map[DatabaseHelper.columnName] = username;
    map[DatabaseHelper.columnPassword] = password;
    map[DatabaseHelper.columnEmail] = email;
    map[DatabaseHelper.columnAdress] = address;
    return map;
  }
}