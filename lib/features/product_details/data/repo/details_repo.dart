import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:slashtraining/features/product_details/data/models/data_map.dart';

class DetailsRepo {
  Future<DataMap> getProductDetails(int id) async {
    http.Response response = await http.get(Uri.parse("https://slash-backend.onrender.com/product/$id"));
    if (response.statusCode <= 299 && response.statusCode >= 200) {
      final decodedResponse = jsonDecode(response.body);
      print(decodedResponse);
      DataMap dataMap = DataMap.fromJson(decodedResponse);
      print(dataMap);
      return dataMap;
    } else {
      print(response.statusCode);
      throw ("RequestFailure" + response.body);
    }
  }
}