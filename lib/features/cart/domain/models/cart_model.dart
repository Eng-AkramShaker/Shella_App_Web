import 'dart:convert';

// List<CartItem> cartItemFromJson(String str) =>
//     List<CartItem>.from(json.decode(str).map((x) => CartItem.fromJson(x)));

// String cartItemToJson(List<CartItem> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartItem {
  int? id;
  int? userId;
  int? moduleId;
  int? itemId;
  bool? isGuest;
  List<dynamic>? addOnIds;
  List<dynamic>? addOnQtys;
  String? itemType;
  double? price;
  int? quantity;
  List<dynamic>? variation;
  DateTime? createdAt;
  DateTime? updatedAt;
  Item? item;

  CartItem({
    this.id,
    this.userId,
    this.moduleId,
    this.itemId,
    this.isGuest,
    this.addOnIds,
    this.addOnQtys,
    this.itemType,
    this.price,
    this.quantity,
    this.variation,
    this.createdAt,
    this.updatedAt,
    this.item,
  });

  CartItem copyWith({
    int? id,
    int? userId,
    int? moduleId,
    int? itemId,
    bool? isGuest,
    List<dynamic>? addOnIds,
    List<dynamic>? addOnQtys,
    String? itemType,
    double? price,
    int? quantity,
    List<dynamic>? variation,
    DateTime? createdAt,
    DateTime? updatedAt,
    Item? item,
  }) {
    return CartItem(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      moduleId: moduleId ?? this.moduleId,
      itemId: itemId ?? this.itemId,
      isGuest: isGuest ?? this.isGuest,
      addOnIds: addOnIds ?? this.addOnIds,
      addOnQtys: addOnQtys ?? this.addOnQtys,
      itemType: itemType ?? this.itemType,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      variation: variation ?? this.variation,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      item: item ?? this.item,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    id: json["id"],
    userId: json["user_id"],
    moduleId: json["module_id"],
    itemId: json["item_id"],
    isGuest: json["is_guest"],
    addOnIds: json["add_on_ids"] == null
        ? []
        : List<dynamic>.from(json["add_on_ids"]!.map((x) => x)),
    addOnQtys: json["add_on_qtys"] == null
        ? []
        : List<dynamic>.from(json["add_on_qtys"]!.map((x) => x)),
    itemType: json["item_type"],
    price: json["price"]?.toDouble(),
    quantity: json["quantity"],
    variation: json["variation"] == null
        ? []
        : List<dynamic>.from(json["variation"]!.map((x) => x)),
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "module_id": moduleId,
    "item_id": itemId,
    "is_guest": isGuest,
    "add_on_ids":
    addOnIds == null ? [] : List<dynamic>.from(addOnIds!.map((x) => x)),
    "add_on_qtys": addOnQtys == null
        ? []
        : List<dynamic>.from(addOnQtys!.map((x) => x)),
    "item_type": itemType,
    "price": price,
    "quantity": quantity,
    "variation": variation == null
        ? []
        : List<dynamic>.from(variation!.map((x) => x)),
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "item": item?.toJson(),
  };
}

