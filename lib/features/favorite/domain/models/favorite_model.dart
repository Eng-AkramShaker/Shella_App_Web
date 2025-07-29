class FavouriteModel {
  FavouriteModel({
    required this.item,
    required this.store,
  });

  final List<Item> item;
  final List<dynamic> store;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) {
    return FavouriteModel(
      item: json["item"] == null ? [] : List<Item>.from(json["item"]!.map((x) => Item.fromJson(x))),
      store: json["store"] == null ? [] : List<dynamic>.from(json["store"]!.map((x) => x)),
    );
  }
}

class Item {
  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.categoryId,
    required this.brandId,
    required this.categoryIds,
    required this.variations,
    required this.addOns,
    required this.attributes,
    required this.choiceOptions,
    required this.pMargin,
    required this.cost,
    required this.price,
    required this.catExclude,
    required this.storeExclude,
    required this.tax,
    required this.taxClassId,
    required this.profitClassId,
    required this.taxCal,
    required this.taxType,
    required this.discount,
    required this.discountType,
    required this.availableTimeStarts,
    required this.availableTimeEnds,
    required this.veg,
    required this.status,
    required this.storeId,
    required this.createdAt,
    required this.updatedAt,
    required this.orderCount,
    required this.avgRating,
    required this.ratingCount,
    required this.moduleId,
    required this.itemSiteId,
    required this.stock,
    required this.unitId,
    required this.images,
    required this.foodVariations,
    required this.slug,
    required this.recommended,
    required this.organic,
    required this.maximumCartQuantity,
    required this.isApproved,
    required this.isHalal,
    required this.itemCode,
    required this.storeSiteId,
    required this.storeName,
    required this.isCampaign,
    required this.moduleType,
    required this.zoneId,
    required this.flashSale,
    required this.storeDiscount,
    required this.scheduleOrder,
    required this.minDeliveryTime,
    required this.maxDeliveryTime,
    required this.commonConditionId,
    required this.isBasic,
    required this.isPrescriptionRequired,
    required this.halalTagStatus,
    required this.nutritionsName,
    required this.allergiesName,
    required this.genericName,
    required this.unitType,
    required this.imageFullUrl,
    required this.imagesFullUrl,
    required this.storage,
    required this.translations,
    required this.module,
    required this.ecommerceItemDetails,
    required this.unit,
  });

  var id;
  final String? name;
  final String? description;
  final String? image;
  var categoryId;
  var brandId;
  final List<CategoryId> categoryIds;
  final List<dynamic> variations;
  final List<dynamic> addOns;
  final List<dynamic> attributes;
  final List<dynamic> choiceOptions;
  var pMargin;
  var cost;
  var price;
  final bool? catExclude;
  final bool? storeExclude;
  var tax;
  final dynamic taxClassId;
  final dynamic profitClassId;
  final String? taxCal;
  final String? taxType;
  var discount;
  final String? discountType;
  final String? availableTimeStarts;
  final String? availableTimeEnds;
  var veg;
  var status;
  var storeId;
  final String? createdAt;
  final String? updatedAt;
  var orderCount;
  var avgRating;
  var ratingCount;
  var moduleId;
  final String? itemSiteId;
  var stock;
  var unitId;
  final List<Image> images;
  final List<dynamic> foodVariations;
  final String? slug;
  var recommended;
  var organic;
  var maximumCartQuantity;
  var isApproved;
  var isHalal;
  final String? itemCode;
  final String? storeSiteId;
  final String? storeName;
  var isCampaign;
  final String? moduleType;
  var zoneId;
  var flashSale;
  var storeDiscount;
  final bool? scheduleOrder;
  var minDeliveryTime;
  var maxDeliveryTime;
  var commonConditionId;
  var isBasic;
  var isPrescriptionRequired;
  var halalTagStatus;
  final List<dynamic> nutritionsName;
  final List<dynamic> allergiesName;
  final List<dynamic> genericName;
  final String? unitType;
  final String? imageFullUrl;
  final List<String> imagesFullUrl;
  final List<Storage> storage;
  final List<dynamic> translations;
  final Module? module;
  final dynamic ecommerceItemDetails;
  final Unit? unit;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      image: json["image"],
      categoryId: json["category_id"],
      brandId: json["brand_id"],
      categoryIds: json["category_ids"] == null ? [] : List<CategoryId>.from(json["category_ids"]!.map((x) => CategoryId.fromJson(x))),
      variations: json["variations"] == null ? [] : List<dynamic>.from(json["variations"]!.map((x) => x)),
      addOns: json["add_ons"] == null ? [] : List<dynamic>.from(json["add_ons"]!.map((x) => x)),
      attributes: json["attributes"] == null ? [] : List<dynamic>.from(json["attributes"]!.map((x) => x)),
      choiceOptions: json["choice_options"] == null ? [] : List<dynamic>.from(json["choice_options"]!.map((x) => x)),
      pMargin: json["p_margin"],
      cost: json["cost"],
      price: json["price"],
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
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      orderCount: json["order_count"],
      avgRating: json["avg_rating"],
      ratingCount: json["rating_count"],
      moduleId: json["module_id"],
      itemSiteId: json["item_site_id"],
      stock: json["stock"],
      unitId: json["unit_id"],
      images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
      foodVariations: json["food_variations"] == null ? [] : List<dynamic>.from(json["food_variations"]!.map((x) => x)),
      slug: json["slug"],
      recommended: json["recommended"],
      organic: json["organic"],
      maximumCartQuantity: json["maximum_cart_quantity"],
      isApproved: json["is_approved"],
      isHalal: json["is_halal"],
      itemCode: json["item_code"],
      storeSiteId: json["store_site_id"],
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
      nutritionsName: json["nutritions_name"] == null ? [] : List<dynamic>.from(json["nutritions_name"]!.map((x) => x)),
      allergiesName: json["allergies_name"] == null ? [] : List<dynamic>.from(json["allergies_name"]!.map((x) => x)),
      genericName: json["generic_name"] == null ? [] : List<dynamic>.from(json["generic_name"]!.map((x) => x)),
      unitType: json["unit_type"],
      imageFullUrl: json["image_full_url"],
      imagesFullUrl: json["images_full_url"] == null ? [] : List<String>.from(json["images_full_url"]!.map((x) => x)),
      storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
      translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
      module: json["module"] == null ? null : Module.fromJson(json["module"]),
      ecommerceItemDetails: json["ecommerce_item_details"],
      unit: json["unit"] == null ? null : Unit.fromJson(json["unit"]),
    );
  }
}

