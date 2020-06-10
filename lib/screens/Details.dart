
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailsPageState();
  }

}


class DetailsPageState extends State<DetailsPage>{
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    // TODO: implement build
    return Scaffold(
     // appBar: AppBar(title: Text("Order Details"),),
      body:Column(
         children: <Widget>[
           Container(
             padding: EdgeInsets.only(top:90 ,left:20),
              child: Text("Order Details", style: TextStyle(fontSize:30,color:Colors.black38 ),textAlign: TextAlign.center),
           ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 20,top: 50),
                  child: ListTile(
                    title: Text("Product Name" , style: new TextStyle(fontSize: 20.0),),
                    subtitle:
                    const Text('Product Name'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,top: 50),
                  child: ListTile(
                    title: Text("Product Description" , style: new TextStyle(fontSize: 20.0),),
                    subtitle:
                    const Text('Product Description'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,top: 50),
                  child: ListTile(
                    title: Text("Product Price" , style: new TextStyle(fontSize: 20.0),),
                    subtitle:
                    const Text('Product Price'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,top: 50),
                  child: ListTile(
                    title: Text("Client City Name" , style: new TextStyle(fontSize: 20.0),),
                    subtitle:
                    const Text('Client City'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20,top: 50),
                  child: ListTile(
                    title: Text("Client Name" , style: new TextStyle(fontSize: 20.0),),
                    subtitle:
                    const Text('Clent Name'),
                  ),
                ),
                Center(

                  child: Container(
                      width: screenSize.width,
                      padding: EdgeInsets.all(20.0),
                      child: FlatButton(
                        child: Text("Accept" ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        disabledColor: Colors.blue,
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.blue) , borderRadius: BorderRadius.all(Radius.elliptical(10,10))
                        ),
                      )

                  ),
                )

              ],
            )
         ],
      ),
    );


  }




}