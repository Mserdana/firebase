
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fomation_tc/Taskes/DataHelperProduct.dart';
import 'package:fomation_tc/model/Product.dart';
import 'package:fomation_tc/model/Utility.dart';
import 'package:fomation_tc/screens/HomePage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class newProduct extends StatefulWidget{
String UserName , UserAddress ;
newProduct({this.UserName , this.UserAddress});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return newProductState();
  }

}

class newProductState extends State<newProduct>{

   TextEditingController ProductName =new TextEditingController();
  TextEditingController ProductPrice =new TextEditingController();
  TextEditingController ProductCatogly =new TextEditingController();
  TextEditingController ProductDesc =new TextEditingController();
  String path;
   List<String> itemsList=["Woman" , "Man" , "Kids"];
   String selectedVal;
  File imageURI;
  int productId ;
  @override
  Widget build(BuildContext context){

    // TODO: implement build
    return Scaffold(
      body: Form(
        child: Container(
          padding: new EdgeInsets.only(
              top: 20,left: 16, right: 16, bottom: 16
          ),
          margin: new EdgeInsets.only(
              top: 20,left: 16, right: 16, bottom: 10
          ),
          child: ListView(
                      children: <Widget>[
                        new Text("Product Name" , style: TextStyle(color: Colors.blueGrey )),
                        SizedBox(
                          height: 30,
                        ),
                        new TextField(
                          controller: ProductName,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(5)),fillColor: Colors.blue
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        new Text("Product Price " , style: TextStyle(color: Colors.blueGrey )),
                        new TextField(
                          controller: ProductPrice,
                          decoration: InputDecoration(
                            border:OutlineInputBorder(borderRadius: BorderRadius.circular(5)),fillColor: Colors.blue
                        ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        new Text("Product Category" , style: TextStyle(color: Colors.blueGrey )),
                        new DropdownButton(
                            hint: Text("Select an option"),
                              value: selectedVal,
                              onChanged: (newValue){
                                    setState(() {
                                      selectedVal=newValue;
                                    });
                              },
                          items: itemsList.map((catogory){
                            return DropdownMenuItem(
                              child: new Text(catogory),
                              value: catogory,
                            );
                          }).toList(),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        new Text("Product Description" , style: TextStyle(color: Colors.blueGrey )),
                        new TextField(
                          controller: ProductDesc,
                          decoration: InputDecoration(
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(5)),fillColor: Colors.blue
                          ),
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      Container(
                        height: MediaQuery.of(context).size.height/2,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 62),
                        child: Column(
                          children: <Widget>[
                            /*
                            imageURI == null
                                ? Text('No image selected.')
                                : widget(child: Image.file(imageURI, width: 300, height: 200, fit: BoxFit.cover))
                            ,
*/
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50 ,
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
                              child: FlatButton(
                                child: Text("Pick  Image" ),
                                 color: Colors.blue,
                                textColor: Colors.white,
                                disabledColor: Colors.blue,
                                onPressed: (){
                                   getImageFromGallery();
                                },
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.blue) , borderRadius: BorderRadius.all(Radius.elliptical(10,10))
                                ),
                              ),

                            ),
                            SizedBox(
                              height: 50,
                            ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50 ,
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
                                child: FlatButton(
                                  child: Text("Add  Product" ),
                                  color: Colors.blue,
                                  textColor: Colors.white,
                                  disabledColor: Colors.blue,
                                  onPressed: () async {
                                    if(ProductName.text.isNotEmpty && ProductDesc.text.isNotEmpty && ProductPrice.text.isNotEmpty && selectedVal!=null && imageURI!=null ){

                                      String Pname =ProductName.text;
                                      String Pdesc = ProductDesc.text;
                                      String Pprice =ProductPrice.text;
                                      String Pcato = selectedVal;
                                      String imagePath = imageURI.toString();
                                       int id = await _saveProdcut(Pname  , Pdesc, imagePath ,  Pcato , Pprice);
                                       print("added successfully");
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=> Home_screen()));
                                     }
                                  },
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(width: 2, style: BorderStyle.solid, color: Colors.blue) , borderRadius: BorderRadius.all(Radius.elliptical(10,10))
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )



            ],
          ),
        ),
      ),


    );
  }


  Future getImageFromGallery() async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageURI = image;
      print(imageURI);
    });


  }



  Future<int> _saveProdcut(String Productname  , String Productdesc , String Productimagsrc, Productcategory , String Pprice )async{
    Product product = new Product();
    product.ProductName =Productname ;
    product.ProductDesc =Productdesc;
    product.ProductImagsrc =Productimagsrc;
    product.ProductCategory = Productcategory;
    product.ProductPrice = Pprice;
    DataHelperProdut helperProdut =  DataHelperProdut();
    int id = await helperProdut.SaveProduct(product);
    return id;

  }
}



