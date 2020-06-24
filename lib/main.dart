import 'package:flutter/material.dart';
import 'package:fomation_tc/screens/HomePage.dart';
import 'package:fomation_tc/screens/NewProduct.dart';
 import 'package:fomation_tc/screens/login.dart';
import 'package:fomation_tc/screens/showPage.dart';
import 'package:fomation_tc/screens/signup.dart';

void main() => runApp(TC());

class TC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/login',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => newProduct(),
        '/login': (context) => LoginPage(),
        '/signup' :(context) => SignupPage(),
      },
    );
  }

}

