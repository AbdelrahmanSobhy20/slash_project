import 'package:slashtraining/features/product_details/data/models/product_varient_images_details.dart';

class Variations {
  int? id;
  int? price;
  int? quantity;
  bool? inStock;
  List<ProductVarientImagesDetails>? productVarientImagesDetails;

  Variations(
      {
      this.id,
      this.price,
      this.quantity,
      this.inStock,
      this.productVarientImagesDetails});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    price = json['price']??0;
    quantity = json['quantity']??0;
    inStock = json['inStock'];
    productVarientImagesDetails = [];
    for (var element in (json['ProductVarientImages'] as List)) {
      productVarientImagesDetails?.add(ProductVarientImagesDetails.fromJson(element));
    }
  }
}
