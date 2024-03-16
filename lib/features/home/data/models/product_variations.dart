import 'package:slashtraining/features/home/data/models/product_varient_images.dart';

class ProductVariations {
  int? id;
  int? product_id;
  int? price;
  int? quantity;
  bool? is_default;
  List<ProductVarientImages> ?productVarientImages;

  ProductVariations({
    required this.id,
    required this.product_id,
    required this.price,
    required this.quantity,
    required this.is_default,
    required this.productVarientImages,
  });

  ProductVariations.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    //print("P.v1");
    product_id = json['product_id']??0;
    price = json['price']??0;
    quantity = json['quantity']??0;
    is_default = json['is_default'];
    productVarientImages = [];
    (json['ProductVarientImages'] as List).forEach((element) {
      productVarientImages?.add(ProductVarientImages.fromJson(element));
    });
    //print("P.v2");
  }
}
