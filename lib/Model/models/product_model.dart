import 'brand_model.dart';
import 'product_varaition_model.dart';

class ProductModel {
  late final int id, brandId;
  late final String? productLogoUrl;
  late final String name, description, brandName;
  late final Brand brand;
  late final int? rating;
  late final List<ProductVariationModel> variations;

  ProductModel({
    required this.id,
    required this.brandId,
    required this.name,
    required this.description,
    required this.brand,
    this.productLogoUrl,
    this.rating,
    required this.variations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      brandId: json['brand_id'],
      name: json['name'],
      description: json['description'],
      brand: Brand.fromJson(json['Brands']),
      rating: json['product_rating'],
      productLogoUrl: json['product_logo_url'],
      variations: (json['ProductVariations'] as List<dynamic>)
          .map((e) => ProductVariationModel.fromJson(e))
          .toList(),
    );
  }
}

class ProductDetailsModel {
  late final int id, brandId;
  late final String? productLogoUrl;
  late final String name, description, brandName, brandImage;
  late final int? rating;
  late final List<ProductVariationModel> variations;

  ProductDetailsModel({
    required this.id,
    required this.brandId,
    required this.brandName,
    required this.brandImage,
    required this.name,
    required this.description,
    this.productLogoUrl,
    this.rating,
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
    );
  }
}
