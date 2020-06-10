import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Details.dart';



class myCardLayout extends StatelessWidget {
  // default constructor
  myCardLayout({this.ProductName, this.ProductPrice, this.ProductDesc, this.ClientName, this.ClientCity});


  final String ProductName, ProductPrice, ProductDesc,ClientName,ClientCity;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return new Container(

      child: new Card(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(child: Text(ProductName),alignment: Alignment.centerLeft,padding: EdgeInsets.all(10)),
            Container(child: Text(ProductDesc),alignment: Alignment.centerLeft,padding: EdgeInsets.all(10)),
            Container(child: Text(ProductPrice),alignment: Alignment.centerLeft,padding: EdgeInsets.all(10)),
            Container(child: Text(ClientName),alignment: Alignment.centerLeft,padding: EdgeInsets.all(10)),
            Container(child: Text(ClientCity),alignment: Alignment.centerLeft,padding: EdgeInsets.all(10)),



            // ignore: deprecated_member_use
            new ButtonTheme.bar(
              // make buttons use the appropriate styles for cards
              child: new ButtonBar(
                children: <Widget>[
                  Container(
                      width: 100,
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
                        child: Text("Detailes" ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.blue,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.blue) , borderRadius: BorderRadius.all(Radius.elliptical(10,10))
                        ),
                      )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}