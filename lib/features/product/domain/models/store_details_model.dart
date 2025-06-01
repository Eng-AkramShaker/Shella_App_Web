class StoreDetailsModel {
  final int id;
  final String name;
  final String logoUrl;
  final String coverPhotoUrl;
  final String address;
  final String deliveryTime;
  final List<CategoryModel> categories;

  StoreDetailsModel({
    required this.id,
    required this.name,
    required this.logoUrl,
    required this.coverPhotoUrl,
    required this.address,
    required this.deliveryTime,
    required this.categories,
  });

  factory StoreDetailsModel.fromJson(Map<String, dynamic> json) {
    return StoreDetailsModel(
      id: json['id'],
      name: json['name'],
      logoUrl: json['logo_full_url'] ?? json['logo'],
      coverPhotoUrl: json['cover_photo'],
      address: json['address'],
      deliveryTime: json['delivery_time'],
      categories: (json['category_details'] as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList(),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;
  final String imageUrl;

  CategoryModel({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['image_full_url'] ?? '',
    );
  }
}

class ProductModel {
  final int id;
  final String name;
  final String imageUrl;
  final int price;

  ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? '',
      imageUrl: json['image_full_url'] ?? '',
      price: (json['price'] as num).toInt(),
    );
  }
}
