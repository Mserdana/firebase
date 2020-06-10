import 'package:flutter/material.dart';
import 'package:fomation_tc/screens/Order.dart';

import 'NewProduct.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',

      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(top: 62),
                child: Column(
                  children: <Widget>[
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50 ,
                        margin: EdgeInsets.all(20.0),
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
                        child: FlatButton(
                          child: Text("New Product" ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          disabledColor: Colors.blue,
                          onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => newProduct()));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.blue) , borderRadius: BorderRadius.all(Radius.elliptical(10,10))
                          ),
                        )
                    ),

                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50 ,
                        margin: EdgeInsets.all(20.0),
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
                        child: FlatButton(
                          child: Text("Orders" ),
                          color: Colors.blue,
                          textColor: Colors.white,
                          disabledColor: Colors.blue,
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage()));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.blue) , borderRadius: BorderRadius.all(Radius.elliptical(10,10))
                          ),
                        )
                    ),
                    Spacer(),

                  ],
                ),
              ),
            ],
          ),
        )

    );
  }


}