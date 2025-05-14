class CategoryModel {
  final int id;
  final String name;
  final String image;
  final String slug;
  final String imageFullUrl;
  final String parentName;
  final String parentImage;
  final String catSiteId;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.slug,
    required this.imageFullUrl,
    required this.parentName,
    required this.parentImage,
    required this.catSiteId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      slug: json['slug'],
      imageFullUrl: json['image_full_url'],
      parentName: json['parent']['name'],
      parentImage: json['parent']['image'],
      catSiteId: json['cat_site_id'],
    );
  }
}
