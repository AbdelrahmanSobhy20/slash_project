import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class HomeRepo {
  Future<ProductModel> getProducts() async {
    const endpoint = "https://slash-backend.onrender.com/product";
    final http.Response response = await http.get(Uri.parse(endpoint));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      ProductModel productModel = ProductModel.fromJson(decodedResponse);
      return productModel;
    } else {
      print(response.statusCode);
      throw ("RequestFailure" + response.body);
    }
  }
}
