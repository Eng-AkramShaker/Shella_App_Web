class Product {
  final int id;
  final String name;
  final String image;
  final int price;
  final int cost;
  final int stock;
  final String unit;
  final int categoryId;
  final List<Category> categoryIds;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.cost,
    required this.stock,
    required this.unit,
    required this.categoryId,
    required this.categoryIds,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: (json['id'] as num).toInt(),
      name: json['name'] ?? '',
      image: json['image_full_url'] ?? '',
      price: (json['price'] as num).toInt(),
      cost: (json['cost'] as num).toInt(),
      stock: (json['stock'] as num).toInt(),
      unit: json['unit_type'] ?? '',
      categoryId: (json['category_id'] as num).toInt(),
      categoryIds: (json['category_ids'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
    );
  }
}

class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: int.parse(json['id'].toString()),
      name: json['name'],
    );
  }
}
