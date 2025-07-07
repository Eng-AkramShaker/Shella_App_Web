class SectionModel {
  final int id;
  final String name;
  final String image;
  final String slug;
  final String? imageFullUrl;
  final String catSiteId;
  final List<SectionModel> childes;

  SectionModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    this.imageFullUrl,
    required this.catSiteId,
    required this.childes,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: json['id'],
      name: json['name'],
      image: json['image'] ?? '',
      slug: json['slug'] ?? '',
      imageFullUrl: json['image_full_url'],
      catSiteId: json['cat_site_id'] ?? '',
      childes: (json['childes'] as List<dynamic>?)
              ?.map((e) => SectionModel.fromJson(e))
              .toList() ??
          [],
    );
  }
}
