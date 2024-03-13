import 'product_varaition_model.dart';

class ProductDetailsModel {
  late final int id, brandId;
  late final String? productLogoUrl;
  late final String name, description, brandName, brandImage;
  late final int? rating;
  late final List<ProductVariationModel> variations;
  List<ProductProperties> properties = [];

  ProductDetailsModel({
    required this.id,
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.name,
    required this.description,
    this.productLogoUrl,
    this.rating,
    required this.properties,
    required this.variations,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      brandImage: json['brandImage'],
      brandName: json['brandName'],
      brandId: json['brand_id'],
      name: json['name'],
      description: json['description'],
      rating: json['product_rating'],
      productLogoUrl: json['product_logo_url'],
      variations: (json['variations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
      properties: (json['avaiableProperties'] as List<dynamic>)
          .map((e) => ProductProperties.fromJson(e))
          .toList(),
    );
  }
}

class ProductProperties {
  String property;
  List< dynamic> value;

  ProductProperties({
    required this.property,
    required this.value,
  });
  factory ProductProperties.fromJson(Map<dynamic, dynamic> json) {
    return ProductProperties(
      property: json['property'],
      value: (json['values'] as List<dynamic>)
          
    );
  }
}
