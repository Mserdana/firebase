import 'package:fomation_tc/Taskes/DtatabaseOrder.dart';

import 'Product.dart';

class Order{
  String UserName , UserAdrres  , pName , pDesc , pCatogerise , pPrice , PImage , pId;

  Order();
  Order.save({this.pName,this.pPrice,this.pDesc,this.pCatogerise, this.UserName,this.UserAdrres, this.PImage});


  Order.fromMap(Map<String,dynamic> map){
    pId = map[DtataBaseOrder.coulmnid];
    pName = map[DtataBaseOrder.colmnPname];
    pPrice=map[DtataBaseOrder.columnPprice];
    pCatogerise= map[DtataBaseOrder.columnPcategory];
    pDesc = map[DtataBaseOrder.columnPdesc];
    PImage = map[DtataBaseOrder.columnPsrc];
    UserAdrres = map[DtataBaseOrder.coulmnUserName];
    UserAdrres = map[DtataBaseOrder.columnUserAddress];
  }

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{
      DtataBaseOrder.coulmnid:pId,
      DtataBaseOrder.colmnPname:pName,
      DtataBaseOrder.columnPdesc :pDesc,
      DtataBaseOrder.columnPprice:pPrice,
      DtataBaseOrder.columnPcategory:pCatogerise,
      DtataBaseOrder.columnPsrc:PImage,
      DtataBaseOrder.coulmnUserName:UserName,
      DtataBaseOrder.columnUserAddress:UserAdrres


    };
    if(pId!=null){
      map[DtataBaseOrder.coulmnid]= pId;
    }
    return map;
  }
}