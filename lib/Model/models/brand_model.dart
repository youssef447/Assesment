class Brand {
  final int id;
  final String brandName;
  final String brandType;
  final String? brandFacebookPageLink;
  final String? brandInstagramPageLink;
  final String? brandMobileNumber;

  final String brandEmailAddress;
  final String brandDescription;
  final String? brandLogoImagePath;

  final String? brandWebsiteLink, taxIdNumber;

  Brand({
    required this.id,
    required this.brandName,
    required this.brandType,
    this.brandFacebookPageLink,
    this.brandInstagramPageLink,
    required this.brandMobileNumber,
    required this.brandEmailAddress,
    required this.brandDescription,
    required this.brandLogoImagePath,
    this.brandWebsiteLink,
    this.taxIdNumber,
  });

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['id'],
      brandName: json['brand_name'],
      brandType: json['brand_type'],
      brandFacebookPageLink: json['brand_facebook_page_link'],
      brandInstagramPageLink: json[''],
      brandMobileNumber: json['brand_mobile_number'],
      brandEmailAddress: json['brand_email_address'],
      brandDescription: json['brand_description'],
      brandLogoImagePath: json['brand_logo_image_path'],
    );
  }
}
