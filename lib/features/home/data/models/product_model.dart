import 'dart:convert';
import 'package:slashtraining/features/home/data/models/data_list.dart';

class ProductModel {
  int? statusCode;
  String? message;
  List<DataList>? data;

  ProductModel(
      {required this.statusCode,
      required this.message,
      required this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    statusCode =int.parse(json["statusCode"].toString());
    //print("========1");
    message = json["message"];
    //print("=====2");
    data = [];
    (json['data']as List).forEach((element) {
      data?.add(DataList.fromJson(element));
    });
    //print("=====4");
  }

  Map<String, dynamic> toJson() {
    return {
      "statusCode": statusCode,
      "message": message,
      "data": jsonEncode(data),
    };
  }
}
