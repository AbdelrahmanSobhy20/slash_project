import 'package:slashtraining/features/product_details/data/models/variations.dart';

import 'avaiable_properties.dart';

class ProductDetailsModel {
  int? id;
  String? name;
  int? brandId;
  String? description;
  List<Variations>? variations;
  List<AvaiableProperties>? avaiableProperties;
  String? brandName;
  String? brandImage;

  ProductDetailsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.brandId,
    this.variations,
    this.avaiableProperties,
    required this.brandName,
    required this.brandImage,
  });

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    print("---------1");
    name = json['name']?? "0";
    description = json['description']?? "0";
    print("---------2");
    brandId =json['brand_id']??0;
    print("---------3");
    variations = [];
    for (var element in (json['variations'] ?? [])) {
      variations?.add(Variations.fromJson(element));
    }
    print("---------4");
    avaiableProperties = [];
    for (var element in (json['avaiableProperties'] ?? [])) {
      avaiableProperties?.add(AvaiableProperties.fromJson(element));
    }
    print("---------5");
    brandName = json['brandName']??"0";
    print("---------6");
    brandImage = json['brandImage']?? "0";
    print("---------7");
  }
}
