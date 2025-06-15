class StoresModel {
  int? totalSize;
  String? limit;
  dynamic offset;
  List<Stores>? stores;

  StoresModel({this.totalSize, this.limit, this.offset, this.stores});

  StoresModel.fromJson(Map<String, dynamic> json) {
    totalSize = json["total_size"];
    limit = json["limit"];
    offset = json["offset"];
    stores = json["stores"] == null ? null : (json["stores"] as List).map((e) => Stores.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["total_size"] = totalSize;
    data["limit"] = limit;
    data["offset"] = offset;
    if(stores != null) {
      data["stores"] = stores?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Stores {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? logo;
  String? latitude;
  String? longitude;
  String? address;
  dynamic footerText;
  int? minimumOrder;
  dynamic comission;
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
  dynamic perKmShippingCharge;
  bool? prescriptionOrder;
  String? slug;
  dynamic maximumShippingCharge;
  bool? cutlery;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaImage;
  int? announcement;
  dynamic announcementMessage;
  String? storeBusinessModel;
  dynamic packageId;
  dynamic pickupZoneId;
  dynamic comment;
  dynamic pMargin;
  int? open;
  dynamic distance;
  String? minDeliveryTime;
  int? reviewsCount;
  int? ordersCount;
  List<dynamic>? categoryIds;
  bool? discountStatus;
  List<int>? ratings;
  int? avgRating;
  int? ratingCount;
  int? positiveRating;
  int? totalItems;
  int? totalCampaigns;
  bool? isRecommended;
  bool? halalTagStatus;
  bool? extraPackagingStatus;
  int? extraPackagingAmount;
  String? currentOpeningTime;
  bool? gstStatus;
  String? gstCode;
  String? logoFullUrl;
  String? coverPhotoFullUrl;
  dynamic metaImageFullUrl;
  dynamic discount;
  List<Translations>? translations;
  List<Storage>? storage;
  List<dynamic>? schedules;

  Stores({this.id, this.name, this.phone, this.email, this.logo, this.latitude, this.longitude, this.address, this.footerText, this.minimumOrder, this.comission, this.scheduleOrder, this.status, this.vendorId, this.createdAt, this.updatedAt, this.freeDelivery, this.coverPhoto, this.delivery, this.takeAway, this.itemSection, this.tax, this.deliveryfeeTax, this.taxCal, this.zoneId, this.reviewsSection, this.active, this.offDay, this.selfDeliverySystem, this.posSystem, this.minimumShippingCharge, this.deliveryTime, this.veg, this.nonVeg, this.orderCount, this.totalOrder, this.moduleId, this.orderPlaceToScheduleInterval, this.featured, this.perKmShippingCharge, this.prescriptionOrder, this.slug, this.maximumShippingCharge, this.cutlery, this.metaTitle, this.metaDescription, this.metaImage, this.announcement, this.announcementMessage, this.storeBusinessModel, this.packageId, this.pickupZoneId, this.comment, this.pMargin, this.open, this.distance, this.minDeliveryTime, this.reviewsCount, this.ordersCount, this.categoryIds, this.discountStatus, this.ratings, this.avgRating, this.ratingCount, this.positiveRating, this.totalItems, this.totalCampaigns, this.isRecommended, this.halalTagStatus, this.extraPackagingStatus, this.extraPackagingAmount, this.currentOpeningTime, this.gstStatus, this.gstCode, this.logoFullUrl, this.coverPhotoFullUrl, this.metaImageFullUrl, this.discount, this.translations, this.storage, this.schedules});

  Stores.fromJson(Map<String, dynamic> json) {
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
    minDeliveryTime = json["min_delivery_time"];
    reviewsCount = json["reviews_count"];
    ordersCount = json["orders_count"];
    categoryIds = json["category_ids"] ?? [];
    discountStatus = json["discount_status"];
    ratings = json["ratings"] == null ? null : List<int>.from(json["ratings"]);
    avgRating = json["avg_rating"];
    ratingCount = json["rating_count"];
    positiveRating = json["positive_rating"];
    totalItems = json["total_items"];
    totalCampaigns = json["total_campaigns"];
    isRecommended = json["is_recommended"];
    halalTagStatus = json["halal_tag_status"];
    extraPackagingStatus = json["extra_packaging_status"];
    extraPackagingAmount = json["extra_packaging_amount"];
    currentOpeningTime = json["current_opening_time"];
    gstStatus = json["gst_status"];
    gstCode = json["gst_code"];
    logoFullUrl = json["logo_full_url"];
    coverPhotoFullUrl = json["cover_photo_full_url"];
    metaImageFullUrl = json["meta_image_full_url"];
    discount = json["discount"];
    translations = json["translations"] == null ? null : (json["translations"] as List).map((e) => Translations.fromJson(e)).toList();
    storage = json["storage"] == null ? null : (json["storage"] as List).map((e) => Storage.fromJson(e)).toList();
    schedules = json["schedules"] ?? [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["logo"] = logo;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["address"] = address;
    data["footer_text"] = footerText;
    data["minimum_order"] = minimumOrder;
    data["comission"] = comission;
    data["schedule_order"] = scheduleOrder;
    data["status"] = status;
    data["vendor_id"] = vendorId;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["free_delivery"] = freeDelivery;
    data["cover_photo"] = coverPhoto;
    data["delivery"] = delivery;
    data["take_away"] = takeAway;
    data["item_section"] = itemSection;
    data["tax"] = tax;
    data["deliveryfee_tax"] = deliveryfeeTax;
    data["tax_cal"] = taxCal;
    data["zone_id"] = zoneId;
    data["reviews_section"] = reviewsSection;
    data["active"] = active;
    data["off_day"] = offDay;
    data["self_delivery_system"] = selfDeliverySystem;
    data["pos_system"] = posSystem;
    data["minimum_shipping_charge"] = minimumShippingCharge;
    data["delivery_time"] = deliveryTime;
    data["veg"] = veg;
    data["non_veg"] = nonVeg;
    data["order_count"] = orderCount;
    data["total_order"] = totalOrder;
    data["module_id"] = moduleId;
    data["order_place_to_schedule_interval"] = orderPlaceToScheduleInterval;
    data["featured"] = featured;
    data["per_km_shipping_charge"] = perKmShippingCharge;
    data["prescription_order"] = prescriptionOrder;
    data["slug"] = slug;
    data["maximum_shipping_charge"] = maximumShippingCharge;
    data["cutlery"] = cutlery;
    data["meta_title"] = metaTitle;
    data["meta_description"] = metaDescription;
    data["meta_image"] = metaImage;
    data["announcement"] = announcement;
    data["announcement_message"] = announcementMessage;
    data["store_business_model"] = storeBusinessModel;
    data["package_id"] = packageId;
    data["pickup_zone_id"] = pickupZoneId;
    data["comment"] = comment;
    data["p_margin"] = pMargin;
    data["open"] = open;
    data["distance"] = distance;
    data["min_delivery_time"] = minDeliveryTime;
    data["reviews_count"] = reviewsCount;
    data["orders_count"] = ordersCount;
    if(categoryIds != null) {
      data["category_ids"] = categoryIds;
    }
    data["discount_status"] = discountStatus;
    if(ratings != null) {
      data["ratings"] = ratings;
    }
    data["avg_rating"] = avgRating;
    data["rating_count"] = ratingCount;
    data["positive_rating"] = positiveRating;
    data["total_items"] = totalItems;
    data["total_campaigns"] = totalCampaigns;
    data["is_recommended"] = isRecommended;
    data["halal_tag_status"] = halalTagStatus;
    data["extra_packaging_status"] = extraPackagingStatus;
    data["extra_packaging_amount"] = extraPackagingAmount;
    data["current_opening_time"] = currentOpeningTime;
    data["gst_status"] = gstStatus;
    data["gst_code"] = gstCode;
    data["logo_full_url"] = logoFullUrl;
    data["cover_photo_full_url"] = coverPhotoFullUrl;
    data["meta_image_full_url"] = metaImageFullUrl;
    data["discount"] = discount;
    if(translations != null) {
      data["translations"] = translations?.map((e) => e.toJson()).toList();
    }
    if(storage != null) {
      data["storage"] = storage?.map((e) => e.toJson()).toList();
    }
    if(schedules != null) {
      data["schedules"] = schedules;
    }
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