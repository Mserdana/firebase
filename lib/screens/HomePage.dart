

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fomation_tc/Taskes/DataHelperProduct.dart';
import 'package:fomation_tc/model/Product.dart';
import 'package:fomation_tc/screens/showPage.dart';

import 'ProductDetails.dart';

const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class Home_screen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new home();
// TODO: implement createState

}

class Photo {
  Photo({
    this.assetName,
    this.assetPackage,
    this.title,
    this.caption,
  });

  final String assetName;
  final String assetPackage;
  final String title;
  final String caption;
}

class home extends State<Home_screen> {
  List list = ['12', '11'];



  static const double height = 366.0;
  String name ='My Wishlist';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Orientation orientation = MediaQuery.of(context).orientation;
    final ThemeData theme = Theme.of(context);
    final TextStyle titleStyle =
    theme.textTheme.headline.copyWith(color: Colors.black54);
    final TextStyle descriptionStyle = theme.textTheme.subhead;
    ShapeBorder shapeBorder;

    DataHelperProdut dataHelperProdut = new DataHelperProdut();
    Future<List<Product>> future= dataHelperProdut.getProducts();
     return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        title: Text("Grocery store"),
        actions: <Widget>[
          IconButton(
            tooltip: 'Search',
            icon: const Icon(Icons.search , color: Colors.black,),
            onPressed: () async {
              final int selected = await showSearch<int>(
                context: context,
                //delegate: _delegate,
              );

            },
          ),
          new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Container(
              height: 150.0,
              width: 30.0,
              child: new GestureDetector(
                onTap: () {
                  /*Navigator.of(context).push(
                  new MaterialPageRoute(
                      builder:(BuildContext context) =>
                      new CartItemsScreen()
                  )
              );*/
                },
                child: Stack(
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      /*
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart_screen()));
                        }
                        */
                    ),


                    list.length == 0
                        ? new Container()
                        : new Positioned(
                        child: new Stack(
                          children: <Widget>[
                            new Icon(Icons.brightness_1,
                                size: 20.0, color: Colors.orange.shade500),
                            new Positioned(
                                top: 4.0,
                                right: 5.5,
                                child: new Center(
                                  child: new Text(
                                    list.length.toString(),
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 11.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),

      body: new SingleChildScrollView(
        child: Container(
          child: new Column(children: <Widget>[
            new Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {
                      //  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                    },
                    child: new Text(
                      'Categories',
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  _verticalD(),

                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () {
                          //   Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                        },
                        child: new Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _verticalD(),
                      IconButton(
                        icon: keyloch,
                        color: Colors.black26,
                      )
                    ],
                  )
                ]),
            new Container(
              height: 188.0,
              margin: EdgeInsets.only(left: 5.0),
              child:
              ListView(scrollDirection: Axis.horizontal, children: <Widget>[
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[

                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/kids.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,

                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/men.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )


                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),
                SafeArea(
                  top: true,
                  bottom: true,
                  child: Container(
                    width: 270.0,
                    child: Card(
                      shape: shapeBorder,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 180.0,
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.asset(
                                    'images/women.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                    // description and share/explore buttons
                    // share, explore buttons
                  ),
                ),

              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 7.0),
              child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    new GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                      },
                      child: new Text(
                        'Featured',
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    _verticalD(),

                    _verticalD(),
                    new Row(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyApp()));
                          },
                          child: new Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.black26,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),

            new Container(
              alignment: Alignment.topCenter,
              height: 700.0,
              child:  FutureBuilder<List<Product>>(
                  future: future,
                  builder: (context,snapshot)
                  {
                    List<Product> products = snapshot.data??[] ;
                    if(products==null){
                      print("null object");
                    }else{
                      print("not null object");

                    }
                    return  new GridView.builder(
                        itemCount: products.length,
                        primary: false,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10.0),
                        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          Product p = products[index];
                          for(int i=0; i<=products.length-1; i++){
                            print(products[i].ProductName);
                          }
                          return new GestureDetector(
                              onTap: (){

                                Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailes(ProductName: p.ProductName , ProductPrice: p.ProductPrice, ProductImagsrc:  p.ProductImagsrc,ProductDesc: p.ProductDesc , ProductCategory: p.ProductCategory,)));
                              },

                              child: new Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: new Card(
                                    shape: shapeBorder,
                                    elevation: 3.0,
                                    child: new Container(
                                      //  mainAxisSize: MainAxisSize.max,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 152.0,
                                            child: Stack(
                                              children: <Widget>[
                                                Positioned.fill(
                                                    child: Image.asset(
                                                      'images/men.jpg',
                                                      fit: BoxFit.cover,
                                                    )),
                                                Container(
                                                  color: Colors.black38,
                                                ),
                                                Container(
                                                  //margin: EdgeInsets.only(left: 10.0),
                                                  padding: EdgeInsets.only(
                                                      left: 3.0, bottom: 3.0),
                                                  alignment: Alignment.bottomLeft,
                                                  child: new GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailes(ProductName: p.ProductName , ProductPrice: p.ProductPrice, ProductImagsrc:  p.ProductImagsrc,ProductDesc: p.ProductDesc , ProductCategory: p.ProductCategory,)));
                                                    },
                                                    child: new Text(
                                                      p.ProductName,
                                                      style: TextStyle(
                                                          fontSize: 18.0,
                                                          color: Colors.white,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),

                                          // new Text(photos[index].title.toString()),
                                        ],
                                      ),
                                    ),
                                  )
                              )

                          );
                        });
                  }
              ),
            )
          ]),
        ),
      ),
    );
  }

  Icon keyloch = new Icon(
    Icons.arrow_forward,
    color: Colors.black26,
  );

  _verticalD() => Container(
    margin: EdgeInsets.only(left: 5.0, right: 0.0, top: 5.0, bottom: 0.0),
  );


 }








