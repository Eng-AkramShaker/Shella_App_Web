class CartItem {
  final int? id;
  final double? price;
  final double? discountedPrice;
  final List<Variation>? variation;
  final List<List<bool?>>? foodVariations;
  final double? discountAmount;
  final int? quantity;
  final List<AddOn>? addOnIds;
  final List<AddOns>? addOns;
  final bool? isCampaign;
  final int? stock;
  final Item? item;
  final int? quantityLimit;
  final bool? isLoading;

  CartItem({
    this.id,
    this.price,
    this.discountedPrice,
    this.variation,
    this.foodVariations,
    this.discountAmount,
    this.quantity,
    this.addOnIds,
    this.addOns,
    this.isCampaign,
    this.stock,
    this.item,
    this.quantityLimit,
    this.isLoading,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json["id"],
        price: _toDouble(json["price"]),
        discountedPrice: _toDouble(json["discounted_price"]),
        variation: _parseVariations(json["variation"]),
        foodVariations: _parseFoodVariations(json["food_variations"]),
        discountAmount: _toDouble(json["discount_amount"]),
        quantity: json["quantity"],
        addOnIds: _parseAddOns(json["add_on_ids"]),
        addOns: _parseAddOnsList(json["add_ons"]),
        isCampaign: json["is_campaign"],
        stock: json["stock"],
        item: Item.fromJson(json["item"]),
        quantityLimit: json["quantity_limit"],
        isLoading: json["is_loading"],
      );

  static double? _toDouble(dynamic value) =>
      value == null ? null : value.toDouble();

  static List<Variation>? _parseVariations(dynamic data) {
    if (data == null) return null;
    return List<Variation>.from(data.map((x) => Variation.fromJson(x)));
  }

  static List<List<bool?>>? _parseFoodVariations(dynamic data) {
    if (data == null) return null;
    return List<List<bool?>>.from(data.map(
      (x) => List<bool?>.from(x.map((y) => y)),
    ));
  }

  static List<AddOn>? _parseAddOns(dynamic data) {
    if (data == null) return null;
    return List<AddOn>.from(data.map((x) => AddOn.fromJson(x)));
  }

  static List<AddOns>? _parseAddOnsList(dynamic data) {
    if (data == null) return null;
    return List<AddOns>.from(data.map((x) => AddOns.fromJson(x)));
  }
}

class Variation {
  final String name;
  final String type;
  final List<String> values;

  Variation({
    required this.name,
    required this.type,
    required this.values,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
        name: json["name"],
        type: json["type"],
        values: List<String>.from(json["values"].map((x) => x)),
      );
}

class AddOn {
  final int id;
  final String name;

  AddOn({required this.id, required this.name});

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
        id: json["id"],
        name: json["name"],
      );
}

class AddOns {
  final int id;
  final String name;
  final double price;

  AddOns({
    required this.id,
    required this.name,
    required this.price,
  });

  factory AddOns.fromJson(Map<String, dynamic> json) => AddOns(
        id: json["id"],
        name: json["name"],
        price: json["price"].toDouble(),
      );
}

class Item {
  final int id;
  final String name;
  final String description;

  Item({
    required this.id,
    required this.name,
    required this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );
}