class Item {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  int? brandId;
  List<CategoryId>? categoryIds;
  List<dynamic>? variations;
  String? addOns;
  List<dynamic>? attributes;
  List<dynamic>? choiceOptions;
  int? pMargin;
  double? cost;
  double? price;
  bool? catExclude;
  bool? storeExclude;
  int? tax;
  dynamic taxClassId;
  dynamic profitClassId;
  String? taxCal;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  int? moduleId;
  String? itemSiteId;
  int? stock;
  int? unitId;
  List<Image>? images;
  List<dynamic>? foodVariations;
  String? slug;
  int? recommended;
  int? organic;
  int? maximumCartQuantity;
  int? isApproved;
  int? isHalal;
  String? itemCode;
  String? storeSiteId;
  List<dynamic>? addons;
  String? storeName;
  int? isCampaign;
  String? moduleType;
  int? zoneId;
  int? flashSale;
  int? storeDiscount;
  bool? scheduleOrder;
  int? minDeliveryTime;
  int? maxDeliveryTime;
  int? commonConditionId;
  int? isBasic;
  int? isPrescriptionRequired;
  int? halalTagStatus;
  List<dynamic>? nutritionsName;
  List<dynamic>? allergiesName;
  List<dynamic>? genericName;
  String? unitType;
  String? imageFullUrl;
  List<String>? imagesFullUrl;
  List<Storage>? storage;
  List<dynamic>? translations;
  Module? module;
  dynamic ecommerceItemDetails;
  Unit? unit;

  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.categoryId,
    this.brandId,
    this.categoryIds,
    this.variations,
    this.addOns,
    this.attributes,
    this.choiceOptions,
    this.pMargin,
    this.cost,
    this.price,
    this.catExclude,
    this.storeExclude,
    this.tax,
    this.taxClassId,
    this.profitClassId,
    this.taxCal,
    this.taxType,
    this.discount,
    this.discountType,
    this.availableTimeStarts,
    this.availableTimeEnds,
    this.veg,
    this.status,
    this.storeId,
    this.createdAt,
    this.updatedAt,
    this.orderCount,
    this.avgRating,
    this.ratingCount,
    this.moduleId,
    this.itemSiteId,
    this.stock,
    this.unitId,
    this.images,
    this.foodVariations,
    this.slug,
    this.recommended,
    this.organic,
    this.maximumCartQuantity,
    this.isApproved,
    this.isHalal,
    this.itemCode,
    this.storeSiteId,
    this.addons,
    this.storeName,
    this.isCampaign,
    this.moduleType,
    this.zoneId,
    this.flashSale,
    this.storeDiscount,
    this.scheduleOrder,
    this.minDeliveryTime,
    this.maxDeliveryTime,
    this.commonConditionId,
    this.isBasic,
    this.isPrescriptionRequired,
    this.halalTagStatus,
    this.nutritionsName,
    this.allergiesName,
    this.genericName,
    this.unitType,
    this.imageFullUrl,
    this.imagesFullUrl,
    this.storage,
    this.translations,
    this.module,
    this.ecommerceItemDetails,
    this.unit,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    categoryIds: json["category_ids"] == null
        ? []
        : List<CategoryId>.from(
        json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
    variations: json["variations"] == null
        ? []
        : List<dynamic>.from(json["variations"]!.map((x) => x)),
    addOns: json["add_ons"],
    attributes: json["attributes"] == null
        ? []
        : List<dynamic>.from(json["attributes"]!.map((x) => x)),
    choiceOptions: json["choice_options"] == null
        ? []
        : List<dynamic>.from(json["choice_options"]!.map((x) => x)),
    pMargin: json["p_margin"],
    cost: json["cost"]?.toDouble(),
    price: json["price"]?.toDouble(),
    catExclude: json["cat_exclude"],
    storeExclude: json["store_exclude"],
    tax: json["tax"],
    taxClassId: json["tax_class_id"],
    profitClassId: json["profit_class_id"],
    taxCal: json["tax_cal"],
    taxType: json["tax_type"],
    discount: json["discount"],
    discountType: json["discount_type"],
    availableTimeStarts: json["available_time_starts"],
    availableTimeEnds: json["available_time_ends"],
    veg: json["veg"],
    status: json["status"],
    storeId: json["store_id"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    orderCount: json["order_count"],
    avgRating: json["avg_rating"],
    ratingCount: json["rating_count"],
    moduleId: json["module_id"],
    itemSiteId: json["item_site_id"],
    stock: json["stock"],
    unitId: json["unit_id"],
    images: json["images"] == null
        ? []
        : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
    foodVariations: json["food_variations"] == null
        ? []
        : List<dynamic>.from(json["food_variations"]!.map((x) => x)),
    slug: json["slug"],
    recommended: json["recommended"],
    organic: json["organic"],
    maximumCartQuantity: json["maximum_cart_quantity"],
    isApproved: json["is_approved"],
    isHalal: json["is_halal"],
    itemCode: json["item_code"],
    storeSiteId: json["store_site_id"],
    addons: json["addons"] == null
        ? []
        : List<dynamic>.from(json["addons"]!.map((x) => x)),
    storeName: json["store_name"],
    isCampaign: json["is_campaign"],
    moduleType: json["module_type"],
    zoneId: json["zone_id"],
    flashSale: json["flash_sale"],
    storeDiscount: json["store_discount"],
    scheduleOrder: json["schedule_order"],
    minDeliveryTime: json["min_delivery_time"],
    maxDeliveryTime: json["max_delivery_time"],
    commonConditionId: json["common_condition_id"],
    isBasic: json["is_basic"],
    isPrescriptionRequired: json["is_prescription_required"],
    halalTagStatus: json["halal_tag_status"],
    nutritionsName: json["nutritions_name"] == null
        ? []
        : List<dynamic>.from(json["nutritions_name"]!.map((x) => x)),
    allergiesName: json["allergies_name"] == null
        ? []
        : List<dynamic>.from(json["allergies_name"]!.map((x) => x)),
    genericName: json["generic_name"] == null
        ? []
        : List<dynamic>.from(json["generic_name"]!.map((x) => x)),
    unitType: json["unit_type"],
    imageFullUrl: json["image_full_url"],
    imagesFullUrl: json["images_full_url"] == null
        ? []
        : List<String>.from(json["images_full_url"]!.map((x) => x)),
    storage: json["storage"] == null
        ? []
        : List<Storage>.from(
        json["storage"]!.map((x) => Storage.fromJson(x))),
    translations: json["translations"] == null
        ? []
        : List<dynamic>.from(json["translations"]!.map((x) => x)),
    module: json["module"] == null ? null : Module.fromJson(json["module"]),
    ecommerceItemDetails: json["ecommerce_item_details"],
    unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "category_id": categoryId,
    "brand_id": brandId,
    // "category_ids": categoryIds == null
    //     ? []
    //     : List<dynamic>.from(categoryIds!.map((x) => x.toJson())),
    // "variations": variations == null
    //     ? []
    //     : List<dynamic>.from(variations!.map((x) => x)),
    // "add_ons": addOns,
    // "attributes": attributes == null
    //     ? []
    //     : List<dynamic>.from(attributes!.map((x) => x)),
    // "choice_options": choiceOptions == null
    //     ? []
    //     : List<dynamic>.from(choiceOptions!.map((x) => x)),
    "p_margin": pMargin,
    "cost": cost,
    "price": price,
    "cat_exclude": catExclude,
    "store_exclude": storeExclude,
    "tax": tax,
    "tax_class_id": taxClassId,
    "profit_class_id": profitClassId,
    "tax_cal": taxCal,
    "tax_type": taxType,
    "discount": discount,
    "discount_type": discountType,
    "available_time_starts": availableTimeStarts,
    "available_time_ends": availableTimeEnds,
    "veg": veg,
    "status": status,
    "store_id": storeId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_count": orderCount,
    "avg_rating": avgRating,
    "rating_count": ratingCount,
    "module_id": moduleId,
    "item_site_id": itemSiteId,
    "stock": stock,
    "unit_id": unitId,
    "images": images == null
        ? []
        : List<dynamic>.from(images!.map((x) => x.toJson())),
    "food_variations": foodVariations == null
        ? []
        : List<dynamic>.from(foodVariations!.map((x) => x)),
    "slug": slug,
    "recommended": recommended,
    "organic": organic,
    "maximum_cart_quantity": maximumCartQuantity,
    "is_approved": isApproved,
    "is_halal": isHalal,
    "item_code": itemCode,
    "store_site_id": storeSiteId,
    // "addons":
    //     addons == null ? [] : List<dynamic>.from(addons!.map((x) => x)),
    "store_name": storeName,
    "is_campaign": isCampaign,
    "module_type": moduleType,
    "zone_id": zoneId,
    "flash_sale": flashSale,
    "store_discount": storeDiscount,
    "schedule_order": scheduleOrder,
    "min_delivery_time": minDeliveryTime,
    "max_delivery_time": maxDeliveryTime,
    "common_condition_id": commonConditionId,
    "is_basic": isBasic,
    "is_prescription_required": isPrescriptionRequired,
    "halal_tag_status": halalTagStatus,
    // "nutritions_name": nutritionsName == null
    //     ? []
    //     : List<dynamic>.from(nutritionsName!.map((x) => x)),
    // "allergies_name": allergiesName == null
    //     ? []
    //     : List<dynamic>.from(allergiesName!.map((x) => x)),
    // "generic_name": genericName == null
    //     ? []
    //     : List<dynamic>.from(genericName!.map((x) => x)),
    "unit_type": unitType,
    "image_full_url": imageFullUrl,
    "images_full_url": imagesFullUrl == null
        ? []
        : List<dynamic>.from(imagesFullUrl!.map((x) => x)),
    "storage": storage == null
        ? []
        : List<dynamic>.from(storage!.map((x) => x.toJson())),
    "translations": translations == null
        ? []
        : List<dynamic>.from(translations!.map((x) => x)),
    "module": module?.toJson(),
    "ecommerce_item_details": ecommerceItemDetails,
    "unit": unit?.toJson(),
  };
}

class CategoryId {
  String? id;
  int? position;
  String? name;

