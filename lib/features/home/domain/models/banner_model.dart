class BannerModel {
  final int id;
  final String title;
  final String type;
  final String imageFullUrl;

  BannerModel({
    required this.id,
    required this.title,
    required this.type,
    required this.imageFullUrl,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      imageFullUrl: json['image_full_url'] as String,
    );
  }
}
