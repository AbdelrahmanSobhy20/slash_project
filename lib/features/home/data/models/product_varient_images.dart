class ProductVarientImages {
  late int id;
  String? image_path;
  late int product_varient_id;

  ProductVarientImages({
    required this.id,
    required this.image_path,
    required this.product_varient_id,

  });

  ProductVarientImages.fromJson(Map<String, dynamic> json) {
    id = json['id']??0;
    //print("00000000");
    image_path = json['image_path'];
    product_varient_id = json['product_varient_id']??0;
    //print("5555555555");
  }
}