  CategoryId({
    this.id,
    this.position,
    this.name,
  });

  factory CategoryId.fromJson(Map<String, dynamic> json) => CategoryId(
    id: json["id"],
    position: json["position"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "position": position,
    "name": name,
  };
}

class Image {
  String? img;
  String? storage;

  Image({
    this.img,
    this.storage,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    img: json["img"],
    storage: json["storage"],
  );

  Map<String, dynamic> toJson() => {
    "img": img,
    "storage": storage,
  };
}

class Module {
  int? id;
  String? moduleName;
  String? moduleType;
  String? thumbnail;
  String? status;
  int? storesCount;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? icon;
  int? themeId;
  String? description;
  int? allZoneService;
  String? iconFullUrl;
  String? thumbnailFullUrl;
  List<Storage>? storage;
  List<dynamic>? translations;

  Module({
    this.id,
    this.moduleName,
    this.moduleType,
    this.thumbnail,
    this.status,
    this.storesCount,
    this.createdAt,
    this.updatedAt,
    this.icon,
    this.themeId,
    this.description,
    this.allZoneService,
    this.iconFullUrl,
    this.thumbnailFullUrl,
    this.storage,
    this.translations,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
    id: json["id"],
    moduleName: json["module_name"],
    moduleType: json["module_type"],
    thumbnail: json["thumbnail"],
    status: json["status"],
    storesCount: json["stores_count"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    icon: json["icon"],
    themeId: json["theme_id"],
    description: json["description"],
    allZoneService: json["all_zone_service"],
    iconFullUrl: json["icon_full_url"],
    thumbnailFullUrl: json["thumbnail_full_url"],
    storage: json["storage"] == null
        ? []
        : List<Storage>.from(
        json["storage"]!.map((x) => Storage.fromJson(x))),
    translations: json["translations"] == null
        ? []
        : List<dynamic>.from(json["translations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "module_name": moduleName,
    "module_type": moduleType,
    "thumbnail": thumbnail,
    "status": status,
    "stores_count": storesCount,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "icon": icon,
    "theme_id": themeId,
    "description": description,
    "all_zone_service": allZoneService,
    "icon_full_url": iconFullUrl,
    "thumbnail_full_url": thumbnailFullUrl,
    "storage": storage == null
        ? []
        : List<dynamic>.from(storage!.map((x) => x.toJson())),
    "translations": translations == null
        ? []
        : List<dynamic>.from(translations!.map((x) => x)),
  };
}

class Storage {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  DateTime? createdAt;
  DateTime? updatedAt;

  Storage({
    this.id,
    this.dataType,
    this.dataId,
    this.key,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory Storage.fromJson(Map<String, dynamic> json) => Storage(
    id: json["id"],
    dataType: json["data_type"],
    dataId: json["data_id"],
    key: json["key"],
    value: json["value"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "data_type": dataType,
    "data_id": dataId,
    "key": key,
    "value": value,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Unit {
  int? id;
  String? unit;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? translations;

  Unit({
    this.id,
    this.unit,
    this.createdAt,
    this.updatedAt,
    this.translations,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"],
    unit: json["unit"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    translations: json["translations"] == null
        ? []
        : List<dynamic>.from(json["translations"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "unit": unit,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "translations": translations == null
        ? []
        : List<dynamic>.from(translations!.map((x) => x)),
  };
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

class AddOn {
  final int id;
  final String name;

  AddOn({required this.id, required this.name});

  factory AddOn.fromJson(Map<String, dynamic> json) => AddOn(
    id: json["id"],
    name: json["name"],
  );
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
