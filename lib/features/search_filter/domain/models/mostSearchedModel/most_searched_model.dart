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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["total_size"] = totalSize;
    _data["limit"] = limit;
    _data["offset"] = offset;
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return _data;
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

  Products({this.id, this.name, this.description, this.image, this.categoryId, this.categoryIds, this.variations, this.addOns, this.attributes, this.choiceOptions, this.pMargin, this.cost, this.price, this.catExclude, this.storeExclude, this.tax, this.taxClassId, this.taxCal, this.taxType, this.discount, this.discountType, this.availableTimeStarts, this.availableTimeEnds, this.veg, this.status, this.storeId, this.createdAt, this.updatedAt, this.orderCount, this.avgRating, this.ratingCount, this.moduleId, this.itemSiteId, this.stock, this.unitId, this.images, this.foodVariations, this.slug, this.recommended, this.organic, this.maximumCartQuantity, this.isApproved, this.isHalal, this.itemCode, this.storeSiteId, this.tempAvailable, this.moduleType, this.storeName, this.isCampaign, this.zoneId, this.flashSale, this.storeDiscount, this.scheduleOrder, this.deliveryTime, this.freeDelivery, this.unit, this.minDeliveryTime, this.maxDeliveryTime, this.commonConditionId, this.brandId, this.isBasic, this.isPrescriptionRequired, this.halalTagStatus, this.nutritionsName, this.allergiesName, this.genericName, this.unitType, this.imageFullUrl, this.imagesFullUrl, this.storage, this.translations, this.module, this.ecommerceItemDetails});

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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["description"] = description;
    _data["image"] = image;
    _data["category_id"] = categoryId;
    if(categoryIds != null) {
      _data["category_ids"] = categoryIds;
    }
    if(variations != null) {
      _data["variations"] = variations;
    }
    if(addOns != null) {
      _data["add_ons"] = addOns;
    }
    if(attributes != null) {
      _data["attributes"] = attributes;
    }
    if(choiceOptions != null) {
      _data["choice_options"] = choiceOptions;
    }
    _data["p_margin"] = pMargin;
    _data["cost"] = cost;
    _data["price"] = price;
    _data["cat_exclude"] = catExclude;
    _data["store_exclude"] = storeExclude;
    _data["tax"] = tax;
    _data["tax_class_id"] = taxClassId;
    _data["tax_cal"] = taxCal;
    _data["tax_type"] = taxType;
    _data["discount"] = discount;
    _data["discount_type"] = discountType;
    _data["available_time_starts"] = availableTimeStarts;
    _data["available_time_ends"] = availableTimeEnds;
    _data["veg"] = veg;
    _data["status"] = status;
    _data["store_id"] = storeId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["order_count"] = orderCount;
    _data["avg_rating"] = avgRating;
    _data["rating_count"] = ratingCount;
    _data["module_id"] = moduleId;
    _data["item_site_id"] = itemSiteId;
    _data["stock"] = stock;
    _data["unit_id"] = unitId;
    if(images != null) {
      _data["images"] = images?.map((e) => e.toJson()).toList();
    }
    if(foodVariations != null) {
      _data["food_variations"] = foodVariations;
    }
    _data["slug"] = slug;
    _data["recommended"] = recommended;
    _data["organic"] = organic;
    _data["maximum_cart_quantity"] = maximumCartQuantity;
    _data["is_approved"] = isApproved;
    _data["is_halal"] = isHalal;
    _data["item_code"] = itemCode;
    _data["store_site_id"] = storeSiteId;
    _data["temp_available"] = tempAvailable;
    _data["module_type"] = moduleType;
    _data["store_name"] = storeName;
    _data["is_campaign"] = isCampaign;
    _data["zone_id"] = zoneId;
    _data["flash_sale"] = flashSale;
    _data["store_discount"] = storeDiscount;
    _data["schedule_order"] = scheduleOrder;
    _data["delivery_time"] = deliveryTime;
    _data["free_delivery"] = freeDelivery;
    if(unit != null) {
      _data["unit"] = unit?.toJson();
    }
    _data["min_delivery_time"] = minDeliveryTime;
    _data["max_delivery_time"] = maxDeliveryTime;
    _data["common_condition_id"] = commonConditionId;
    _data["brand_id"] = brandId;
    _data["is_basic"] = isBasic;
    _data["is_prescription_required"] = isPrescriptionRequired;
    _data["halal_tag_status"] = halalTagStatus;
    if(nutritionsName != null) {
      _data["nutritions_name"] = nutritionsName;
    }
    if(allergiesName != null) {
      _data["allergies_name"] = allergiesName;
    }
    if(genericName != null) {
      _data["generic_name"] = genericName;
    }
    _data["unit_type"] = unitType;
    _data["image_full_url"] = imageFullUrl;
    if(imagesFullUrl != null) {
      _data["images_full_url"] = imagesFullUrl;
    }
    if(storage != null) {
      _data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
    if(translations != null) {
      _data["translations"] = translations;
    }
    if(module != null) {
      _data["module"] = module?.toJson();
    }
    _data["ecommerce_item_details"] = ecommerceItemDetails;
    return _data;
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

  Module({this.id, this.moduleName, this.moduleType, this.thumbnail, this.status, this.storesCount, this.createdAt, this.updatedAt, this.icon, this.themeId, this.description, this.allZoneService, this.iconFullUrl, this.thumbnailFullUrl, this.storage, this.translations});

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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["module_name"] = moduleName;
    _data["module_type"] = moduleType;
    _data["thumbnail"] = thumbnail;
    _data["status"] = status;
    _data["stores_count"] = storesCount;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["icon"] = icon;
    _data["theme_id"] = themeId;
    _data["description"] = description;
    _data["all_zone_service"] = allZoneService;
    _data["icon_full_url"] = iconFullUrl;
    _data["thumbnail_full_url"] = thumbnailFullUrl;
    if(storage != null) {
      _data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
    if(translations != null) {
      _data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    return _data;
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

  Translations1({this.id, this.translationableType, this.translationableId, this.locale, this.key, this.value, this.createdAt, this.updatedAt});

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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["translationable_type"] = translationableType;
    _data["translationable_id"] = translationableId;
    _data["locale"] = locale;
    _data["key"] = key;
    _data["value"] = value;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["data_type"] = dataType;
    _data["data_id"] = dataId;
    _data["key"] = key;
    _data["value"] = value;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["data_type"] = dataType;
    _data["data_id"] = dataId;
    _data["key"] = key;
    _data["value"] = value;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["unit"] = unit;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    if(translations != null) {
      _data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    return _data;
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

  Translations({this.id, this.translationableType, this.translationableId, this.locale, this.key, this.value, this.createdAt, this.updatedAt});

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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["translationable_type"] = translationableType;
    _data["translationable_id"] = translationableId;
    _data["locale"] = locale;
    _data["key"] = key;
    _data["value"] = value;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["img"] = img;
    _data["storage"] = storage;
    return _data;
  }
}