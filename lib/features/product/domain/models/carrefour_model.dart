class FoodCategory {
  final String? id;
  final String? storeId;
  final String title;
  final String? image;
  final String? thumbnailUrl;
  final String? mediaWebUrl;
  final String? mediaMobileUrl;
  final String? bgColor;
  final List<FoodCategory> subcategories;

  FoodCategory({
    this.id,
    this.storeId,
    required this.title,
    this.image,
    this.thumbnailUrl,
    this.mediaWebUrl,
    this.mediaMobileUrl,
    this.bgColor,
    required this.subcategories,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['id'] as String?,
      storeId: json['storeId'] as String?,
      title: json['title'] as String? ?? 'بدون عنوان',
      image: json['image'] as String?,
      thumbnailUrl: json['thumbnail']?['url'] as String?,
      mediaWebUrl: json['mediaWeb']?['url'] as String?,
      mediaMobileUrl: json['mediaMobile']?['url'] as String?,
      bgColor: json['bgColor'] as String?,
      subcategories: (json['subcategories'] as List<dynamic>?)
              ?.map((e) => FoodCategory.fromJson(e))
              .toList() ??
          [],
    );
  }
}
