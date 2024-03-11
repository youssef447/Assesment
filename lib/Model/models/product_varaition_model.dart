class ProductVariationModel {
  int? id, productId, quantity;
  int? price;
  bool? isDefault;
  List<ProductVariantImage>? images;
  List<ProductPropertiesValues>? properties;
  ProductVariationModel(
      {this.id,
      this.productId,
      this.quantity,
      this.isDefault,
      this.price,
      this.properties,
      this.images});

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['id'],
      productId: json['product_id'],
      quantity: json['quantity'],
      isDefault: json['is_default'],
      price: json['price'],
      images: (json['ProductVarientImages'] as List<dynamic>)
          .map((e) => ProductVariantImage.fromJson(e))
          .toList(),
      properties: json['productPropertiesValues'] != null
          ? (json['productPropertiesValues'] as List<dynamic>)
              .map((e) => ProductPropertiesValues.fromJson(e))
              .toList()
          : [],
    );
  }
}

class ProductVariantImage {
  final int? id;
  final String imagePath;
  final int? productVariantId;
  ProductVariantImage({
    required this.id,
    required this.imagePath,
    required this.productVariantId,
  });
  factory ProductVariantImage.fromJson(Map<String, dynamic> json) {
    return ProductVariantImage(
      id: json['id'],
      imagePath: json['image_path'],
      productVariantId: json['product_varient_id'],
    );
  }
}

class ProductPropertiesValues {
  String property, value;

  ProductPropertiesValues({
    required this.property,
    required this.value,
  });
  factory ProductPropertiesValues.fromJson(Map<String, dynamic> json) {
    return ProductPropertiesValues(
      property: json['property'],
      value: json['value'],
    );
  }
}
