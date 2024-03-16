import 'package:slashtraining/features/product_details/data/models/product_details_model.dart';

class DataMap {
  ProductDetailsModel? data;
  String? message;
  int? statusCode;

  DataMap(
      {required this.data, required this.message, required this.statusCode});

  DataMap.fromJson(Map<String, dynamic> json) {
    data = ProductDetailsModel.fromJson(json['data']);
    print("=======1");
    message = json['message']??"0";
    print("=======2");
    statusCode = json['statusCode']??"0";
    print("=======3");
  }
//
}
