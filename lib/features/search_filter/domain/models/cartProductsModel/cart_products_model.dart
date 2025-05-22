class CartProductsModel {
  final List<CartItemModel> items;

  CartProductsModel({required this.items});

  factory CartProductsModel.fromJson(dynamic json) {
    return CartProductsModel(
      items: (json as List<dynamic>).map((e) => CartItemModel.fromJson(e)).toList(),
    );
  }
}

class CartItemModel {
  final int id;
  final int userId;
  final int itemId;
  final int quantity;
  final double price;
  final ItemModel item;

  CartItemModel({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.quantity,
    required this.price,
    required this.item,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      id: json['id'],
      userId: json['user_id'],
      itemId: json['item_id'],
      quantity: json['quantity'],
      price: json['price']?.toDouble() ?? 0.0,
      item: ItemModel.fromJson(json['item']),
    );
  }
}

class ItemModel {
  final int id;
  final String name;
  final String? description;
  final String image;
  final double price;
  final int stock;
  final String? storeName;
  final List<ImageModel> images;

  ItemModel({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.price,
    required this.stock,
    this.storeName,
    required this.images,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'],
      name: json['name'] ?? '',
      description: json['description'],
      image: json['image'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
      stock: json['stock'] ?? 0,
      storeName: json['store_name'],
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e))
          .toList(),
    );
  }
}

class ImageModel {
  final String img;
  final String storage;

  ImageModel({
    required this.img,
    required this.storage,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      img: json['img'] ?? '',
      storage: json['storage'] ?? '',
    );
  }
}
