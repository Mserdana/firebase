import 'package:fomation_tc/Taskes/RestData.dart';
import 'package:fomation_tc/model/User.dart';

abstract class LoginPageContract{
  void onLoginSuccess(User user);
  void onLoginError(String error);

}
class LoginPagePresent{
  LoginPageContract _view;
  RestData data = new RestData();
  LoginPagePresent(this._view);



  doLogin(String name, String pass) {
    data.login(name, pass).then((User user)=> _view.onLoginSuccess(user)).catchError((onError)=>_view.onLoginError(onError.toString()));

  }
  doSignUp(String name , String email , String pass){
    data.signUp(name,pass,email).then((User user)=> _view.onLoginSuccess(user)).catchError((onError)=>_view.onLoginError(onError.toString()));
  }

}