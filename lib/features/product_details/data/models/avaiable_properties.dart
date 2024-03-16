import 'package:slashtraining/features/product_details/data/models/values.dart';

class AvaiableProperties {
  String? property;
  List<Values>? values;

  AvaiableProperties({
    this.property,
    this.values,
  });

  AvaiableProperties.fromJson(Map<String, dynamic> json) {
    property = json['property'];
    values = [];
    (json['values'] as List).forEach((element) {
      values?.add(Values.fromJson(element));
    });
  }
}