class CategoryId {
  CategoryId({
    required this.id,
    required this.position,
    required this.name,
  });

  final String? id;
  var position;
  final String? name;

  factory CategoryId.fromJson(Map<String, dynamic> json) {
    return CategoryId(
      id: json["id"],
      position: json["position"],
      name: json["name"],
    );
  }
}

class Image {
  Image({
    required this.img,
    required this.storage,
  });

  final String? img;
  final String? storage;

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      img: json["img"],
      storage: json["storage"],
    );
  }
}

class Module {
  Module({
    required this.id,
    required this.moduleName,
    required this.moduleType,
    required this.thumbnail,
    required this.status,
    required this.storesCount,
    required this.createdAt,
    required this.updatedAt,
    required this.icon,
    required this.themeId,
    required this.description,
    required this.allZoneService,
    required this.iconFullUrl,
    required this.thumbnailFullUrl,
    required this.storage,
    required this.translations,
  });

  var id;
  final String? moduleName;
  final String? moduleType;
  final String? thumbnail;
  final String? status;
  var storesCount;
  final String? createdAt;
  final String? updatedAt;
  final String? icon;
  var themeId;
  final String? description;
  var allZoneService;
  final String? iconFullUrl;
  final String? thumbnailFullUrl;
  final List<Storage> storage;
  final List<dynamic> translations;

  factory Module.fromJson(Map<String, dynamic> json) {
    return Module(
      id: json["id"],
      moduleName: json["module_name"],
      moduleType: json["module_type"],
      thumbnail: json["thumbnail"],
      status: json["status"],
      storesCount: json["stores_count"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      icon: json["icon"],
      themeId: json["theme_id"],
      description: json["description"],
      allZoneService: json["all_zone_service"],
      iconFullUrl: json["icon_full_url"],
      thumbnailFullUrl: json["thumbnail_full_url"],
      storage: json["storage"] == null ? [] : List<Storage>.from(json["storage"]!.map((x) => Storage.fromJson(x))),
      translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
    );
  }
}

class Storage {
  Storage({
    required this.id,
    required this.dataType,
    required this.dataId,
    required this.key,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  var id;
  final String? dataType;
  final String? dataId;
  final String? key;
  final String? value;
  final String? createdAt;
  final String? updatedAt;

  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      id: json["id"],
      dataType: json["data_type"],
      dataId: json["data_id"],
      key: json["key"],
      value: json["value"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }
}

class Unit {
  Unit({
    required this.id,
    required this.unit,
    required this.createdAt,
    required this.updatedAt,
    required this.translations,
  });

  var id;
  final String? unit;
  final String? createdAt;
  final String? updatedAt;
  final List<dynamic> translations;

  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json["id"],
      unit: json["unit"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      translations: json["translations"] == null ? [] : List<dynamic>.from(json["translations"]!.map((x) => x)),
    );
  }
}
