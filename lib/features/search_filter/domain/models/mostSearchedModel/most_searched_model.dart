class MostSearchedModel {
  int? totalSize;
  int? limit;
  int? offset;
  List<Products>? products;

  MostSearchedModel({this.totalSize, this.limit, this.offset, this.products});

  MostSearchedModel.fromJson(Map<String, dynamic> json) {
    totalSize = json["total_size"];
    limit = json["limit"];
    offset = json["offset"];
    products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total_size"] = totalSize;
    data["limit"] = limit;
    data["offset"] = offset;
    if (products != null) {
      data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  String? name;
  String? description;
  String? image;
  int? categoryId;
  List<dynamic>? categoryIds;
  List<dynamic>? variations;
  List<dynamic>? addOns;
  List<dynamic>? attributes;
  List<dynamic>? choiceOptions;
  int? pMargin;
  dynamic cost;
  dynamic price;
  bool? catExclude;
  bool? storeExclude;
  int? tax;
  dynamic taxClassId;
  String? taxCal;
  String? taxType;
  int? discount;
  String? discountType;
  String? availableTimeStarts;
  String? availableTimeEnds;
  int? veg;
  int? status;
  int? storeId;
  String? createdAt;
  String? updatedAt;
  int? orderCount;
  int? avgRating;
  int? ratingCount;
  int? moduleId;
  String? itemSiteId;
  int? stock;
  int? unitId;
  List<Images>? images;
  List<dynamic>? foodVariations;
  String? slug;
  int? recommended;
  int? organic;
  int? maximumCartQuantity;
  int? isApproved;
  int? isHalal;
  String? itemCode;
  String? storeSiteId;
  int? tempAvailable;
  String? moduleType;
  String? storeName;
  int? isCampaign;
  int? zoneId;
  int? flashSale;
  int? storeDiscount;
  bool? scheduleOrder;
  String? deliveryTime;
  bool? freeDelivery;
  Unit? unit;
  int? minDeliveryTime;
  int? maxDeliveryTime;
  int? commonConditionId;
  int? brandId;
  int? isBasic;
  int? isPrescriptionRequired;
  int? halalTagStatus;
  List<dynamic>? nutritionsName;
  List<dynamic>? allergiesName;
  List<dynamic>? genericName;
  String? unitType;
  String? imageFullUrl;
  List<dynamic>? imagesFullUrl;
  List<Storage>? storage;
  List<dynamic>? translations;
  Module? module;
  dynamic ecommerceItemDetails;

  Products(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.categoryId,
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
      this.tempAvailable,
      this.moduleType,
      this.storeName,
      this.isCampaign,
      this.zoneId,
      this.flashSale,
      this.storeDiscount,
      this.scheduleOrder,
      this.deliveryTime,
      this.freeDelivery,
      this.unit,
      this.minDeliveryTime,
      this.maxDeliveryTime,
      this.commonConditionId,
      this.brandId,
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
      this.ecommerceItemDetails});

  Products.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    image = json["image"];
    categoryId = json["category_id"];
    categoryIds = json["category_ids"] ?? [];
    variations = json["variations"] ?? [];
    addOns = json["add_ons"] ?? [];
    attributes = json["attributes"] ?? [];
    choiceOptions = json["choice_options"] ?? [];
    pMargin = json["p_margin"];
    cost = json["cost"];
    price = json["price"];
    catExclude = json["cat_exclude"];
    storeExclude = json["store_exclude"];
    tax = json["tax"];
    taxClassId = json["tax_class_id"];
    taxCal = json["tax_cal"];
    taxType = json["tax_type"];
    discount = json["discount"];
    discountType = json["discount_type"];
    availableTimeStarts = json["available_time_starts"];
    availableTimeEnds = json["available_time_ends"];
    veg = json["veg"];
    status = json["status"];
    storeId = json["store_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    orderCount = json["order_count"];
    avgRating = json["avg_rating"];
    ratingCount = json["rating_count"];
    moduleId = json["module_id"];
    itemSiteId = json["item_site_id"];
    stock = json["stock"];
    unitId = json["unit_id"];
    images = json["images"] == null ? null : (json["images"] as List).map((e) => Images.fromJson(e)).toList();
    foodVariations = json["food_variations"] ?? [];
    slug = json["slug"];
    recommended = json["recommended"];
    organic = json["organic"];
    maximumCartQuantity = json["maximum_cart_quantity"];
    isApproved = json["is_approved"];
    isHalal = json["is_halal"];
    itemCode = json["item_code"];
    storeSiteId = json["store_site_id"];
    tempAvailable = json["temp_available"];
    moduleType = json["module_type"];
    storeName = json["store_name"];
    isCampaign = json["is_campaign"];
    zoneId = json["zone_id"];
    flashSale = json["flash_sale"];
    storeDiscount = json["store_discount"];
    scheduleOrder = json["schedule_order"];
    deliveryTime = json["delivery_time"];
    freeDelivery = json["free_delivery"];
    unit = json["unit"] == null ? null : Unit.fromJson(json["unit"]);
    minDeliveryTime = json["min_delivery_time"];
    maxDeliveryTime = json["max_delivery_time"];
    commonConditionId = json["common_condition_id"];
    brandId = json["brand_id"];
    isBasic = json["is_basic"];
    isPrescriptionRequired = json["is_prescription_required"];
    halalTagStatus = json["halal_tag_status"];
    nutritionsName = json["nutritions_name"] ?? [];
    allergiesName = json["allergies_name"] ?? [];
    genericName = json["generic_name"] ?? [];
    unitType = json["unit_type"];
    imageFullUrl = json["image_full_url"];
    imagesFullUrl = json["images_full_url"] == null ? null : List<dynamic>.from(json["images_full_url"]);
    storage = json["storage"] == null ? null : (json["storage"] as List).map((e) => Storage.fromJson(e)).toList();
    translations = json["translations"] ?? [];
    module = json["module"] == null ? null : Module.fromJson(json["module"]);
    ecommerceItemDetails = json["ecommerce_item_details"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["image"] = image;
    data["category_id"] = categoryId;
    if (categoryIds != null) {
      data["category_ids"] = categoryIds;
    }
    if (variations != null) {
      data["variations"] = variations;
    }
    if (addOns != null) {
      data["add_ons"] = addOns;
    }
    if (attributes != null) {
      data["attributes"] = attributes;
    }
    if (choiceOptions != null) {
      data["choice_options"] = choiceOptions;
    }
    data["p_margin"] = pMargin;
    data["cost"] = cost;
    data["price"] = price;
    data["cat_exclude"] = catExclude;
    data["store_exclude"] = storeExclude;
    data["tax"] = tax;
    data["tax_class_id"] = taxClassId;
    data["tax_cal"] = taxCal;
    data["tax_type"] = taxType;
    data["discount"] = discount;
    data["discount_type"] = discountType;
    data["available_time_starts"] = availableTimeStarts;
    data["available_time_ends"] = availableTimeEnds;
    data["veg"] = veg;
    data["status"] = status;
    data["store_id"] = storeId;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["order_count"] = orderCount;
    data["avg_rating"] = avgRating;
    data["rating_count"] = ratingCount;
    data["module_id"] = moduleId;
    data["item_site_id"] = itemSiteId;
    data["stock"] = stock;
    data["unit_id"] = unitId;
    if (images != null) {
      data["images"] = images?.map((e) => e.toJson()).toList();
    }
    if (foodVariations != null) {
      data["food_variations"] = foodVariations;
    }
    data["slug"] = slug;
    data["recommended"] = recommended;
    data["organic"] = organic;
    data["maximum_cart_quantity"] = maximumCartQuantity;
    data["is_approved"] = isApproved;
    data["is_halal"] = isHalal;
    data["item_code"] = itemCode;
    data["store_site_id"] = storeSiteId;
    data["temp_available"] = tempAvailable;
    data["module_type"] = moduleType;
    data["store_name"] = storeName;
    data["is_campaign"] = isCampaign;
    data["zone_id"] = zoneId;
    data["flash_sale"] = flashSale;
    data["store_discount"] = storeDiscount;
    data["schedule_order"] = scheduleOrder;
    data["delivery_time"] = deliveryTime;
    data["free_delivery"] = freeDelivery;
    if (unit != null) {
      data["unit"] = unit?.toJson();
    }
    data["min_delivery_time"] = minDeliveryTime;
    data["max_delivery_time"] = maxDeliveryTime;
    data["common_condition_id"] = commonConditionId;
    data["brand_id"] = brandId;
    data["is_basic"] = isBasic;
    data["is_prescription_required"] = isPrescriptionRequired;
    data["halal_tag_status"] = halalTagStatus;
    if (nutritionsName != null) {
      data["nutritions_name"] = nutritionsName;
    }
    if (allergiesName != null) {
      data["allergies_name"] = allergiesName;
    }
    if (genericName != null) {
      data["generic_name"] = genericName;
    }
    data["unit_type"] = unitType;
    data["image_full_url"] = imageFullUrl;
    if (imagesFullUrl != null) {
      data["images_full_url"] = imagesFullUrl;
    }
    if (storage != null) {
      data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
    if (translations != null) {
      data["translations"] = translations;
    }
    if (module != null) {
      data["module"] = module?.toJson();
    }
    data["ecommerce_item_details"] = ecommerceItemDetails;
    return data;
  }
}

class Module {
  int? id;
  String? moduleName;
  String? moduleType;
  String? thumbnail;
  String? status;
  int? storesCount;
  String? createdAt;
  String? updatedAt;
  String? icon;
  int? themeId;
  String? description;
  int? allZoneService;
  dynamic iconFullUrl;
  dynamic thumbnailFullUrl;
  List<Storage1>? storage;
  List<Translations1>? translations;

  Module(
      {this.id,
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
      this.translations});

  Module.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    moduleName = json["module_name"];
    moduleType = json["module_type"];
    thumbnail = json["thumbnail"];
    status = json["status"];
    storesCount = json["stores_count"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    icon = json["icon"];
    themeId = json["theme_id"];
    description = json["description"];
    allZoneService = json["all_zone_service"];
    iconFullUrl = json["icon_full_url"];
    thumbnailFullUrl = json["thumbnail_full_url"];
    storage = json["storage"] == null ? null : (json["storage"] as List).map((e) => Storage1.fromJson(e)).toList();
    translations = json["translations"] == null ? null : (json["translations"] as List).map((e) => Translations1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["module_name"] = moduleName;
    data["module_type"] = moduleType;
    data["thumbnail"] = thumbnail;
    data["status"] = status;
    data["stores_count"] = storesCount;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["icon"] = icon;
    data["theme_id"] = themeId;
    data["description"] = description;
    data["all_zone_service"] = allZoneService;
    data["icon_full_url"] = iconFullUrl;
    data["thumbnail_full_url"] = thumbnailFullUrl;
    if (storage != null) {
      data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
    if (translations != null) {
      data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Translations1 {
  int? id;
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  dynamic createdAt;
  dynamic updatedAt;

  Translations1(
      {this.id, this.translationableType, this.translationableId, this.locale, this.key, this.value, this.createdAt, this.updatedAt});

  Translations1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    translationableType = json["translationable_type"];
    translationableId = json["translationable_id"];
    locale = json["locale"];
    key = json["key"];
    value = json["value"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["translationable_type"] = translationableType;
    data["translationable_id"] = translationableId;
    data["locale"] = locale;
    data["key"] = key;
    data["value"] = value;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class Storage1 {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  Storage1({this.id, this.dataType, this.dataId, this.key, this.value, this.createdAt, this.updatedAt});

  Storage1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    dataType = json["data_type"];
    dataId = json["data_id"];
    key = json["key"];
    value = json["value"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["data_type"] = dataType;
    data["data_id"] = dataId;
    data["key"] = key;
    data["value"] = value;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class Storage {
  int? id;
  String? dataType;
  String? dataId;
  String? key;
  String? value;
  String? createdAt;
  String? updatedAt;

  Storage({this.id, this.dataType, this.dataId, this.key, this.value, this.createdAt, this.updatedAt});

  Storage.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    dataType = json["data_type"];
    dataId = json["data_id"];
    key = json["key"];
    value = json["value"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["data_type"] = dataType;
    data["data_id"] = dataId;
    data["key"] = key;
    data["value"] = value;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class Unit {
  int? id;
  String? unit;
  String? createdAt;
  String? updatedAt;
  List<Translations>? translations;

  Unit({this.id, this.unit, this.createdAt, this.updatedAt, this.translations});

  Unit.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    unit = json["unit"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    translations = json["translations"] == null ? null : (json["translations"] as List).map((e) => Translations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["unit"] = unit;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    if (translations != null) {
      data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Translations {
  int? id;
  String? translationableType;
  int? translationableId;
  String? locale;
  String? key;
  String? value;
  dynamic createdAt;
  dynamic updatedAt;

  Translations(
      {this.id, this.translationableType, this.translationableId, this.locale, this.key, this.value, this.createdAt, this.updatedAt});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    translationableType = json["translationable_type"];
    translationableId = json["translationable_id"];
    locale = json["locale"];
    key = json["key"];
    value = json["value"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["translationable_type"] = translationableType;
    data["translationable_id"] = translationableId;
    data["locale"] = locale;
    data["key"] = key;
    data["value"] = value;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class Images {
  String? img;
  String? storage;

  Images({this.img, this.storage});

  Images.fromJson(Map<String, dynamic> json) {
    img = json["img"];
    storage = json["storage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["img"] = img;
    data["storage"] = storage;
    return data;
  }
}
