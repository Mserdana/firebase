
import 'package:fomation_tc/Taskes/DataHelperProduct.dart';

class Product{

  String ProductName , ProductId ;
  String ProductPrice;
  String ProductImagsrc;
  String ProductCategory ,ProductDesc;

  Product();
  Product.save({this.ProductName , this.ProductDesc ,this.ProductPrice , this.ProductCategory , this.ProductImagsrc , this.ProductId });

  Product.fromMap(Map<String,dynamic> map){
    ProductId = map[DataHelperProdut.coulmnId];
    ProductName = map[DataHelperProdut.colmnPName];
    ProductPrice=map[DataHelperProdut.columnPPrice];
    ProductCategory= map[DataHelperProdut.columnPCategory];
    ProductDesc = map[DataHelperProdut.columnPDesc];
      ProductImagsrc = map[DataHelperProdut.columnPSrc];
  }

  Map<String,dynamic> toMap(){
      var map = <String,dynamic>{
         DataHelperProdut.colmnPName :ProductName,
         DataHelperProdut.columnPDesc :ProductDesc,
        DataHelperProdut.columnPCategory:ProductCategory,
        DataHelperProdut.columnPPrice :ProductPrice,
         DataHelperProdut.columnPSrc:ProductImagsrc

      };
      if(ProductId!=null){
        map[DataHelperProdut.coulmnId]= ProductId;
      }
      return map;
  }
}