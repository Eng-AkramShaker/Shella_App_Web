class BannerModel {
  final int id;
  final String? title; // Make nullable
  final String? type; // Make nullable
  final String? image; // Make nullable
  final String? link; // Make nullable
  final dynamic store; // Use dynamic for mixed types (null or object)
  final dynamic item; // Use dynamic for mixed types (null or object)
  final String?
      imageUrlFull; // Make nullable, as you've confirmed it can be null

  BannerModel({
    required this.id,
    this.title,
    this.type,
    this.image,
    this.link,
    this.store,
    this.item,
    this.imageUrlFull, // No longer required if it can be null
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      title: json['title'],
      type: json['type'],
      image: json['image'],
      link: json['link'],
      store: json['store'],
      item: json['item'],
      imageUrlFull: json['image_full_url'], // Will be null if it's null in JSON
    );
  }
}
