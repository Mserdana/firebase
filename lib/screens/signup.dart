import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  bool isSelected = false;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController firstName =new TextEditingController();
  TextEditingController LastName =new TextEditingController();
  TextEditingController email =new TextEditingController();
  TextEditingController password =new TextEditingController();
  TextEditingController address =new TextEditingController();


   @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }



  void _showSnackBar(String text) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(text),
    ));
  }

  @override
  Widget build(BuildContext context)  {

    setState(() {

    });
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/3.5,
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
                        child: Text('Sign Up',
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

            new Form(
              key: this._formKey,
              child: Container(
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
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
                      child: TextField(
                        controller: firstName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: 'First Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
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
                      child: TextField(
                        controller: LastName,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: 'Last Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
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
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: 'Email',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1.2,
                      height: 45,
                      padding: EdgeInsets.only(
                        top: 4,left: 16, right: 16, bottom: 4
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
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                            hintText: 'Password',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: (){
                        if(firstName.text.isNotEmpty && LastName.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty){
                          String userEmail =email.text;
                          bool result =validateEmail(userEmail);
                            if(result) {
                              String name_text = firstName.text + " " +
                                  LastName.text;
                              String pass_text = password.text;
                              _validateLoginInput();

                             }else{
                              _showSnackBar("Inavilad Email");
                            }
                          }else{
                          _showSnackBar("Please inter all data");
                        }
                      },
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width/1.2,
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
                          child: Text('Sign Up'.toUpperCase(),
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
            ),
            
            InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have an account ?"),
                  Text("Login",style: TextStyle(color: Color(0xff6bceff)),),
                ], 
              ),
              onTap: (){
                Navigator.pop(context);
              },
            ),           
          ],
          
        ),
      ),
    );
  }




  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  void    _validateLoginInput() async{
    final FormState form = _formKey.currentState;
    if(_formKey.currentState.validate()){
      form.save();
      try{
        FirebaseUser user=   (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text)).user;
        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
        String name = firstName.text + " " + LastName.text;
        userUpdateInfo.displayName =name;
        user.updateProfile(userUpdateInfo).then((value){
          Navigator.of(context).pushReplacementNamed('/');
          Firestore.instance.collection('users').document().setData(
              {'email': email.text, 'displayName': name}).then((onValue) {
          });
        });
      }catch(error){
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


