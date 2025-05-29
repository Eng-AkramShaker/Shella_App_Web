class DiscountProduct {
  final int id;
  final String name;
  final String description;
  final String image;
  final double price;
  final double discount;
  final String discountType;
  final int stock;
  final String storeName;

  DiscountProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.discount,
    required this.discountType,
    required this.stock,
    required this.storeName,
  });

  factory DiscountProduct.fromJson(Map<String, dynamic> json) {
    return DiscountProduct(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'غير معروف',
      description: json['description'] as String? ?? '',
      image: json['image'] as String? ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      discount: (json['discount'] as num?)?.toDouble() ?? 0.0,
      discountType: json['discount_type'] as String? ?? 'percent',
      stock: json['stock'] as int? ?? 0,
      storeName: json['store_name'] as String? ?? '',
    );
  }

  double get finalPrice => price - (price * discount / 100);
}
