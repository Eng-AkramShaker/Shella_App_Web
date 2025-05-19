class Item {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  double? cost;
  double? price;
  int? storeId;
  String? storeName;
  String? unitType;

  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.cost,
    this.price,
    this.storeId,
    this.storeName,
    this.unitType,
  });

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    categoryId = json['category_id'];

    // Handle different numeric types
    if (json['cost'] != null) {
      cost = (json['cost'] is int)
          ? (json['cost'] as int).toDouble()
          : json['cost']?.toDouble();
    }

    if (json['price'] != null) {
      price = (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : json['price']?.toDouble();
    }

    storeId = json['store_id'];
    storeName = json['store_name'];
    unitType = json['unit_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (description != null) data['description'] = description;
    if (image != null) data['image'] = image;
    if (categoryId != null) data['category_id'] = categoryId;
    if (cost != null) data['cost'] = cost;
    if (price != null) data['price'] = price;
    if (storeId != null) data['store_id'] = storeId;
    if (storeName != null) data['store_name'] = storeName;
    if (unitType != null) data['unit_type'] = unitType;
    return data;
  }
}

