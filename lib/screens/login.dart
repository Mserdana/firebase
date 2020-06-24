import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fomation_tc/Taskes/DadaHelper.dart';
import 'package:fomation_tc/Taskes/loginPageContract.dart';
import 'package:fomation_tc/model/User.dart';
import 'package:fomation_tc/screens/showPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  BuildContext my_context;

  bool _isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _USERTEXT, _PASSTEXT;
  LoginPagePresent _present;
  TextEditingController password = new TextEditingController();
  TextEditingController name = new TextEditingController();

  List<String> itemsList = ["Client", "Dealer"];
  String selectedVal;

  @override
  void initState() {

  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(
        new SnackBar(
          content: new Text(text),
        ));
  }

  @override
  Widget build(BuildContext context) {
    my_context = context;
    return Scaffold(
      key: scaffoldKey,
      body: Form(
        key: formKey,
        child: Container(
          child: ListView(
            children: <Widget>[
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff6bceff),
                        Color(0xff6bceff)
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(90)
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(Icons.person,
                        size: 90,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 32,
                            right: 32
                        ),
                        child: Text('Login',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 2,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[

                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: TextFormField(
                        controller: name,
                        onSaved: (val) {
                          _USERTEXT = val;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.person,
                            color: Color(0xff6bceff),
                          ),
                          hintText: 'Email',
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: TextFormField(
                        controller: password,
                        onSaved: (val) => _PASSTEXT = val,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          icon: Icon(Icons.vpn_key,
                            color: Color(0xff6bceff),
                          ),
                          hintText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.2,
                      height: 45,
                      margin: EdgeInsets.only(top: 32),
                      padding: EdgeInsets.only(
                          top: 4, left: 16, right: 16, bottom: 4
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5
                            )
                          ]
                      ),
                      child: DropdownButton(
                        hint: Text("Select an option"),
                        value: selectedVal,
                        onChanged: (newValue) {
                          setState(() {
                            selectedVal = newValue;
                          });
                        },
                        items: itemsList.map((catogory) {
                          return DropdownMenuItem(
                            child: new Text(catogory),
                            value: catogory,
                          );
                        }).toList(),
                      ),
                    ),

                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16, right: 32
                        ),
                        child: Text('Forgot Password ?',
                          style: TextStyle(
                              color: Colors.grey
                          ),
                        ),
                      ),
                    ),
                    Spacer(),

                    InkWell(
                      onTap: () {
                        if (name.text.isNotEmpty && password.text.isNotEmpty &&
                            selectedVal != null) {
                          _validateLoginInput();
                          if (selectedVal.toString() == "Dealer") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MyApp()));
                          } else if (selectedVal.toString() == "Client") {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => Home_screen()));
                          }
                        } else {
                          _showSnackBar("Insert all data");
                        }
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1.2,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff6bceff),
                                Color(0xFF00abff),
                              ],
                            ),
                            borderRadius: BorderRadius.all(
                                Radius.circular(50)
                            )
                        ),
                        child: Center(
                          child: Text('Login'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Dnon't have an account ?"),
                    Text(
                      "Sign Up", style: TextStyle(color: Color(0xff6bceff)),),
                  ],
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ],

          ),
        ),
      ),
    );
  }


  Future<void> _validateLoginInput() async {
    final FormState form = formKey.currentState;
    if (formKey.currentState.validate()) {
      form.save();
       FirebaseUser user = ( await FirebaseAuth.instance.signInWithEmailAndPassword(email: name.text, password: password.text)).user;
      Navigator.of(context).pushReplacementNamed('/home');
      try {
         await FirebaseAuth.instance.signInWithEmailAndPassword(email: name.text, password: password.text);
      } catch (error) {
        switch (error.code) {
          case "ERROR_EMAIL_ALREADY_IN_USE":
            {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text("error "),
                      ),
                    );
                  });
            }
            break;
          case "ERROR_WEAK_PASSWORD":
            {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: Container(
                        child: Text("error"),
                      ),
                    );
                  });
            }
            break;
          default:
            {

            }
        }
      }
    }
  }


}
