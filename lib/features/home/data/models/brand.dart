class Brand {
  int? id;
  String? brand_type;
  String? brand_name;
  String? brand_facebook_page_link;
  String? brand_instagram_page_link;
  String? brand_website_link;
  String? brand_mobile_number;
  String? brand_email_address;
  String? tax_id_number;
  String? brand_description;
  String? brand_logo_image_path;

  Brand({
    required this.id,
    required this.brand_type,
    required this.brand_name,
    required this.brand_facebook_page_link,
    required this.brand_instagram_page_link,
    required this.brand_website_link,
    required this.brand_mobile_number,
    required this.brand_email_address,
    required this.tax_id_number,
    required this.brand_description,
    required this.brand_logo_image_path,
  });

  Brand.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    brand_type = json['brand_type'];
    brand_name = json['brand_name'];
    brand_facebook_page_link = json['brand_facebook_page_link'];
    brand_instagram_page_link = json['brand_instagram_page_link'];
    brand_website_link = json['brand_website_link'];
    brand_mobile_number = json['brand_mobile_number'];
    brand_email_address = json['brand_email_address'];
    tax_id_number = json['tax_id_number'];
    brand_description = json['brand_description'];
    brand_logo_image_path = json['brand_logo_image_path'];
  }
}
