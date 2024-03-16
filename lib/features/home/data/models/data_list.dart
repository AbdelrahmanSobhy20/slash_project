import 'package:slashtraining/features/home/data/models/product_Variations.dart';
import 'brand.dart';

class DataList{
  int? id;
  String? name;
  String? description;
  int? brandId;
  late Brand brand;
  int? productRating;
  late List<ProductVariations> productVariations;

  DataList({
   required this.id,
   required this.name,
   required this.description,
   required this.brandId,
   required this.brand,
   required this.productRating,
   required this.productVariations,
});
DataList.fromJson(Map<String,dynamic>json){
  id = int.parse(json['id'].toString());
  //print("++++++1");
  name = json['name'];
  //print("++++++2");
  description = json['description'];
  //print("++++++3");
  brandId = int.parse(json['brand_id'].toString());
  //print("++++++4");
  brand= Brand.fromJson(json['Brands']);
  //print("++++++5");
  productRating = int.parse(json['product_rating'].toString())?? 0;
  //print("++++++6");
   productVariations = [];
   (json['ProductVariations'] as List).forEach((element) {
     productVariations.add(ProductVariations.fromJson(element));
   });
  //print("++++++7");
}
}