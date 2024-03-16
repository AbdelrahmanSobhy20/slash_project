class ProductVarientImagesDetails {
  int? id;
  String? image_path;
  int? product_varient_id;

  ProductVarientImagesDetails(
      {this.id, this.image_path, this.product_varient_id});

  ProductVarientImagesDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    image_path = json['image_path'] ?? "0";
    product_varient_id = json['product_varient_id'] ?? 0;
  }
}
