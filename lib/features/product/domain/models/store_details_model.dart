class StoreDetailsModel {
<<<<<<< HEAD
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
=======
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  String? footerText;
  int? minimumOrder;
  int? comission;
  bool? scheduleOrder;
  int? status;
  int? vendorId;
  String? createdAt;
  String? updatedAt;
  bool? freeDelivery;
  String? coverPhoto;
  bool? delivery;
  bool? takeAway;
  bool? itemSection;
  int? tax;
  int? deliveryfeeTax;
  String? taxCal;
  int? zoneId;
  bool? reviewsSection;
  bool? active;
  String? offDay;
  int? selfDeliverySystem;
  bool? posSystem;
  int? minimumShippingCharge;
  String? deliveryTime;
  int? veg;
  int? nonVeg;
  int? orderCount;
  int? totalOrder;
  int? moduleId;
  int? orderPlaceToScheduleInterval;
  int? featured;
  double? perKmShippingCharge;
  bool? prescriptionOrder;
  String? slug;
  int? maximumShippingCharge;
  bool? cutlery;
  String? metaTitle;
  String? metaDescription;
  dynamic metaImage;
  int? announcement;
  dynamic announcementMessage;
  String? storeBusinessModel;
  dynamic packageId;
  dynamic pickupZoneId;
  dynamic comment;
  int? pMargin;
  int? open;
  dynamic distance;
  int? reviewsCommentsCount;
  bool? isRecommended;
  int? minimumStockForWarning;
  bool? halalTagStatus;
  bool? extraPackagingStatus;
  int? extraPackagingAmount;
  List<int>? ratings;
  int? avgRating;
  int? ratingCount;
  int? positiveRating;
  int? totalItems;
  int? totalCampaigns;
  String? currentOpeningTime;
  List<int>? categoryIds;
  List<CategoryDetails>? categoryDetails;
  List<PriceRange>? priceRange;
  bool? gstStatus;
  String? gstCode;
  String? logoFullUrl;
  String? coverPhotoFullUrl;
  dynamic metaImageFullUrl;
  dynamic discount;
  List<Schedules>? schedules;
  List<dynamic>? activeCoupons;
  dynamic storeSub;
  List<Translations1>? translations;
  List<Storage1>? storage;

  StoreDetailsModel({this.id, this.name, this.phone, this.email, this.logo, this.latitude, this.longitude, this.address, this.footerText, this.minimumOrder, this.comission, this.scheduleOrder, this.status, this.vendorId, this.createdAt, this.updatedAt, this.freeDelivery, this.coverPhoto, this.delivery, this.takeAway, this.itemSection, this.tax, this.deliveryfeeTax, this.taxCal, this.zoneId, this.reviewsSection, this.active, this.offDay, this.selfDeliverySystem, this.posSystem, this.minimumShippingCharge, this.deliveryTime, this.veg, this.nonVeg, this.orderCount, this.totalOrder, this.moduleId, this.orderPlaceToScheduleInterval, this.featured, this.perKmShippingCharge, this.prescriptionOrder, this.slug, this.maximumShippingCharge, this.cutlery, this.metaTitle, this.metaDescription, this.metaImage, this.announcement, this.announcementMessage, this.storeBusinessModel, this.packageId, this.pickupZoneId, this.comment, this.pMargin, this.open, this.distance, this.reviewsCommentsCount, this.isRecommended, this.minimumStockForWarning, this.halalTagStatus, this.extraPackagingStatus, this.extraPackagingAmount, this.ratings, this.avgRating, this.ratingCount, this.positiveRating, this.totalItems, this.totalCampaigns, this.currentOpeningTime, this.categoryIds, this.categoryDetails, this.priceRange, this.gstStatus, this.gstCode, this.logoFullUrl, this.coverPhotoFullUrl, this.metaImageFullUrl, this.discount, this.schedules, this.activeCoupons, this.storeSub, this.translations, this.storage});

  StoreDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    phone = json["phone"];
    email = json["email"];
    logo = json["logo"];
    latitude = json["latitude"];
    longitude = json["longitude"];
    address = json["address"];
    footerText = json["footer_text"];
    minimumOrder = json["minimum_order"];
    comission = json["comission"];
    scheduleOrder = json["schedule_order"];
    status = json["status"];
    vendorId = json["vendor_id"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    freeDelivery = json["free_delivery"];
    coverPhoto = json["cover_photo"];
    delivery = json["delivery"];
    takeAway = json["take_away"];
    itemSection = json["item_section"];
    tax = json["tax"];
    deliveryfeeTax = json["deliveryfee_tax"];
    taxCal = json["tax_cal"];
    zoneId = json["zone_id"];
    reviewsSection = json["reviews_section"];
    active = json["active"];
    offDay = json["off_day"];
    selfDeliverySystem = json["self_delivery_system"];
    posSystem = json["pos_system"];
    minimumShippingCharge = json["minimum_shipping_charge"];
    deliveryTime = json["delivery_time"];
    veg = json["veg"];
    nonVeg = json["non_veg"];
    orderCount = json["order_count"];
    totalOrder = json["total_order"];
    moduleId = json["module_id"];
    orderPlaceToScheduleInterval = json["order_place_to_schedule_interval"];
    featured = json["featured"];
    perKmShippingCharge = json["per_km_shipping_charge"];
    prescriptionOrder = json["prescription_order"];
    slug = json["slug"];
    maximumShippingCharge = json["maximum_shipping_charge"];
    cutlery = json["cutlery"];
    metaTitle = json["meta_title"];
    metaDescription = json["meta_description"];
    metaImage = json["meta_image"];
    announcement = json["announcement"];
    announcementMessage = json["announcement_message"];
    storeBusinessModel = json["store_business_model"];
    packageId = json["package_id"];
    pickupZoneId = json["pickup_zone_id"];
    comment = json["comment"];
    pMargin = json["p_margin"];
    open = json["open"];
    distance = json["distance"];
    reviewsCommentsCount = json["reviews_comments_count"];
    isRecommended = json["is_recommended"];
    minimumStockForWarning = json["minimum_stock_for_warning"];
    halalTagStatus = json["halal_tag_status"];
    extraPackagingStatus = json["extra_packaging_status"];
    extraPackagingAmount = json["extra_packaging_amount"];
    avgRating = json["avg_rating"];
    ratingCount = json["rating_count"];
    positiveRating = json["positive_rating"];
    totalItems = json["total_items"];
    totalCampaigns = json["total_campaigns"];
    currentOpeningTime = json["current_opening_time"];
    categoryIds = json["category_ids"] == null ? null : List<int>.from(json["category_ids"]);
    categoryDetails = json["category_details"] == null ? null : (json["category_details"] as List).map((e) => CategoryDetails.fromJson(e)).toList();
    priceRange = json["price_range"] == null ? null : (json["price_range"] as List).map((e) => PriceRange.fromJson(e)).toList();
    gstStatus = json["gst_status"];
    gstCode = json["gst_code"];
    logoFullUrl = json["logo_full_url"];
    coverPhotoFullUrl = json["cover_photo_full_url"];
    metaImageFullUrl = json["meta_image_full_url"];
    discount = json["discount"]==null?null:double.parse(json["discount"].toString());
    schedules = json["schedules"] == null ? null : (json["schedules"] as List).map((e) => Schedules.fromJson(e)).toList();
    activeCoupons = json["active_coupons"] ?? [];
    storeSub = json["store_sub"];
    translations = json["translations"] == null ? null : (json["translations"] as List).map((e) => Translations1.fromJson(e)).toList();
    storage = json["storage"] == null ? null : (json["storage"] as List).map((e) => Storage1.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["phone"] = phone;
    _data["email"] = email;
    _data["logo"] = logo;
    _data["latitude"] = latitude;
    _data["longitude"] = longitude;
    _data["address"] = address;
    _data["footer_text"] = footerText;
    _data["minimum_order"] = minimumOrder;
    _data["comission"] = comission;
    _data["schedule_order"] = scheduleOrder;
    _data["status"] = status;
    _data["vendor_id"] = vendorId;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["free_delivery"] = freeDelivery;
    _data["cover_photo"] = coverPhoto;
    _data["delivery"] = delivery;
    _data["take_away"] = takeAway;
    _data["item_section"] = itemSection;
    _data["tax"] = tax;
    _data["deliveryfee_tax"] = deliveryfeeTax;
    _data["tax_cal"] = taxCal;
    _data["zone_id"] = zoneId;
    _data["reviews_section"] = reviewsSection;
    _data["active"] = active;
    _data["off_day"] = offDay;
    _data["self_delivery_system"] = selfDeliverySystem;
    _data["pos_system"] = posSystem;
    _data["minimum_shipping_charge"] = minimumShippingCharge;
    _data["delivery_time"] = deliveryTime;
    _data["veg"] = veg;
    _data["non_veg"] = nonVeg;
    _data["order_count"] = orderCount;
    _data["total_order"] = totalOrder;
    _data["module_id"] = moduleId;
    _data["order_place_to_schedule_interval"] = orderPlaceToScheduleInterval;
    _data["featured"] = featured;
    _data["per_km_shipping_charge"] = perKmShippingCharge;
    _data["prescription_order"] = prescriptionOrder;
    _data["slug"] = slug;
    _data["maximum_shipping_charge"] = maximumShippingCharge;
    _data["cutlery"] = cutlery;
    _data["meta_title"] = metaTitle;
    _data["meta_description"] = metaDescription;
    _data["meta_image"] = metaImage;
    _data["announcement"] = announcement;
    _data["announcement_message"] = announcementMessage;
    _data["store_business_model"] = storeBusinessModel;
    _data["package_id"] = packageId;
    _data["pickup_zone_id"] = pickupZoneId;
    _data["comment"] = comment;
    _data["p_margin"] = pMargin;
    _data["open"] = open;
    _data["distance"] = distance;
    _data["reviews_comments_count"] = reviewsCommentsCount;
    _data["is_recommended"] = isRecommended;
    _data["minimum_stock_for_warning"] = minimumStockForWarning;
    _data["halal_tag_status"] = halalTagStatus;
    _data["extra_packaging_status"] = extraPackagingStatus;
    _data["extra_packaging_amount"] = extraPackagingAmount;
    if(ratings != null) {
      _data["ratings"] = ratings;
    }
    _data["avg_rating"] = avgRating;
    _data["rating_count"] = ratingCount;
    _data["positive_rating"] = positiveRating;
    _data["total_items"] = totalItems;
    _data["total_campaigns"] = totalCampaigns;
    _data["current_opening_time"] = currentOpeningTime;
    if(categoryIds != null) {
      _data["category_ids"] = categoryIds;
    }
    if(categoryDetails != null) {
      _data["category_details"] = categoryDetails?.map((e) => e.toJson()).toList();
    }
    if(priceRange != null) {
      _data["price_range"] = priceRange?.map((e) => e.toJson()).toList();
    }
    _data["gst_status"] = gstStatus;
    _data["gst_code"] = gstCode;
    _data["logo_full_url"] = logoFullUrl;
    _data["cover_photo_full_url"] = coverPhotoFullUrl;
    _data["meta_image_full_url"] = metaImageFullUrl;
    _data["discount"] = discount;
    if(schedules != null) {
      _data["schedules"] = schedules?.map((e) => e.toJson()).toList();
    }
    if(activeCoupons != null) {
      _data["active_coupons"] = activeCoupons;
    }
    _data["store_sub"] = storeSub;
    if(translations != null) {
      _data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    if(storage != null) {
      _data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
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

class Schedules {
  int? id;
  int? storeId;
  int? day;
  String? openingTime;
  String? closingTime;
  String? createdAt;
  String? updatedAt;

  Schedules({this.id, this.storeId, this.day, this.openingTime, this.closingTime, this.createdAt, this.updatedAt});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    storeId = json["store_id"];
    day = json["day"];
    openingTime = json["opening_time"];
    closingTime = json["closing_time"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["store_id"] = storeId;
    _data["day"] = day;
    _data["opening_time"] = openingTime;
    _data["closing_time"] = closingTime;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    return _data;
  }
}

class PriceRange {
  dynamic minPrice;
  int? maxPrice;
  dynamic unitType;
  dynamic imageFullUrl;
  List<dynamic>? imagesFullUrl;
  dynamic unit;
  List<dynamic>? storage;

  PriceRange({this.minPrice, this.maxPrice, this.unitType, this.imageFullUrl, this.imagesFullUrl, this.unit, this.storage});

  PriceRange.fromJson(Map<String, dynamic> json) {
    minPrice = json["min_price"];
    maxPrice = json["max_price"];
    unitType = json["unit_type"];
    imageFullUrl = json["image_full_url"];
    imagesFullUrl = json["images_full_url"] ?? [];
    unit = json["unit"];
    storage = json["storage"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["min_price"] = minPrice;
    _data["max_price"] = maxPrice;
    _data["unit_type"] = unitType;
    _data["image_full_url"] = imageFullUrl;
    if(imagesFullUrl != null) {
      _data["images_full_url"] = imagesFullUrl;
    }
    _data["unit"] = unit;
    if(storage != null) {
      _data["storage"] = storage;
    }
    return _data;
  }
}

class CategoryDetails {
  int? id;
  String? name;
  String? image;
  int? parentId;
  int? position;
  int? status;
  String? createdAt;
  String? updatedAt;
  int? priority;
  int? moduleId;
  String? catSiteId;
  String? slug;
  int? featured;
  String? imageFullUrl;
  List<Storage>? storage;
  List<Translations>? translations;

  CategoryDetails({this.id, this.name, this.image, this.parentId, this.position, this.status, this.createdAt, this.updatedAt, this.priority, this.moduleId, this.catSiteId, this.slug, this.featured, this.imageFullUrl, this.storage, this.translations});

  CategoryDetails.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];
    parentId = json["parent_id"];
    position = json["position"];
    status = json["status"];
    createdAt = json["created_at"];
    updatedAt = json["updated_at"];
    priority = json["priority"];
    moduleId = json["module_id"];
    catSiteId = json["cat_site_id"];
    slug = json["slug"];
    featured = json["featured"];
    imageFullUrl = json["image_full_url"];
    storage = json["storage"] == null ? null : (json["storage"] as List).map((e) => Storage.fromJson(e)).toList();
    translations = json["translations"] == null ? null : (json["translations"] as List).map((e) => Translations.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    _data["image"] = image;
    _data["parent_id"] = parentId;
    _data["position"] = position;
    _data["status"] = status;
    _data["created_at"] = createdAt;
    _data["updated_at"] = updatedAt;
    _data["priority"] = priority;
    _data["module_id"] = moduleId;
    _data["cat_site_id"] = catSiteId;
    _data["slug"] = slug;
    _data["featured"] = featured;
    _data["image_full_url"] = imageFullUrl;
    if(storage != null) {
      _data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
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
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2
