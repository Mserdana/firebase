import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Card.dart';

class OrderPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return OrderPageState();
  }

}

class OrderPageState extends State<OrderPage>{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Orders'),
      ),
       body: new Container(
         padding: new EdgeInsets.all(10.0),
         child: ListView(
           children:<Widget>[
             Column(
               children: <Widget>[
                   new myCardLayout(ProductName: "product Name",ProductDesc: "ProductDesc",ProductPrice: "ProductPrice",ClientName:"ClientName" ,ClientCity:"ClientCity" ,),
                 new myCardLayout(ProductName: "product Name",ProductDesc: "ProductDesc",ProductPrice: "ProductPrice",ClientName:"ClientName" ,ClientCity:"ClientCity" ,),
                 new myCardLayout(ProductName: "product Name",ProductDesc: "ProductDesc",ProductPrice: "ProductPrice",ClientName:"ClientName" ,ClientCity:"ClientCity" ,),
               ],
             ),
           ]
         ),


       ),
     );
  }

}