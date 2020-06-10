import 'package:fomation_tc/Taskes/NetworkUrl.dart';
import 'package:fomation_tc/model/User.dart';

class RestData{
  NetworkUtil _util = new NetworkUtil();
  static final BASE_URL=" ";
  static final LOGIN_URL = BASE_URL+"/";

  Future<User> login(String nameText , String passText){
    return Future.value(new User(nameText, passText));
  }
  Future<User> signUp(String nameText , String passText , String emailText){
    return Future.value(new User.newConst(nameText, passText,emailText));
  }

}